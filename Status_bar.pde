class Bar {

  Buttons homeButton, backButton; 
  String Titletext, statusbarText;
  float x, y;
  float w, h;

  Bar (String Titletext, String statusbarText, float x, float y) {
    this.Titletext = Titletext;
    this.statusbarText = statusbarText;
    this.x = x;
    this.y = y;

    w = width;
    h = 90;
  }
  /*void setButtons (Buttons buttons, Buttons Homebuttons) {
   this.Backbuttons = buttons;
   this.Homebuttons = Homebuttons;
   }*/
  void addButtons (Buttons homeButton, Buttons backButton) {
    homeButton.setDimensions (163, 38, 18);
    backButton.setDimensions (163, 38, 18);

    this.homeButton = homeButton;
    this.backButton = homeButton;
  }

  void draw() {
    noStroke ();
    fill(purple);
    rectMode (CORNER);
    rect (x, y, w, h);

    //status bar
    stroke (255);
    noFill();
    rect (239, 26, 780, 38, 4);

    //button rect

    //Title text
    textFont (robotoRegular, 46);
    textAlign(LEFT, TOP);
    fill(255);
    text ("V - lab", 40, 17);

    //ststus bar text 
    textFont (robotoMedium, 18);
    textAlign(LEFT, TOP);
    fill(255);
    text ("Education Level/", 252, 34);

    // buttons
    //if (page.isObjective()) {
    //  if (homeButton != null && backButton != null) {
    //    homeButton.draw (x, y);
    //    backButton.draw (x, y);
    //  }
    //}
  }
}
