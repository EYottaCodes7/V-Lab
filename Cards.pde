class Cards {
  float x, y;
  float w = 120, h = 120;

  color fillColor = #B17DFC;

  boolean active = false;

  PFont robotoM;
  PImage image;

  String label = "CARD";

  Cards (String label, String imagePath, float x, float y) {
    this.label = label;
    this.x = x;
    this.y = y;

    image = loadImage (imagePath);
  }

  Cards (String label, String imagePath, color fillColor, float x, float y) {
    this.label = label;
    this.fillColor = fillColor;
    this.x = x;
    this.y = y;

    image = loadImage (imagePath);
  }

  void draw () {
    float xLabel = x, yLabel = y;
    float wLabel = w, hLabel = 35;

    // Label
    noStroke ();
    fill (fillColor);
    rect (xLabel, yLabel, wLabel, hLabel, 4, 4, 0, 0);

    float alphaP = 0;
    if (active) {
      alphaP = 0;
    } else {
      if (hovered ()) {
        if (mousePressed) {
          alphaP = 0.3;
        } else {
          alphaP = 0.4;
        }
      } else {
        alphaP = 0.5;
      }
    }

    fill (0);
    textSize (11);
    textAlign (CENTER, CENTER);
    text (label, xLabel + wLabel/2, yLabel + hLabel/2);

    float xCanvas = x, yCanvas = y + hLabel;
    float wCanvas = w, hCanvas = h - hLabel;

    // Image
    imageMode (CENTER);
    image (image, xCanvas + wCanvas/2, yCanvas + hCanvas/2);

    // Overlay rectangle
    stroke (0, 255 * alphaP);
    fill (255, 255 * alphaP);
    rect (x, y, w, h, 4);
  }

  boolean hovered () {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
