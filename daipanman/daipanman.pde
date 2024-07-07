Window secondWindow;
PFont font1;

import processing.serial.*;

Serial arduino;
final String portName = "devName"; //仮想COMポートの名前 Arduinoに書き込むときに表示されているものと同じ
final int baudRate = 115200;   //ボーレート Arduinoとそろえる
final int lf = 10;  //改行文字のASCIIコード

float recvData = 0; //受信したデータが入る
String tmp = null;  //受信データの変換用一時変数

PFont  font;    //フォント

final int black = 0;    //白色
final int white = 255;  //黒色



void setup() {
  //size(400, 400);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Click to open a new window", width/2, height/2);
  surface.setResizable(true); 
  surface.setSize(640, 360);
  frameRate(60);
  smooth();

  font = createFont("Meiryo UI", 250);
  textFont(font, 20);

  arduino = new Serial(this, portName, baudRate);   //シリアル通信のためのポートを開く
  arduino.bufferUntil(lf);                        //シリアル通信の中で，改行文字lfを受信したときにserialEventが発生するように設定する
}

void draw() {
  background(black);
  text("received: " + nf(recvData, 4, 2), 10, 50);    //受信したデータを表示

  rect(120, 80, 220, recvData);
  if (recvData>100) {
    if (secondWindow == null) {
      secondWindow = new Window(this); // 新しいウィンドウを開く
    }
  }
}

void stop() //停止時の処理
{
  arduino.stop();
  super.stop();
}

void serialEvent(Serial p)  //シリアル通信が受信可能な時に呼び出される関数 受信時にやりたいことを書く
{
  tmp = p.readStringUntil(lf); //受信したデータを改行文字までを文字列として読み込む
  recvData = float(tmp);       //読み込んだ文字列を浮動小数点型に変換し，保存する．
}

class Window extends PApplet {
  PApplet parent;

  Window(PApplet parent) {
    this.parent = parent;
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  public void settings() {
    fullScreen();
  }

  public void setup() {

    background(0);
    fill(255, 0, 0);
    font1 = createFont("HG創英角ｺﾞｼｯｸUB", 100);
  }

  public void draw() {
    int s=height/10;
    float h=height/2;
    float w=width/2;
    textAlign(CENTER, CENTER);
    textSize(s);
    textFont(font1);
    text("台パンを検知しました。\nあなたは死にます。", w, h);
  }
}
