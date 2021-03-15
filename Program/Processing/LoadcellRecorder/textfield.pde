void setup_textfield() {
  txt_actual_mass = cp5.addTextfield("actual_mass")
    .setPosition(469, 155)
    .setSize(329, 64)
    .setFont(createFont("verdana", 30))
    .setAutoClear(false)
    .setCaptionLabel(" ")
    ;
  txt_actual_mass.setVisible(false);

  txt_current_mass = cp5.addTextfield("Current_mass")
    .setPosition(469, 232)
    .setSize(329, 64)
    .setFont(createFont("verdana", 30))
    .setAutoClear(false)
    .setCaptionLabel(" ")
    ;
  txt_current_mass.setVisible(false);

  txt_gain = cp5.addTextfield("k_gain")
    .setPosition(469, 309)
    .setSize(329, 64)
    .setFont(createFont("verdana", 30))
    .setAutoClear(false)
    .setCaptionLabel(" ")
    .setUpdate(true);
    ;
  txt_gain.setVisible(false);
}
