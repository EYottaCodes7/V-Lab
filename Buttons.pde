PFont robotoM;

class Buttons {
  float x, y;
  float w = 104, h = 32;
  float textSize = 12;

  color fillColor = #B17DFC;
  color purpleLight = #F4EFFF;

  boolean active = false;

  PFont robotoM;

  PImage image;

  String label = "BUTTON";

  Buttons (String label, color fillColor) {
    this.label = label;
    this.fillColor = fillColor;
  }
  void setDimensions (float w, float h, float textSize) {
    this.w = w;
    this.h = h;
    this.textSize = textSize;
  }
  Buttons (String label, color fillColor, float x, float y) {
    this.label = label;
    this.fillColor = fillColor;
    this.x = x;
    this.y = y;
  }
  Buttons (PImage backArrow, color fillColor, float x, float y) {
    this.image = backArrow;
    this.fillColor = fillColor;
    this.x = x;
    this.y = y;
  }
  void draw (float x, float y) {
    this.x = x;
    this.y = y;

    draw ();
  }

  void draw () {
    noStroke ();
    fill (fillColor);
    rect (x, y, w, h, 4);

    /*noStroke ();
    fill (purple);
    rect (187, 26, 38, 38, 4);*/

    float alphaP = 0;
    if (active) {
      alphaP = 0;
    } else {
      if (hovered ()) {
        if (mousePressed) {
          alphaP = 0;
        } else {
          alphaP = 0.6;
        }
      } else {
        alphaP = 0.8;
      }
    }

    fill (255, 255 * alphaP);
    rect (x, y, w, h, 4);

    fill (0);
    textSize (textSize);
    textAlign (CENTER, CENTER);
    text (label, x + w/2, y + h/2 - textDescent ()/2);
  }

  boolean hovered () {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
