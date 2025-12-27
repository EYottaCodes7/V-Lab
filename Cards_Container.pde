class CardsContainer {
  Cards cards [] [];

  CardsContainer () {
    cards = new Cards [5] [0];
  }

  void add (int index, String label, String imagePath, float x, float y) {
    Cards card = new Cards (label, imagePath, navBar.buttons [index].fillColor, x, y);
    cards [index] = (Cards []) append (cards [index], card);
  }
  
  void draw () {
    for (int b = 0; b < cards [navBar.selectedIndex].length; b ++) {
      cards [navBar.selectedIndex] [b].draw ();
    }
  }
  void mouseReleased() {
    for (int b = 0; b < cards [navBar.selectedIndex].length; b ++) {
      if (cards [navBar.selectedIndex] [b].hovered ()) {
        cards [navBar.selectedIndex] [b].active = true;
      }
    }
  }
}
