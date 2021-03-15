int posxcom = 700;
int posycom = -45;

String shortifyPortName(String portName, int maxlen)  
{
  String shortName = portName;
  if (shortName.startsWith("/dev/")) shortName = shortName.substring(5);  
  if (shortName.startsWith("tty.")) shortName = shortName.substring(4); // get rid off leading tty. part of device name
  if (portName.length()>maxlen) shortName = shortName.substring(0, (maxlen-1)/2) + "~" +shortName.substring(shortName.length()-(maxlen-(maxlen-1)/2));
  if (shortName.startsWith("cu.")) shortName = "";// only collect the corresponding tty. devices
  return shortName;
}

void setup_UART()
{ 

  //Comport List Selection                   
  commListbox = cp5.addListBox("portComList", posxcom+5, posycom+85, 150, 240); // make a listbox and populate it with the available comm ports
  commListbox.setCaptionLabel("PORT COM");
  commListbox.setColorBackground(black_);
  commListbox.setItemHeight(15);
  commListbox.setBarHeight(15);
  commListbox.close();

  for (int i=0; i<Serial.list ().length; i++) 
  {

    String pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn, i); // addItem(name,value)
    commListMax = i;
  }
  fill(#000000);
  commListbox.addItem("Close Comm", ++commListMax); // addItem(name,value)
  // text label for which comm port selected
  txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom", "No Port Selected", posxcom+5, posycom+62); // textlabel(name,text,x,y)
}

void Send_To_Arduino()
{
  if (mode == 0) {
    if (serial_conect==1) 
    {  

      //indicator connect
      fill(0, 255, 0);
      ellipse(posxcom+130, posycom+67, 10, 10);
      noFill();
      //
      //    if (TuningPID==true) {
      //      Tuning_PID_param();
      //    }
    } else 
    {//indicator no connect
      fill(128, 0, 0);
      ellipse(posxcom+130, posycom+67, 10, 10);
      noFill();
    }
  }
}

void InitSerial(float portValue) 
{
  if (portValue < commListMax) {
    String portPos = Serial.list()[int(portValue)];
    txtlblWhichcom.setValue("Connected = " + shortifyPortName(portPos, 8));
    serial = new Serial(this, portPos, 115200);
    serial.bufferUntil('\n');
    serial_conect=1;
  } else 
  {
    txtlblWhichcom.setValue("Not Connected");
    serial.clear();
    serial.stop();
    serial_conect=0;
  }
}
int x = 0;
void serialEvent (Serial usbPort) 
{

  try {
    String usbString = usbPort.readStringUntil ('\n');

    if (usbString != null) 
    {
      usbString = trim(usbString);
      json = parseJSONObject(usbString);
      println(usbString); //--> for debuging


      int id = json.getInt("id");
      if (id == 1) {
        _LOADCELL1 = json.getFloat("l1");
        _LOADCELL2 = json.getFloat("l2");
        _LOADCELL3 = json.getFloat("l3");
        _LOADCELL4 = json.getFloat("l4");
        graph_master.push("loadcell_m1", _LOADCELL1);
        graph_master.push("loadcell_m2", _LOADCELL2);
        graph_master.push("loadcell_m3", _LOADCELL3);
        graph_master.push("loadcell_m4", _LOADCELL4);
        sum_loadcell = _LOADCELL1 + _LOADCELL2 + _LOADCELL3 + _LOADCELL4;
        graph_loadcell1.push("loadcell_1", sum_loadcell);

        

        if (is_recording == true) {
          TableRow newRow = table.addRow();
          newRow.setLong("time", millis() - alpha_millis);
          newRow.setFloat("lc1", _LOADCELL1);
          newRow.setFloat("lc2", _LOADCELL2);
          newRow.setFloat("lc3", _LOADCELL3);
          newRow.setFloat("lc4", _LOADCELL4);
        }
      } else if (id == 5) {
        lc_idx = json.getInt("lc");
        txt_gain.setValue(String.valueOf(json.getFloat("gain"))); 
        txt_current_mass.setValue(String.valueOf(json.getFloat("mass")));
      }
    }

    //float data[] = float(split(usbString, ','));
    //for (int sensorNum = 1; sensorNum < data.length; sensorNum++) { println(sensorNum + " " + data[sensorNum]);  } //--> for debuging
    /*
    Format paket
     HEADER#DATA1#DATA2#DATA3 ...
     24 = data grafik
     24#PRESSURE#FLOW#VOLUME
     */
    //PRESSURE_=data[1];
    //FLOW_=data[2];
    //VOLUME_=data[0];
    // exhale_time=data[4];

    //if (data[0] == 59)
    //{
    //  _LOADCELL1 = data[1];
    //  _LOADCELL2 = data[2];
    //  _LOADCELL3 = data[3];
    //  _LOADCELL4 = data[4];
    //  println(_LOADCELL1);
    //}
  }
  catch(RuntimeException e)
  {
    println("Serial event is not null");
    println(e);
  }
}
