NavBars navBar;
CardsContainer cContainer;

float tableTopY = 397;
float tableBottomY = 555; 
float Tregionx = 1208, Tregiony= 253, TregionW = 158, TregionH = 224, Tvalidx = 1258, Tvalidy = 477, TvalidW = 99;

void initNavBar () {
  // buttons
  navBar = new NavBars ();
  navBar.add ("CHEMICALS", #B17DFC, 57, 574); 
  navBar.add ("CONTAINER TOOLS", #10CCEB, 209, 574);
  navBar.add ("INDICATORS", #26C92B, 667, 574);
  navBar.add ("OTHER TOOLS", #797979, 513, 574);
  navBar.add ("MESURING TOOlS", #FC7E7E, 361, 574);

  //cards
  cContainer = new CardsContainer ();
  cContainer.add (0, "ACIDS", "D:/Assets/chemicals/Acids.png", 49, 631);
  cContainer.add (0, "NEUTRALS", "D:/Assets/chemicals/Acids.png", 201, 631);
  cContainer.add (0, "ALKALINES", "D:/Assets/chemicals/Acids.png", 353, 631);

  cContainer.add (1, "BEAKER", "D:/Assets/Containers/Beakers - Empty.png", 49, 631);
  cContainer.add (1, "FLASK", "D:/Assets/Containers/Flask.png", 201, 631);
  cContainer.add (1, "TESTTUBE", "D:/Assets/Containers/Test Tube.png", 353, 631);

  cContainer.add (2, "LITMUS PAPER", "D:/Assets/indicators/Litmus Paper.png", 49, 631);
  cContainer.add (2, "PHENOLPHTHALEIN", "D:/Assets/indicators/phenolphthalein with a dropper.png", 201, 631);
  cContainer.add (3, "STAND & CLAMPER", "D:/Assets/Other tools/S and C cards.png", 49, 631);

  cContainer.add (3, "STOP COCK", "D:/Assets/Other tools/Stop cock Card.png", 201, 631);

  cContainer.add (4, "BURETTE", "D:/Assets/Measuring Tools/Burette.png", 49, 631);
  cContainer.add (4, "CYLINDER", "D:/Assets/Measuring Tools/Cylinder.png", 201, 631);
}

void navBarDraw () {
  navBar.draw ();
  cContainer.draw ();
}
