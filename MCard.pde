class MCard {
  float x, y;
  float w = 424, h = 461;
  float cornerRadius = 6;

  String primaryText = "Primary Text Here", subHead = "Sub Head Here";

  PImage image;

  Buttons button1, button2;

  MCard (String primaryText, String subHead, String imagePath, float x, float y) {
    this.primaryText = primaryText;
    this.subHead = subHead;

    image = loadImage (imagePath);

    this.x = x;
    this.y = y;
  }

  void addButtons (Buttons button1, Buttons button2) {
    button1.setDimensions (163, 38, 18);
    button2.setDimensions (163, 38, 18);

    this.button1 = button1;
    this.button2 = button2;
  }

  void draw () {
    // MCard Container
    noStroke ();
    rectMode (CORNER);
    fill (white);
    rect (x, y, w, h, cornerRadius);

    // Image
    imageMode (CORNER);
    image (image, x, y);

    // Primary Text
    textFont (robotoRegular, 29);
    textAlign (LEFT, TOP);
    fill (black);
    text (primaryText, x + 20, y + 317);

    // Subhead
    textSize (20);
    fill (grayDark);
    text (subHead, x + 20, y + 358);

    button1.draw (x + 20, y + 403);
    button2.draw (x + 205, y + 403);

    // MCard Container Outline
    stroke (grayMid);
    strokeWeight (1);
    rectMode (CORNER);
    noFill ();
    rect (x, y, w, h, cornerRadius);
  }
}
