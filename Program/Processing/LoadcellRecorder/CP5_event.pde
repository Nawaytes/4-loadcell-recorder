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
    } else if (getID == 42) {
      hideAll();
      graph_loadcell1.setVisible(true);
      graph_loadcell2.setVisible(true);
      graph_loadcell3.setVisible(true);
      graph_loadcell4.setVisible(true);
      img_master = loadImage("multi_graph.png");
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
    } else if (getID == 44) {
    } else if (getID == 45) {
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
