class NavBars {
  Buttons [] buttons;
  Cards [] cards;

  int selectedIndex ;
  NavBars () {
    buttons = new Buttons [0];
    cards = new Cards [0];
  }

  void add (String label, color fillColor, float x, float y) {
    buttons = (Buttons []) append (buttons, new Buttons (label, fillColor, x, y));
  }
  void draw () {
    for (int b = 0; b < buttons.length; b ++) {
      buttons [b].draw ();
    }
  }
  void mouseReleased () {
    for (int b = 0; b < buttons.length; b ++) {
      if (buttons [b].hovered ()) {
        buttons [b].active = true;

        selectedIndex = b;

        for (int i = 0; i < buttons.length; i ++) {
          if (b != i) {
            buttons [i].active = false;
          }
        }
      }
    }
  }
}
