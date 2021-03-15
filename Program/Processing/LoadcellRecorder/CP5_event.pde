void controlEvent(ControlEvent theControlEvent)
{
  if (theControlEvent.isController()) {
    println(theControlEvent.getController().getName());
    println(theControlEvent.getController().getId());
    String controllerName = theControlEvent.getController().getName();
    int getID=theControlEvent.getController().getId();
    if (controllerName=="portComList") {
      println("smile");
      InitSerial(theControlEvent.getController().getValue());
      return;
    }

    if (getID == 41) {
      hideAll();
      graph_master.setVisible(true);
      img_master = loadImage("bg.png");
      //if (serial_conect!=0)
      //  serial.write("{\"id\":1}");
      //println("{\"id\":1}");
    } else if (getID == 42) {
      hideAll();
      graph_loadcell1.setVisible(true);
      //graph_loadcell2.setVisible(true);
      //graph_loadcell3.setVisible(true);
      //graph_loadcell4.setVisible(true);
      img_master = loadImage("multi_graph.png");
      //if (serial_conect!=0)
      //  serial.write("{\"id\":42}");
      //println("{\"id\":42}");
    } else if (getID == 43) {
      //hideAll();
      //btn_loadcell1.setVisible(true);
      //btn_loadcell2.setVisible(true);
      //btn_loadcell3.setVisible(true);
      //btn_loadcell4.setVisible(true);
      //btn_rst.setVisible(true);
      //btn_clbr.setVisible(true);
      //txt_actual_mass.setVisible(true);
      //txt_current_mass.setVisible(true);
      //txt_gain.setVisible(true);
      //img_master = loadImage("calibrate_loadcell.png");
      //if (serial_conect!=0) {
      //  serial.write("{\"id\":5,\"lc\":1}");
      //  txt_gain.setValue("1232");
      if (serial_conect!=0)
        serial.write("{\"id\":43}");
      println("{\"id\":43}");
    } else if (getID == 44) {//tare
      //if (serial_conect!=0)
      //  serial.write("{\"id\":53,\"lc\":1}");
      //println("{\"id\":53,\"lc\":1}");
    } else if (getID == 45) {
      if (serial_conect==0)
        return;
      if (btn_graph.getLabel() == "stop") {
        print("record");
        alpha_millis = millis();
        table = new Table();
        table.addColumn("time");
        table.addColumn("lc1");
        table.addColumn("lc2");
        table.addColumn("lc3");
        table.addColumn("lc4");
        btn_graph.setLabel("recording");
        is_recording = true;
      } else {
        btn_graph.setLabel("stop");
        int d = day();    // Values from 1 - 31
        int m = month();  // Values from 1 - 12
        int y = year();   // 2003, 2004, 2005, etc.
        int a = hour();
        int b = minute();
        int c = second();

        String fname = "LC"+String.valueOf(d)+String.valueOf(m)+String.valueOf(y)+"-"+String.valueOf(a)+String.valueOf(b)+String.valueOf(c);
        println(fname);
        saveTable(table, "data/"+fname+".csv");
        is_recording = false;
      }
    } else if (getID == 51) {
      if (serial_conect!=0)
        serial.write("{\"id\":5,\"lc\":1}");
      println("{\"id\":5,\"lc\":1}");
    } else if (getID == 52) {
      if (serial_conect!=0)
        serial.write("{\"id\":5,\"lc\":2}");
      println("{\"id\":5,\"lc\":2}");
    } else if (getID == 53) {
      if (serial_conect!=0)
        serial.write("{\"id\":5,\"lc\":3}");
      println("{\"id\":5,\"lc\":3}");
    } else if (getID == 54) {
      if (serial_conect!=0)
        serial.write("{\"id\":5,\"lc\":4}");
      println("{\"id\":5,\"lc\":4}");
    } else if (getID == 55) {
      if (serial_conect!=0)
        serial.write("{\"id\":51,\"lc\":" + lc_idx + "}");
      println("{\"id\":51,\"lc\":" + lc_idx + "}");
    } else if (getID == 56) { //calibrating
      if (serial_conect!=0) {
        float real_mass = float(txt_actual_mass.getText());
        float curr_mass = float(txt_current_mass.getText());
        float gain = curr_mass / real_mass;
        serial.write("{\"id\":52,\"lc\":" + lc_idx + ",\"gain\":"+gain+"}");
      }
    }
  }
}

void hideAll() {
  graph_master.setVisible(false);
  graph_loadcell1.setVisible(false);
  graph_loadcell2.setVisible(false);
  graph_loadcell3.setVisible(false);
  graph_loadcell4.setVisible(false);
  btn_loadcell1.setVisible(false);
  btn_loadcell2.setVisible(false);
  btn_loadcell3.setVisible(false);
  btn_loadcell4.setVisible(false);
  btn_rst.setVisible(false);
  btn_clbr.setVisible(false);
  txt_actual_mass.setVisible(false);
  txt_current_mass.setVisible(false);
  txt_gain.setVisible(false);
}
