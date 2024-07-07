Window secondWindow;
PFont font1;

void setup() {
  size(400, 400);
  background(200);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Click to open a new window", width/2, height/2);
}

void draw() {
  // メインウィンドウの描画コード
}

void mousePressed() {
  if (secondWindow == null) {
    secondWindow = new Window(this); // 新しいウィンドウを開く
  }
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
