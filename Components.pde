Component flask, stand, stopcock, burette, ppt, burettRotated, buretteWithstopcoke, tallBeakerAcid, tallBeakerBase, litmusRed, litmusBlue;

//colour change
color Bg;
float dropNo = 500;
float fixedfactor = 1/dropNo;
float factor = fixedfactor;
float dropNo_ppt = 6;
float fixedfactor_ppt = 1/dropNo_ppt;
float factor_ppt = fixedfactor_ppt;

void componentsDraw () {
  if (page.isExperimentArea()) {
  if (burette != null) {
    burette.draw ();
  }
  if (ppt != null) {
    ppt.draw();
  }
  if (tallBeakerAcid != null) {
    tallBeakerAcid.draw();
  }
  if (tallBeakerBase != null) {
    tallBeakerBase.draw();
  }
  if (stand != null) {
    stand.draw();
  }
  if (litmusRed != null) {
    litmusRed.draw ();
  }
  if (litmusBlue != null) {
    litmusBlue.draw ();
  }
  if (flask != null) {
    flask.draw ();
  }
  }
}

void componentsMousePressed () {
  if (page.isExperimentArea()) {
  if (flask != null) {
    flask.mousePressed ();
  }
  if (burette != null) {
    burette.mousePressed ();
  }
  if (ppt != null) {
    ppt.mousePressed ();
  }
  if (tallBeakerAcid != null) {
    tallBeakerAcid.mousePressed ();
  }
  if (tallBeakerBase != null) {
    tallBeakerBase.mousePressed ();
  }
  if (litmusRed != null) {
    litmusRed.mousePressed ();
  }
  if (litmusBlue != null) {
    litmusBlue.mousePressed ();
  }
  }
}

void componentsKeyPressed () {
  if (page.isExperimentArea()) {
  if (tallBeakerAcid != null) {
    tallBeakerAcid.keyPressed();
  }
  if (tallBeakerBase != null) {
    tallBeakerBase.keyPressed();
  }
  if (litmusRed != null) {
    litmusRed.keyPressed();
  }
  if (litmusBlue != null) {
    litmusBlue.keyPressed();
  }

  //filling portion
  if ((key == 'F' || key == 'f') && flask.withinRegion() && burette.withinRegion()) {
    burette =  flask.pourFrom (burette, 0.25);
    Bg = lerpColor (flask.fillColor, to, factor);
    factor += fixedfactor;
    flask.setFillcolor(Bg);
  } else if ((key == 'D' || key == 'd') && ppt.withinRegion()) {
    ppt = flask.pourFrom (ppt, 0.25);
    Bg = lerpColor (flask.fillColor, purple, factor_ppt);
    factor_ppt += fixedfactor_ppt;
    flask.setFillcolor(Bg);
  }
  //tallbeakers
  if (tallBeakerBase != null && tallBeakerAcid != null) {
    if (tallBeakerBase.angle > 90 && tallBeakerBase.withinRegion() && flask.withinRegion()) {
      tallBeakerBase = flask.pourFrom (tallBeakerBase, 4);
    } else if (tallBeakerAcid.angle > 90 && tallBeakerAcid.withinRegion() && burette.withinRegion()) {
      tallBeakerAcid = burette.pourFrom (tallBeakerAcid, 4);
    }
  }
  }
}

void componentsMouseDragged () {
  if (page.isExperimentArea()) {
  if (flask != null && flask.selectedForDrag == true && flask.isSelected == true) {
    flask.mouseDragged();
  } else if ( burette != null && burette.selectedForDrag == true && burette.isSelected == true) {    
    burette.mouseDragged();
  } else if ( ppt != null && ppt.selectedForDrag == true && ppt.isSelected == true ) {
    ppt.mouseDragged();
  } else if ( tallBeakerAcid != null && tallBeakerAcid.selectedForDrag == true && tallBeakerAcid.isSelected == true) {
    tallBeakerAcid.mouseDragged();
  } else  if ( tallBeakerBase != null && tallBeakerBase.selectedForDrag == true && tallBeakerBase.isSelected == true) {
    tallBeakerBase.mouseDragged();
  } else if ( litmusRed != null && litmusRed.selectedForDrag == true && litmusRed.isSelected == true) {
    litmusRed.mouseDragged();
  } else if ( litmusBlue != null && litmusBlue.selectedForDrag == true && litmusBlue.isSelected == true) {
    litmusBlue.mouseDragged();
  }
  }
}
void componentsMouseReleased () {
  if (page.isExperimentArea()) {
  if (flask != null) {
    flask.mouseReleased ();
  }
  if (burette != null) {
    burette.mouseReleased ();
  }
  if (tallBeakerAcid != null) {
    tallBeakerAcid.mouseReleased ();
  }
  if (tallBeakerBase != null) {
    tallBeakerBase.mouseReleased ();
  }
  if (ppt != null) {
    ppt.mouseReleased();
  }
  if (litmusRed != null) {
    litmusRed.mouseReleased();
  }
  if (litmusBlue != null) {
    litmusBlue.mouseReleased();
  }
  }
}

