void setup_button() {

  noStroke();
  //-------------------------------------Btn Start
  btn_single = cp5.addButton("btn_single_graph")
    .setValue(0)
    .setId(41)
    .setPosition(14, 521)
    .setSize(144, 63)
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
    ;
  btn_calibrate.getColor().setBackground(color(#993B85, 8))
    ;
  btn_calibrate.setCaptionLabel("Calibrate")
    ;

  btn_graph = cp5.addButton("btn_graph")
    .setValue(0)
    .setId(44)
    .setPosition(494, 521)
    .setSize(144, 63)
    ;
  btn_graph.getColor().setBackground(color(#993B85, 8))
    ;
  btn_graph.setCaptionLabel("Play")
    ;
    
    btn_record = cp5.addButton("btn_record")
    .setValue(0)
    .setId(45)
    .setPosition(654, 521)
    .setSize(144, 63)
    ;
  btn_record.getColor().setBackground(color(#993B85, 8))
    ;
  btn_record.setCaptionLabel("Record")
    ;
}
