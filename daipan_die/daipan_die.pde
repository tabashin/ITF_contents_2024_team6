PFont font1;
void setup() {
  fullScreen();
  //size(displayWidth, displayHeight);
  background(0);
  fill(255, 0, 0);
  font1 = createFont("HG創英角ｺﾞｼｯｸUB", 100);
}

void draw() {
  int s=height/10;
  float h=height/2;
  float w=width/2;
  textAlign(CENTER, CENTER);
  textSize(s);
  textFont(font1);
  text("台パンを検知しました。\nあなたは死にます。", w, h);
}
