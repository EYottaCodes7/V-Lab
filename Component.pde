class Component {
  RShape overlay, fillable, intersection;
  PShape shape;

  float x, y;
  float w, h;
  float preX, preY;
  float pressedX, pressedY, releasedX, releasedY;
  float regionx, regiony, regionW, regionH, validx, validy, validW, validH;
  float angle = 0, finalAngle;
  float volume, maxVolume;
  float fillPercentage;
  float prevAngle;
  float fillableHeight;

  String fillablePath;
  String overlayPath;

  boolean isMovable;
  boolean isSelectable;
  boolean isFillable;
  boolean isShakable;
  boolean selectedForDrag;
  boolean isSelected; 
  boolean isRotateable;
  boolean isMoveUp_Down;

  int regionToCheck = BOTTOM;

  color fillColor = #FFC991;

  Component (String path, float x, float y) {
    shape = loadShape (path);
    shape.disableStyle();

    this.x = x;
    this.y = y;

    w = shape.width;
    h = shape.height;
  }

  Component (String fillablePath, String overlayPath, float x, float y) {
    this.x = x;
    this.y = y;

    fillable = RG.loadShape (fillablePath);
    overlay = RG.loadShape (overlayPath);

    w = overlay.width;
    h = overlay.height;

    isFillable = true;

    fillableHeight = fillable.height;
    fillP (fillPercentage);
  }

  void setRegionPpts (float regionx, float regiony, float validx, float validy, float regionW, float regionH, float validW, float validH) {
    this.regionx =regionx ;
    this.regiony =regiony;
    this.validx =validx ;
    this.validy =validy;
    this.regionW =regionW;
    this.regionH =regionH;
    this.validW = validW;
    this.validH = validH;
  }

  void setFillcolor (color fillColor) {
    this.fillColor = fillColor;
  }
  void rotate (float angle) {
    this.angle = angle;

    if (angle != prevAngle) {      
      intersection.rotate (radians (-(angle - prevAngle)));
      overlay.rotate (radians (- (angle - prevAngle)));
      prevAngle = angle;
    }
  }
  void rDraw () {
    RG.ignoreStyles ();
    fill (fillColor);
    noStroke ();
    RG.shape (intersection, x, y);

    RG.ignoreStyles(false);
    RG.shape (overlay, x, y);
  }  
  void draw () {
    if (isFillable) {
      rDraw ();
    } else {
      shapeMode (CORNER);   
      noFill ();
      stroke (0);
      strokeWeight (1);
      shape (shape, x, y);
    }  
    rectMode(CORNER);
    noFill ();
    stroke (0, 150);
    //rect (regionx, regiony, regionW, regionH);

    if (hovered () && isSelectable) {
      noFill ();
      if (withinRegion ()) {
        strokeWeight (3);
      } else {
        strokeWeight (1);
      }
      stroke (regionToCheck == BOTTOM? red : blue);
      rect (x, y, w, h);
      //RShape rect = RG.getRect (x, y, w, h);
    }
  }  
  void fillP (float fillPercentage) {
    this.fillPercentage = fillPercentage;
    float fillH = fillPercentage * fillable.height;
    RShape rect = RG.getRect (0, 0 + fillable.height - fillH, fillable.width, fillH);
    intersection = RG.intersection (fillable, rect);

    intersection.rotate (radians (-(angle)));
  }
  void setVolumeProperty (float volume, float maxVolume) {
    this.maxVolume = maxVolume;
    setVolume (volume);
  }
  void setVolume (float volume) {
    this.volume = volume;

    fillPercentage = volume / maxVolume;
    fillP (fillPercentage);
  }
  float getFilledH () {
    return fillPercentage * fillable.height;
  }

  Component pourFrom (Component component, float addedVolume) {
    if (component.volume >= addedVolume) {
      component.setVolume (component.volume - addedVolume);
      volume += addedVolume;
      volume = constrain (volume, 0, maxVolume);
      setVolume (volume);
    }
    return component;
  }
  float getFillP () {
    return fillPercentage;
  }
  boolean hovered () {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY< y + h;
  }
  void mousePressed () {    
    if (hovered ()) {
      pressedX = mouseX;
      pressedY = mouseY;
      preX = x;
      preY = y;
      if (isSelectable) {
        selectedForDrag = true;
        isSelected = true;
      }
    } else {
      isSelected = false;
    }
  }
  void mouseDragged () {
    if (selectedForDrag == true) {
      x = preX + (mouseX  - pressedX);
      y = preY + (mouseY  - pressedY);
    }
  }
  void mouseReleased () {
    releasedX = mouseX;
    releasedY = mouseY;
    selectedForDrag = false;
    //BOTTOM
    if (regionToCheck == BOTTOM && withinRegion()) {
      y = validy - h;
      x = validx;
    } else if (regionToCheck == LEFT && withinRegion ()) {
      x = validx;
      y = validy;
    } else if (regionToCheck == TOP && withinRegion()) {
      x = validx;
      y = validy;
    } else if ( x+w  > Tregionx & x + w < Tregionx + TregionW + 24 && y + h > Tregiony && y + h < Tregiony + TregionH + 65) {
      x = Tvalidx;
      y = Tvalidy - h;
    }
    //specified region
    else if (y + h < tableTopY || y + h > tableBottomY) {
      x = preX;
      y = preY;
    }
  }
  void keyPressed () {
    if (page.isExperimentArea()) {
      if (isSelectable && isSelected) {
        if (key == 'W' || key == 'w') {
          if (angle < 100 && isRotateable == true && withinRegion()) {
            rotate(angle + 2);
          } else if (withinRegion() && isMoveUp_Down == true) {
            y += 2;
          }
        } else if (key == 'S' || key == 's') {
          if (angle > 0 && withinRegion() && isRotateable == true) {
            rotate(angle - 2);
          } else if (withinRegion() && isMoveUp_Down == true) {
            y -= 2;
          }
        }
      }
    }
  }
  boolean withinRegion () {
    if (regionToCheck == BOTTOM) {
      return x > regionx && x  < regionx + regionW && y + h < regiony + regionH && y + h > regiony;
    } else if (regionToCheck == LEFT) {
      return x > regionx && x + w < regionx + regionW && y + h < regiony + regionH;
    } else if (regionToCheck == TOP) {
      return x > regionx && x < regionx + regionW && y > regiony && y < regiony + regionH;
    }
    return false;
  }
}
