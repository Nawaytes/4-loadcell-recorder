import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library

Serial serial;
ControlP5 cp5;
PImage img_master, img_multiG, img_calibrate;
Chart graph_master;
Chart graph_loadcell1, graph_loadcell2, graph_loadcell3, graph_loadcell4;

int serial_conect = 0;
int commListMax;
int[] data = null;

Textlabel txtlblWhichcom; 
ListBox commListbox;
ListBox portlist;
int mode = 0;
color yellow_ = color(200, 200, 20), green_ = color(46, 209, 2), red_ = color(120, 30, 30), blue_ = color (0, 102, 200);
color white_ = color(255, 255, 255), black_ = color(0, 0, 0), pink_ = color(255, 0, 255), grey_ = color(#636e72);

float _LOADCELL1, _LOADCELL2, _LOADCELL3, _LOADCELL4;
Button btn_single, btn_4graph, btn_calibrate, btn_graph, btn_record;
int screen=0;
void setup() {
  size(900, 600);
  img_master=loadImage("bg.png");
  img_multiG=loadImage("multi_graph.png");

  cp5 = new ControlP5(this); 
  setup_graph();
  setup_UART();
  setup_button();
}

void draw() {
  background(img_master);
  graph_master.push("loadcell_m1", _LOADCELL1);
  Send_To_Arduino();
}
