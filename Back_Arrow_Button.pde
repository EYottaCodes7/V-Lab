class  special_Buttons {
  PShape Content;
  color  colour;
  float x, y;
  float w, h;

  boolean active;

  special_Buttons (PShape Content, color colour, float x, float y) {
    this.Content = Content;
    this.colour = colour;
    this.x = x;
    this.y = y;
    
    w = 38;
    h = 38;
  }
  void setup () {
  }
  void draw () {
    noStroke ();
    fill (purple);
    rect(x, y, w, h, 4);

    float alphaP = 0;
    if (active) {
      alphaP = 0;
    } else {
      if (hovered ()) {
        if (mousePressed) {
          alphaP = 0.2;
        } else {
          alphaP = 0.1;
        }
      } else {
        alphaP = 0;
      }
    }
    stroke (255);
    fill(255, 255 * alphaP);
    rect(x, y, w, h, 4);
  }
  boolean hovered () {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
