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
      if (serial_conect!=0)
        serial.write("{\"id\":1}");
      println("{\"id\":1}");
    } else if (getID == 42) {
      hideAll();
      graph_loadcell1.setVisible(true);
      graph_loadcell2.setVisible(true);
      graph_loadcell3.setVisible(true);
      graph_loadcell4.setVisible(true);
      img_master = loadImage("multi_graph.png");
      if (serial_conect!=0)
        serial.write("{\"id\":1}");
      println("{\"id\":1}");
    } else if (getID == 43) {
      hideAll();
      btn_loadcell1.setVisible(true);
      btn_loadcell2.setVisible(true);
      btn_loadcell3.setVisible(true);
      btn_loadcell4.setVisible(true);
      btn_rst.setVisible(true);
      btn_clbr.setVisible(true);
      txt_actual_mass.setVisible(true);
      txt_current_mass.setVisible(true);
      txt_gain.setVisible(true);
      img_master = loadImage("calibrate_loadcell.png");
      if (serial_conect!=0){
        serial.write("{\"id\":5,\"lc\":1}");
        txt_gain.setValue("1232");
      }
      println("{\"id\":5,\"lc\":1}");
    } else if (getID == 44) {
    } else if (getID == 45) {
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
