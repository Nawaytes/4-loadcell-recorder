#include <Arduino.h>
#include <Thread.h>
#include <ThreadController.h>
#include "HX711.h"
#include <LiquidCrystal_I2C.h>
#include <ArduinoJson.h>
#include "header.h"
#include "EEPROMAnything.h"

HX711 loadcell1, loadcell2, loadcell3, loadcell4;

struct config_t
{
    double scale1;
    double scale2;
    double scale3;
    double scale4;
} config;

void setup()
{
  // put your setup code here, to run once:
  loadcell1.begin(DT1, SCK1);
  loadcell2.begin(DT2, SCK2);
  loadcell3.begin(DT3, SCK3);
  loadcell4.begin(DT4, SCK4);

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
  while (!Serial) {
    ;
  }
  Serial.println("TESTER  GAN");
  Serial.println(config.scale1);
  Serial.println(config.scale2);
  Serial.println(config.scale3);
  Serial.println(config.scale4);
}

void loop()
{
  // put your main code here, to run repeatedly:

  
}