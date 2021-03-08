#include <Arduino.h>
#include <Thread.h>
#include <ThreadController.h>
#include "HX711.h"
#include <LiquidCrystal_I2C.h>
#include <ArduinoJson.h>
#include "header.h"
#include "EEPROMAnything.h"
#include "func.h"

HX711 loadcell1, loadcell2, loadcell3, loadcell4;

int mode = SENDALL;
int cur_lc;
float cur_gain;
DynamicJsonDocument doc(1024);

struct config_t
{
  double scale1;
  double scale2;
  double scale3;
  double scale4;
} config;
/*
JSON STATUS
0   setup
1   send all
*/
void send_all(float l1, float l2, float l3, float l4)
{
  Serial.print("{\"id\":1");
  Serial.print(",\"l1\":");
  Serial.print(l1);
  Serial.print(",\"l2\":");
  Serial.print(l2);
  Serial.print(",\"l3\":");
  Serial.print(l3);
  Serial.print(",\"l4\":");
  Serial.print(l4);
  Serial.print("}\r\n");
}

void setup()
{
  // put your setup code here, to run once:
  loadcell1.begin(DT1, SCK1);
  loadcell2.begin(DT2, SCK2);
  loadcell3.begin(DT3, SCK3);
  loadcell4.begin(DT4, SCK4);
  config.scale1 = 7.45;
  config.scale2 = 1;
  config.scale3 = 1;
  config.scale4 = 1;
  EEPROM_writeAnything(0, config);

  loadcell1.set_scale(config.scale1);
  loadcell1.tare();
  loadcell2.set_scale(config.scale2);
  loadcell2.tare();
  loadcell3.set_scale(config.scale3);
  loadcell3.tare();
  loadcell4.set_scale(config.scale4);
  loadcell4.tare();
  EEPROM_readAnything(0, config);

  Serial.begin(115200);
  while (!Serial)
  {
    ;
  }
  Serial.println("{\"id\":0,\"status\":1}");
  // Serial.println(config.scale1);
  // Serial.println(config.scale2);
  // Serial.println(config.scale3);
  // Serial.println(config.scale4);
}

void loop()
{
  // put your main code here, to run repeatedly:

  if (Serial.available())
  {
    String temp = Serial.readStringUntil('\n');
    deserializeJson(doc, temp);

    int id = doc["id"];

    if (id == 5)
    {
      mode = CALIBRATE;
      float param[4] = {config.scale1, config.scale2, config.scale3, config.scale4};
      int lc = doc["lc"];
      cur_lc = lc;
      cur_gain = param[lc - 1];
    }
    else if (id == 1)
    {
      mode = SENDALL;
    }
  }
  if (mode == SENDALL)
  {
    send_all(loadcell1.get_units(), loadcell2.get_units(), loadcell3.get_units(), loadcell4.get_units());
  }
  else if (mode = CALIBRATE)
  {
    float lc_units;
    float k_gain;
    k_gain = cur_gain;
    if (cur_lc == 1)
      lc_units = loadcell1.get_units();
    else if (cur_lc == 2)
      lc_units = loadcell2.get_units();
    else if (cur_lc == 3)
      lc_units = loadcell3.get_units();
    else if (cur_lc == 4)
      lc_units = loadcell4.get_units();

    Serial.print("{\"id\":5,");
    Serial.print("\"gain\":");
    Serial.print(k_gain);
    Serial.print(",\"mass\":");
    Serial.print(lc_units);
    Serial.println("}");
  }
}