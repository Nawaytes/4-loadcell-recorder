void setup_graph() {
  graph_master = cp5.addChart("loadcell_master")
    .setPosition(22, 118)
    .setSize(686, 368)
    .setRange(0, 10000)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    ;
  graph_master.getColor().setBackground(color(#003366));
  graph_master.setCaptionLabel(" ");

  graph_master.addDataSet("loadcell_m1");
  graph_master.setColors("loadcell_m1", color(yellow_), color(yellow_));
  graph_master.updateData("loadcell_m1", new float[1000]);
  
  graph_master.addDataSet("loadcell_m2");
  graph_master.setColors("loadcell_m2", color(green_), color(green_));
  graph_master.updateData("loadcell_m2", new float[1000]);
  
  graph_master.addDataSet("loadcell_m3");
  graph_master.setColors("loadcell_m3", color(blue_), color(blue_));
  graph_master.updateData("loadcell_m3", new float[1000]);
  
  graph_master.addDataSet("loadcell_m4");
  graph_master.setColors("loadcell_m4", color(pink_), color(pink_));
  graph_master.updateData("loadcell_m4", new float[1000]);
  //--------------------------------------------------------------------------------------------------
  
  graph_loadcell1 = cp5.addChart("graph_loadcell_1")
    .setPosition(22, 118)
    .setSize(686, 368)
    .setRange(0, 10000)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    ;
  graph_loadcell1.getColor().setBackground(color(#003366));
  graph_loadcell1.setCaptionLabel(" ");

  graph_loadcell1.addDataSet("loadcell_1");
  graph_loadcell1.setColors("loadcell_1", color(yellow_), color(yellow_));
  graph_loadcell1.updateData("loadcell_1", new float[1000]);
  graph_loadcell1.setVisible(false);
  //-------------------------------------------------------------------------------------------------- 1
  
  graph_loadcell2 = cp5.addChart("graph_loadcell_2")
    .setPosition(392, 118)
    .setSize(315, 180)
    .setRange(0, 10000)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    ;
  graph_loadcell2.getColor().setBackground(color(#003366));
  graph_loadcell2.setCaptionLabel(" ");

  graph_loadcell2.addDataSet("loadcell_2");
  graph_loadcell2.setColors("loadcell_2", color(yellow_), color(yellow_));
  graph_loadcell2.updateData("loadcell_2", new float[1000]);
  graph_loadcell2.setVisible(false);
  //-------------------------------------------------------------------------------------------------- 2
  
  graph_loadcell3 = cp5.addChart("graph_loadcell_3")
    .setPosition(49, 302)
    .setSize(315, 180)
    .setRange(0, 10000)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    ;
  graph_loadcell3.getColor().setBackground(color(#003366));
  graph_loadcell3.setCaptionLabel(" ");

  graph_loadcell3.addDataSet("loadcell_3");
  graph_loadcell3.setColors("loadcell_3", color(yellow_), color(yellow_));
  graph_loadcell3.updateData("loadcell_3", new float[1000]);
  graph_loadcell3.setVisible(false);
  //-------------------------------------------------------------------------------------------------- 3
  
  graph_loadcell4 = cp5.addChart("graph_loadcell_4")
    .setPosition(392, 302)
    .setSize(315, 180)
    .setRange(0, 10000)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    ;
  graph_loadcell4.getColor().setBackground(color(#003366));
  graph_loadcell4.setCaptionLabel(" ");

  graph_loadcell4.addDataSet("loadcell_4");
  graph_loadcell4.setColors("loadcell_4", color(yellow_), color(yellow_));
  graph_loadcell4.updateData("loadcell_4", new float[1000]);
  graph_loadcell4.setVisible(false);
  //-------------------------------------------------------------------------------------------------- 4
  
  
}
