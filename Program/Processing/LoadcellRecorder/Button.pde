void setup_button() {

  noStroke();
  //-------------------------------------Btn Start
  btn_single = cp5.addButton("btn_single_graph")
    .setValue(0)
    .setId(41)
    .setPosition(14, 521)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_single.getColor().setBackground(color(#993B85, 8))
    ;
  btn_single.setCaptionLabel("Single Graph")
    ;

  btn_4graph = cp5.addButton("btn_4graph")
    .setValue(0)
    .setId(42)
    .setPosition(174, 521)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_4graph.getColor().setBackground(color(#993B85, 8))
    ;
  btn_4graph.setCaptionLabel("Multi Graph")
    ;

  btn_calibrate = cp5.addButton("btn_calibrate")
    .setValue(0)
    .setId(43)
    .setPosition(334, 521)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_calibrate.getColor().setBackground(color(#993B85, 8))
    ;
  btn_calibrate.setCaptionLabel("Zero")
    ;

  btn_graph = cp5.addButton("btn_graph")
    .setValue(0)
    .setId(44)
    .setPosition(494, 521)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_graph.getColor().setBackground(color(#993B85, 8))
    ;
  btn_graph.setCaptionLabel("stop")
    ;

  btn_record = cp5.addButton("btn_record")
    .setValue(0)
    .setId(45)
    .setPosition(654, 521)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_record.getColor().setBackground(color(#993B85, 8))
    ;
  btn_record.setCaptionLabel("Record")
    ;
  //-----------------------------------------------------------------------------------

  btn_loadcell1 = cp5.addButton("btn_loadcell1")
    .setValue(0)
    .setId(51)
    .setPosition(14, 155)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_loadcell1.getColor().setBackground(color(#993B85, 8))
    ;
  btn_loadcell1.setCaptionLabel("Loadcell 1");
  btn_loadcell1.setVisible(false);

  //----------------------------------------------------------------------------------- 1

  btn_loadcell2 = cp5.addButton("btn_loadcell2")
    .setValue(0)
    .setId(52)
    .setPosition(14, 232)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_loadcell2.getColor().setBackground(color(#993B85, 8))
    ;
  btn_loadcell2.setCaptionLabel("Loadcell 2");
  ;
  btn_loadcell2.setVisible(false);
  //----------------------------------------------------------------------------------- 2

  btn_loadcell3 = cp5.addButton("btn_loadcell3")
    .setValue(0)
    .setId(53)
    .setPosition(14, 309)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_loadcell3.getColor().setBackground(color(#993B85, 8))
    ;
  btn_loadcell3.setCaptionLabel("Loadcell 3");
  ;
  btn_loadcell3.setVisible(false);
  //----------------------------------------------------------------------------------- 3

  btn_loadcell4 = cp5.addButton("btn_loadcell4")
    .setValue(0)
    .setId(54)
    .setPosition(14, 386)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_loadcell4.getColor().setBackground(color(#993B85, 8))
    ;
  btn_loadcell4.setCaptionLabel("Loadcell 4");
  ;
  btn_loadcell4.setVisible(false);
  //----------------------------------------------------------------------------------- 4

  btn_rst = cp5.addButton("btn_reset")
    .setValue(0)
    .setId(55)
    .setPosition(469, 386)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_rst.getColor().setBackground(color(#993B85, 8))
    ;
  btn_rst.setCaptionLabel("Reset");
  ;
  btn_rst.setVisible(false);
  //----------------------------------------------------------------------------------- rst

  btn_clbr = cp5.addButton("btn_exe_calibrate")
    .setValue(0)
    .setId(56)
    .setPosition(654, 386)
    .setSize(144, 63)
    .setFont(createFont("verdana", 16))
    ;
  btn_clbr.getColor().setBackground(color(#993B85, 8))
    ;
  btn_clbr.setCaptionLabel("Calibrate");
  ;
  btn_clbr.setVisible(false);
  //----------------------------------------------------------------------------------- calibrate
}
