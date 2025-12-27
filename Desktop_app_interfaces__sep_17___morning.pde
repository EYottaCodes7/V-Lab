import geomerative.*;

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
TextField name, MaterialsList, Observation_Analysis, Conclusion;

Pages page;
Bar bar;
Buttons back, next;
Buttons finish, Back;
Buttons Next_Lr;

special_Buttons backButton;

PImage Objective, LabReport, ObAnConclusion; 
PShape backArrow;

public void settings() {
  size(1366, 768);
}
void setup () {
  ExArea_setup ();
  Objective = loadImage ("data/images/Objective.png");
  LabReport = loadImage ("data/images/Lab-report Background.png");
  ObAnConclusion = loadImage ("data/images/Lab-report Background.png");

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
  back = new Buttons ("BACK", grayDark, 441, 591);
  Back = new Buttons ("BACK", grayDark, 937, 674);
  next = new Buttons ("next", purple, 745, 591 );
  finish = new Buttons ("finish", purple, 1137, 674);
  Next_Lr = new Buttons ("Next", purple, 1148, 685);

  //backArrow button
  backButton = new special_Buttons (backArrow, purple, 187, 26);

  //textfield
  name = new TextField ("Name", 135, 101);
  name.active = true;
  MaterialsList = new TextField ("Materials Used", 706, 205);

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
  } else if (page.isObjective()) {
    image(Objective, 0, 0);
    back.draw ();
    next.draw();
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
    name.draw();
    MaterialsList.draw();
    //Observation_Analysis.draw();
    //Conclusion.draw();
    Next_Lr.draw();
  } else if (page.isObAnConclusion()) {
    imageMode(CORNER);
    image (ObAnConclusion, 0, 0);
  }
}
void mouseReleased () {
  if (backButton.hovered()) {
    page.back ();
  }
  if (page.isEducationLevel()) {
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
    } else if (page.isGrade()) {
    }
  } else if (page.isExperimentOP()) {
    if (Experiment1.button1.hovered()) {
      page.setPage(page.OBJECTIVE);
    }
  } else if (page.isObjective()) {
    if (next.hovered()) {
      page.setPage (page.EXPERIMENT_AREA);
    } else if (back.hovered()) {
      page.setPage(page.EXPERIMENT_OPTIONS);
    }
  } else if (page.isExperimentArea()) {
    if (finish.hovered()) {
      page.setPage (page.LAB_REPORT);
    } else if (Back.hovered()) {
      page.setPage(page.EXPERIMENT_OPTIONS);
    }
  } else if (page.isLabReport()) {
    if (Next_Lr.hovered()) {
      println (name.value);
      println (MaterialsList.value);
      String studentName = name.value;
      int rIndex = extTable.findRowIndex (studentName, "Name");
      TableRow row;
      
      if (rIndex == -1) {
        row = extTable.addRow ();
      } else {
        row = extTable.getRow (rIndex);
      }
      row.setString ("Name", name.value );
      row.setString ("Materials Used", MaterialsList.value);
      
      //newRow.setString ("Observation and Analysis",Observation_Analysis.value);
      //newRow.setString ("Conclusion", Conclusion.value);

      saveTable (extTable, tablePath);
      page.setPage(page.OBANCONCLUSION);
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
  if (page.isLabReport()) {
    name.mousePressed();
    MaterialsList.mousePressed();
    //Observation_Analysis.mousePressed();
    //Conclusion.mousePressed();
  }
}
void mouseDragged () {
  componentsMouseDragged();
}
void keyPressed () {
  componentsKeyPressed ();
  if (page.isLabReport()) {
    name.keyPressed ();
    MaterialsList.keyPressed();
    //Observation_Analysis.keyPressed();
    //Conclusion.keyPressed();
    if (keyCode == ENTER) {
    }
  }
}
