import geomerative.*;
import processing.pdf.*;

Table extTable;
String tablePath;
//experiment inputs
String backgroundPath =  "data/assets/image/background - e.png";
PImage background;

//pages input
MCard elPrimary, elSecondary;
MCard primaryFC1, primaryFC2, primarySC1, primarySC2, secondaryFC, secondarySC;
MCard Experiment1, Experiment2;

//text fields input
TextField name;
TextField Hypothesis [], Materials [], ob_An [], Conclusion [];
Pages page;
Bar bar;
Buttons BackUB;
Buttons HomeButton;
Buttons backOB, nextOB;
Buttons backRR, nextRR;
Buttons backPRO, nextPRO;
Buttons finish, Back;
Buttons Next_Lr;
Buttons backObAnCo, Submit;

special_Buttons backButton;

Report report;

PImage UnavailablePage, Objective, rules_regulations, procedure, LabReport, Finalpage, finalLabReport; 
PShape backArrow;

public void settings() {
  size(1366, 768);
}
void setup () {
  ExArea_setup ();
  UnavailablePage = loadImage ("data/images/zzz page.png");
  Objective = loadImage ("data/images/Objective.png");
  rules_regulations = loadImage ("data/images/rules_regulation.png");
  procedure = loadImage ("data/images/procedure.png");
  LabReport = loadImage ("data/images/Lab-report Background.png");
  Finalpage = loadImage ("data/images/Lab-report Background 2.png");

  backArrow = loadShape ("data/assets/svgs/back.svg");
  loadFonts ();

  page = new Pages ();
  page.setPage (page.EDUCATION_LEVEL);

  elPrimary = new MCard ("Primary Education", "Grade 1 - 8", "data/images/Primary Education.png", 239, 188);
  elPrimary.addButtons (new Buttons ("FIRST CYCLE", purple), new Buttons ("SECOND CYCLE", purple));

  elSecondary = new MCard ("Secondary Education", "Grade 9 - 12", "data/images/Secondary Education.png", 703, 188);
  elSecondary.addButtons (new Buttons ("FIRST CYCLE", purple), new Buttons ("SECOND CYCLE", purple));

  //primary Cycles
  primaryFC1 = new MCard ("Primary First Cycle |", "Grade 1 - 2", "data/images/Grade 1-2.png", 239, 188);
  primaryFC1.addButtons (new Buttons ("GRADE 1", purple), new Buttons ("GRADE 2", purple));
  primaryFC2 = new MCard ("Primary First Cycle |", "Grade 3 - 4", "data/images/Grade 3-4.png", 703, 188);
  primaryFC2.addButtons (new Buttons ("GRADE 3", purple), new Buttons ("GRADE 4", purple));
  primarySC1 = new MCard ("primary Second Cycle |", "Grade 5 - 6", "data/images/Grade 5-6.png", 239, 188);
  primarySC1.addButtons (new Buttons ("GRADE 5", purple), new Buttons ("GRADE 6", purple));
  primarySC2 = new MCard ("primary Second Cycle |", "Grade 7 - 8", "data/images/Grade 7-8.png", 703, 188);
  primarySC2.addButtons (new Buttons ("GRADE 7", purple), new Buttons ("GRADE 8", purple));

  //secondary
  secondaryFC = new MCard ("Secondary First Cycle |", "Grade 9 - 10", "data/images/Grade 9-10.png", width/2 - 200, 188);
  secondaryFC.addButtons (new Buttons ("GRADE 9", purple), new Buttons ("GRADE 10", purple));
  secondarySC = new MCard ("Secondary Second Cycle |", "Grade 11 - 12", "data/images/Secondary Education.png", width/2 - 200, 188);
  secondarySC.addButtons (new Buttons ("GRADE 11", purple), new Buttons ("GRADE 12", purple));

  //experiment area
  Experiment1 = new MCard ("Neutralisation Effect of Acid", "Experiment 3.6 - General science", "data/images/acid to base.png", 239, 188);
  Experiment1.addButtons (new Buttons ("TRY", purple), new Buttons ("DEMO", grayDark));
  Experiment2 = new MCard ("Neutralisation Effect of Base", "Experiment 3.8 - Greneral science", "data/images/base to acid.png", 703, 188);
  Experiment2.addButtons (new Buttons ("TRY", purple), new Buttons ("DEMO", grayDark));

  bar = new Bar ("V - Lab", "Education Level/", 0, 0);

  //Buttons
  BackUB = new Buttons ("Back", grayDark, 102, 692);
  backOB = new Buttons ("Back", grayDark, 102, 692);
  Back = new Buttons ("Back", grayDark, 937, 674);
  nextOB = new Buttons ("Next", purple, 1102, 692 );
  backRR = new Buttons ("Back", grayDark, 102, 692);
  nextRR = new Buttons ("Next", purple, 1102, 692);
  backPRO = new Buttons ("Back", grayDark, 102, 692);
  nextPRO = new Buttons ("Next", purple, 1102, 692);
  finish = new Buttons ("finish", purple, 1137, 674);
  Next_Lr = new Buttons ("Next", purple, 1148, 685);
  backObAnCo = new Buttons ("Back", grayDark, 102, 692);
  Submit = new Buttons ("Submit", purple, 1148, 685);


  //backArrow button
  backButton = new special_Buttons (backArrow, purple, 187, 26);
  HomeButton = new Buttons ("Home", white, 1033, 26);

  //textfield
  name = new TextField ("Name", 135, 101);
  name.active = true;

  //hypothesistext field
  Hypothesis = new TextField [0];
  Hypothesis = (TextField []) append (Hypothesis, new TextField ("Hypothesis pt.1", 135, 205));
  Hypothesis = (TextField []) append (Hypothesis, new TextField ("Hypothesis pt.2", 135, 205));
  Hypothesis = (TextField []) append (Hypothesis, new TextField ("Hypothesis pt.3", 135, 205));
  Hypothesis = (TextField []) append (Hypothesis, new TextField ("Hypothesis pt.4", 135, 205));
  //materials text field
  Materials = new TextField [0];
  Materials = (TextField []) append (Materials, new TextField ("Materials, chemicals", 135, 505));
  Materials = (TextField []) append (Materials, new TextField ("Materials, container", 135, 505));
  Materials = (TextField []) append (Materials, new TextField ("Materials, measuring tools", 135, 505));
  Materials = (TextField []) append (Materials, new TextField ("Materials, other tools", 135, 505));
  Materials = (TextField []) append (Materials, new TextField ("Materials, indicator", 135, 505));
  //observation and analysis text field
  ob_An = new TextField [0];
  ob_An = (TextField []) append (ob_An, new TextField ("type your Obeservation here |", 135, 205));
  ob_An = (TextField []) append (ob_An, new TextField ("type your Obeservation here |", 135, 205));
  ob_An = (TextField []) append (ob_An, new TextField ("type your Obeservation here |", 135, 205));
  ob_An = (TextField []) append (ob_An, new TextField ("type your Obeservation here |", 135, 205));
  //conclusion
  Conclusion = new TextField [0];
  Conclusion = (TextField []) append (Conclusion, new TextField ("Conclusion", 135, 505));

  //Table
  tablePath = dataPath ("") + "/Experiment Table.csv";
  File file = new File (tablePath);
  if (!file.exists ()) {
    extTable = new Table ();

    extTable.addColumn ("Name");
    extTable.addColumn ("Materials Used");
    extTable.addColumn ("Observation and Analysis");
    extTable.addColumn ("Conclsion");
    saveTable (extTable, tablePath);
  }
  extTable = loadTable (tablePath, "header");
}
void generate () {


  //Hypothesis text
  String hypo [] = new String [0];
  for (int x = 0; x < Hypothesis.length; x ++) {
    Hypothesis [x].value = Hypothesis [x].value.trim ();
    if (Hypothesis [x].value.isEmpty ())
      continue;
      
    hypo = append (hypo, "•  " + Hypothesis [x].value);
  }
  String material [] = new String [0];
  for (int x = 0; x < Materials.length; x ++) {
    material = append (material, "• " + Materials [x].value);
  }
  //if (page.isObAnConclusion()) {
  String ob_an [] = new String [0];
  for (int x = 0; x < ob_An.length; x ++) {
    ob_an = append (ob_an, "•  " + ob_An [x].value);
  }

  String conclusion [] = new String [0];
  for (int x = 0; x < Conclusion.length; x ++) {
    conclusion = append (conclusion, "•  " + Conclusion [x].value);
  }

  report = new Report (hypo, material, ob_an, conclusion);
  report.generate ();

}
void ExArea_setup () {
  size(1366, 768);
  RG.init (this);
  initNavBar ();
  background = loadImage (backgroundPath);
}
void draw () {
  background (purpleLight);
  bar.draw();
  fill(255);
  shape(backArrow, 187, 26);
  backButton.draw();
  HomeButton.draw();

  if (page.isEducationLevel()) {
    elPrimary.draw ();
    elSecondary.draw ();
  } else if (page.isPrimaryFirstCycle ()) {
    primaryFC1.draw ();
    primaryFC2.draw ();
  } else if (page.isSecondaryFirstCycle ()) {
    secondaryFC.draw ();
  } else if (page.isPSecondCycle ()) {
    primarySC1.draw ();
    primarySC2.draw ();
  } else if (page.isExperimentOP()) {
    Experiment1.draw ();
    Experiment2.draw ();
  } else if (page.isSSecondCycle ()) {
    secondarySC.draw ();
  } else if (page.isunavailablePage()) {
    image(UnavailablePage, 0, 0);
    BackUB.draw ();
  } else if (page.isObjective()) {
    image(Objective, 0, 0);
    backOB.draw ();
    nextOB.draw();
  } else if (page.isRules_Regulation()) {
    image(rules_regulations, 0, 0);
    backRR.draw ();
    nextRR.draw();
  } else if (page.isProcedure()) {
    image(procedure, 0, 0);
    backPRO.draw ();
    nextPRO.draw();
  } else if (page.isExperimentArea()) {
    background (255);
    imageMode (CORNER);
    image (background, 0, 0, 1366, 780);
    navBarDraw ();
    componentsDraw();
    finish.draw ();
    Back.draw();
  } else if (page.isLabReport()) {
    imageMode (CORNER);
    image (LabReport, 0, 0);
    name.draw(200, 226);
    //MaterialsList.draw();
    // Loop
    if (Hypothesis != null) {
      for (int x = 0; x < Hypothesis.length; x ++) {
        Hypothesis [x].draw(200, x * 70 + 350);
      }
    }
    if (Materials != null) {
      for (int x = 0; x < Materials.length; x ++) {
        Materials [x].draw(883 - 100, x * 70 + 281);
      }
    }
    Next_Lr.draw();
  } else if (page.isObAnConclusion()) {
    imageMode(CORNER);
    image (Finalpage, 0, 0);
    int factor = 100;
    int factorText = 200;
    fill(0);
    textSize (12);
    textAlign(LEFT, TOP);
    text ("What colour appears when the phenolphthalein is added to the solution in the conical flask?", width/2 - 200, factorText);
    textSize (12);
    textAlign(LEFT, TOP);
    text ("Why does the colour disappear when the acid is added?", width/2 - 200, factorText + 1*factor);
    textSize (12);
    textAlign(LEFT, TOP);
    text ("Does the solution obtained from the experiment affect the colour of either blue and red litmus paper?", width/2 - 200, factorText + 2*factor);
    textSize (12);
    textAlign(LEFT, TOP);
    text ("Write the balanced chemical equation for the reaction that takes place in this experiment.", width/2 - 200, factorText + 3*factor);

    backObAnCo.draw();
    Submit.draw ();
    if (ob_An != null) {
      for (int x = 0; x < ob_An.length; x ++) {
        ob_An [x].draw(width/2 - 200, x * 100 + 225);
      }
    }
    if (Conclusion != null) {
      for (int x = 0; x < Conclusion.length; x ++) {
        Conclusion [x].draw(width/2 - 200, 650);
      }
    }
  }
}
void mouseReleased () {
  if (backButton.hovered()) {
    page.back ();
  } else if (HomeButton.hovered()) {
    page.setPage(page.EDUCATION_LEVEL);
  } else if (page.isEducationLevel()) {
    if (elPrimary.button1.hovered()) {
      page.setPage (page.PFIRST_CYCLE);
    } else if (elPrimary.button2.hovered()) {
      page.setPage (page.PSECOND_CYCLE);
    } else if (elSecondary.button1.hovered()) {
      page.setPage (page.SFIRST_CYCLE);
    } else if (elSecondary.button2.hovered()) {
      page.setPage (page.SSECOND_CYCLE);
    }
  } else if (page.isPSecondCycle()) {
    if (primarySC2.button2.hovered()) {
      page.setPage(page.EXPERIMENT_OPTIONS);
    } else {
      page.setPage(page.UNAVAILABLE_PAGE);
    }
  } else if (page.isPrimaryFirstCycle()) {
    page.setPage(page.UNAVAILABLE_PAGE);
  } else if (page.isSecondaryFirstCycle() || page.isSSecondCycle()) {
    page.setPage(page.UNAVAILABLE_PAGE);
  } else if (page.isExperimentOP()) {
    if (Experiment1.button1.hovered()) {
      page.setPage(page.OBJECTIVE);
    }
  } else if (page.isObjective()) {
    if (nextOB.hovered()) {
      page.setPage (page.RULES_REGULATI0N);
    } else if (backOB.hovered()) {
      page.setPage(page.EXPERIMENT_OPTIONS);
    }
  } else if (page.isunavailablePage()) {
    if (BackUB.hovered()) {
      page.setPage(page.EDUCATION_LEVEL);
    }
  } else if (page.isRules_Regulation()) {
    if (nextRR.hovered()) {
      page.setPage (page.PROCEDURE);
    } else if (backRR.hovered()) {
      page.setPage(page.OBJECTIVE);
    }
  } else if (page.isProcedure()) {
    if (nextPRO.hovered()) {
      page.setPage (page.EXPERIMENT_AREA);
    } else if (backPRO.hovered()) {
      page.setPage(page.RULES_REGULATI0N);
    }
  } else if (page.isExperimentArea()) {
    if (finish.hovered()) {
      page.setPage (page.LAB_REPORT);
    } else if (Back.hovered()) {
      page.setPage(page.EXPERIMENT_OPTIONS);
    }
  } else if (page.isLabReport()) {
    String studentName = name.value;
    int rIndex = extTable.findRowIndex (studentName, "Name");
    TableRow row;
    if (rIndex == -1) {
      row = extTable.addRow ();
    } else {
      row = extTable.getRow (rIndex);
    }

    row.setString ("Name", name.value );

    if (Next_Lr.hovered()) {
      saveTable (extTable, tablePath);
      page.setPage(page.OBANCONCLUSION);
    }
  } else if (page.isObAnConclusion()) {
    String studentName = name.value;
    int rIndex = extTable.findRowIndex (studentName, "Name");
    TableRow row;
    if (rIndex == -1) {
      row = extTable.addRow ();
    } else {
      row = extTable.getRow (rIndex);
    }
    if (Submit.hovered()) {
      saveTable (extTable, tablePath);
      page.setPage(page.OBANCONCLUSION);
    }
     else if(backObAnCo.hovered ()) {
        page.setPage(page.LAB_REPORT);
      }
    }

  //Experiment area
  //start
  if (page.isExperimentArea()) {
    navBar.mouseReleased ();
    componentsMouseReleased ();
    if (navBar.selectedIndex == 3) {
      SC_mouseReleased ();
    }
    if (navBar.selectedIndex == 4) {
      burette_mouseReleased ();
    }
    if (navBar.selectedIndex == 2) {
      ppt_mouseReleased ();
    }
    if (navBar.selectedIndex == 2) {
      litmus_mouseReleased ();
    }
    if (navBar.selectedIndex == 1) {
      flask_mouseReleased ();
    }
    if (navBar.selectedIndex == 0) {
      tallBeaker_mouseReleased ();
    }
  }
}
void SC_mouseReleased () {
  if (cContainer.cards[3][0].hovered ()) {
    cContainer.cards[3][0].active = true;
    if (stand == null) {
      initStand ();
    }
  }
}
void flask_mouseReleased () {
  if (cContainer.cards[1][1].hovered ()) {
    cContainer.cards[1][1].active = true;
    if (flask == null) {
      initFlask ();
    }
  }
}
void burette_mouseReleased () {
  if (cContainer.cards[4][0].hovered ()) {
    cContainer.cards[4][0].active = true;
    if (burette == null) {
      initBurette ();
    }
  }
}
void tallBeaker_mouseReleased () {
  if (cContainer.cards[0][2].hovered ()) {
    cContainer.cards[0][2].active = true;
    if (tallBeakerBase == null) {
      initTallBeakerBase ();
    }
  }
  if (cContainer.cards[0][0].hovered ()) {
    cContainer.cards[0][0].active = true;
    if (tallBeakerAcid == null) {
      initTallBeakerAcid ();
    }
  }
}
void litmus_mouseReleased () {
  if (cContainer.cards[2][0].hovered ()) {
    cContainer.cards[2][0].active = true;
    if (litmusRed == null) {
      initLitmusRed ();
    } else if (litmusBlue == null) {
      initLitmusBlue ();
    }
  }
}
void ppt_mouseReleased () {
  if (cContainer.cards[2][1].hovered ()) {
    cContainer.cards[2][1].active = true;
    if (ppt == null) {
      initPpt ();
    }
  }
}
//end
void mousePressed () {
  componentsMousePressed();
  if (Next_Lr.hovered()) {
    generate ();
  }
  if (page.isLabReport()) {
    name.mousePressed();
    if (Hypothesis != null) {
      for (int x = 0; x < Hypothesis.length; x++) {
        Hypothesis[x].mousePressed();
      }
    }
    if (Materials != null) {
      for (int x = 0; x < Materials.length; x ++) {
        Materials [x].mousePressed();
      }
    }
  } else if (page.isObAnConclusion()) {
    if (ob_An != null) {
      for (int x = 0; x < ob_An.length; x ++) {
        ob_An [x].mousePressed();
      }
    }
    if (Conclusion != null) {
      for (int x = 0; x < Conclusion.length; x ++) {
        Conclusion [x].mousePressed();
      }
    }
  }
}
void mouseDragged () {
  componentsMouseDragged();
}
void keyPressed () {
  componentsKeyPressed ();
  if (page.isLabReport()) {
    name.keyPressed ();
    if (Hypothesis != null) {
      for (int x = 0; x < Hypothesis.length; x++) {
        Hypothesis[x].keyPressed();
      }
    }
    if (Materials != null) {
      for (int x = 0; x < Materials.length; x ++) {
        Materials [x].keyPressed();
      }
    }
  }
  if (page.isObAnConclusion ()) {
    if (ob_An != null) {
      for (int x = 0; x < ob_An.length; x ++) {
        ob_An [x].keyPressed();
      }
    }
    if (Conclusion != null) {
      for (int x = 0; x < Conclusion.length; x ++) {
        Conclusion [x].keyPressed();
      }
    }
  }
}