void initStand () {
  if (page.isExperimentArea()) {
  stand = new Component ("data/assets/svgs/stand - E.svg", 485, 80);
  stand.isFillable = false;
  stand.isMovable = false;
  stand.isSelectable = false;
  stand.isShakable = false;
  }
}
void initFlask () {
  if (page.isExperimentArea()) {
  flask = new Component ("data/assets/svgs/flask - E.svg", "data/assets/svgs/flask - E.svg", 744.5, 319.79);
  flask.setRegionPpts(460, 432, 604, 477, 250, 100, 99, 1);
  flask.regionToCheck = BOTTOM;
  flask.isFillable = true;
  flask.isMovable = true;
  flask.isSelectable = true;
  flask.isShakable = true;
  flask.isRotateable = false;
  flask.isMoveUp_Down = false;
  flask.setFillcolor (0xffE3BE39);
  flask.setVolumeProperty(0, 100);
  Bg = flask.fillColor;
  }
}
//void X () {

void initBurette () {
if (page.isExperimentArea()) {
  burette = new Component ("data/assets/svgs/burette - fillable.svg", "data/assets/svgs/burette - overlay.svg", 890, 197);
  burette.setRegionPpts(485, 80, 568, 80, 200, 340, 1, 315);
  burette.regionToCheck = LEFT;
  burette.isFillable = true;
  burette.isMovable = true;
  burette.isSelectable = true;
  burette.isShakable = false;
  burette.isRotateable = false;
  burette.isMoveUp_Down = false;
  burette.setFillcolor(0xffFF9900);
  burette.setVolumeProperty(0, 50);
}
}
void initTallBeakerBase () {
  if (page.isExperimentArea()) {
  tallBeakerBase = new Component ("data/assets/svgs/tall beaker - E.svg", "data/assets/svgs/tall beaker - E.svg", 1100, 247);
  tallBeakerBase.setRegionPpts(652, 313.61, 675.79, 340, 74.32, 52.92, 33, 4);
  tallBeakerBase.regionToCheck = TOP; 
  tallBeakerBase.isFillable = true;
  tallBeakerBase.isMovable = true;
  tallBeakerBase.isSelectable = true;
  tallBeakerBase.isShakable = false;
  tallBeakerBase.isRotateable = true;
  tallBeakerBase.isMoveUp_Down = false;
  tallBeakerBase.setFillcolor(0xffE3BE39);
  tallBeakerBase.setVolumeProperty(20, 50);
  }
}

void initTallBeakerAcid () {
  if (page.isExperimentArea()) {
  tallBeakerAcid = new Component ("data/assets/svgs/tall beaker - E.svg", "data/assets/svgs/tall beaker - E.svg", 1030, 247);
  tallBeakerAcid.setRegionPpts(549, 53.82, 581.58, 73.61, 74.32, 52.92, 33, 4);
  tallBeakerAcid.regionToCheck = TOP; 
  tallBeakerAcid.isFillable = true;
  tallBeakerAcid.isMovable = true;
  tallBeakerAcid.isSelectable = true;
  tallBeakerAcid.isShakable = false;
  tallBeakerAcid.isRotateable = true;
  tallBeakerAcid.isMoveUp_Down = false;
  tallBeakerAcid.setFillcolor(0xffFF9900);
  tallBeakerAcid.setVolumeProperty(40, 50);
  }
}

void initPpt () {
  if (page.isExperimentArea()) {
  ppt = new Component ("data/assets/svgs/ppt - fillable.svg", "data/assets/svgs/ppt - overlay.svg", 910.07, 488.87);
  ppt.setRegionPpts(617, 267, 659, 327, 80, 69, 33, 3);
  ppt.isFillable = true;
  ppt.isMovable = true;
  ppt.isSelectable = true;
  ppt.isShakable = false;
  ppt.isRotateable = false;
  ppt.isMoveUp_Down = false;
  ppt.setFillcolor(#E3FDFF);
  ppt.setVolumeProperty(2, 5);
  }
}

void initLitmusRed () {
  if (page.isExperimentArea()) {
  litmusRed = new Component ("data/assets/svgs/litmus - clear.svg", "data/assets/svgs/litmus - clear.svg", 1214, 402);
  litmusRed.setRegionPpts(1273, 234, 1303, 373, 69, 242, 10, 1);
  litmusRed.regionToCheck = BOTTOM;
  litmusRed.isFillable = true;
  litmusRed.isMovable = true;
  litmusRed.isSelectable = true;
  litmusRed.isShakable = false;
  litmusRed.isRotateable = false;
  litmusRed.isMoveUp_Down = true;
  litmusRed.setFillcolor(red);
  litmusRed.setVolumeProperty(100, 100);
  }
}

void initLitmusBlue () {
  if (page.isExperimentArea()) {
  litmusBlue = new Component ("data/assets/svgs/litmus - clear.svg", "data/assets/svgs/litmus - clear.svg", 1174, 402);
  litmusBlue.setRegionPpts(1273, 234, 1303, 373, 69, 242, 10, 1);
  litmusBlue.regionToCheck = BOTTOM; 
  litmusBlue.isFillable = true;
  litmusBlue.isMovable = true;
  litmusBlue.isSelectable = true;
  litmusBlue.isShakable = false;
  litmusBlue.isRotateable = false;
  litmusBlue.isMoveUp_Down = true;
  litmusBlue.setFillcolor(blue);
  litmusBlue.setVolumeProperty(100, 100);
  }
}
