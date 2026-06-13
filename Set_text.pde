class Report {
  String hypothesis [];
  String materials [];
  String obAn [];
  String conclusion [];
  int start = 233;
  Report (String hypothesis [], String materials [], String obAn [], String conclusion []) {
    this.hypothesis = hypothesis;
    this.materials = materials;
    this.obAn = obAn;
    this.conclusion = conclusion;
  }
  //if (page.isLabReport()) {
  void generate () {
    PGraphics pdf = createGraphics (841, 1190, PDF, "data/Lab report.pdf");
    String date = "" +  day() + " /" + month() + " /" + year();

    pdf.beginDraw ();

    //additional layout
    pdf.noStroke ();
    pdf.fill(#003AF8);
    pdf.rectMode (CORNER);
    pdf.rect (0, 0, 841, 86);
    pdf.rectMode (CORNER);
    pdf.rect (0, 1104, 841, 86);
    pdf.fill(#8000FF);
    pdf.rectMode (CORNER);
    pdf.rect (0, 100, 841, 10);
    pdf.fill(#0090FF);
    pdf.rectMode (CORNER);
    pdf.rect (165, 122, 512, 10);

    //filled text
    int factor = 70;
    pdf.fill(0);
    pdf.textSize (11);
    pdf.textAlign (LEFT, TOP);
    pdf.text("What colour appears when the phenolphthalein is added to the solution in the conical flask?", 72, start + 169 + 204 + 35);
    pdf.fill(0);
    pdf.textSize (11);
    pdf.textAlign (LEFT, TOP);
    pdf.text("Why does the colour disappear when the acid is added?", 72, start + 169 + 204 + 35 + 1*factor);
    pdf.textSize (11);
    pdf.textAlign (LEFT, TOP);
    pdf.text("Does the solution obtained from the experiment affect the colour of either blue and red litmus paper?", 72, start + 169 + 204 + 35 + 2*factor);
    pdf.textSize (11);
    pdf.textAlign (LEFT, TOP);
    pdf.text("Write the balanced chemical equation for the reaction that takes place in this experiment.", 72, start + 169 + 204 + 35 + 3*factor);
    pdf.fill (255);
    pdf.textAlign (CENTER, CENTER);
    pdf.textSize (30);
    pdf.text ("LAB REPORT", pdf.width/2, 43);
    pdf.textAlign (LEFT, TOP);
    pdf.textSize(20);
    pdf.text ("X School", 703, 1137);
    pdf.fill (0);
    pdf.textSize(15);
    pdf.textAlign (LEFT, TOP);
    pdf.text ("Name :" + name.value, 59, 180);
    pdf.textAlign (LEFT, TOP);
    pdf.text ("Date :" + date, 678, 180);
    pdf.textAlign (LEFT, TOP);
    pdf.text ("Department : Chemistry", 474, 180);
    //hpothesis
    pdf.textAlign (CENTER, CENTER);
    pdf.textSize (15);
    pdf.text ("Hypothesis", pdf.width/2, start);
    pdf.textAlign (LEFT, TOP);
    String hypothesisJoined = join (hypothesis, "\n");
    hypothesisJoined.replace ("\n\n", "\n");
    pdf.text (hypothesisJoined, 72, start + 45, pdf.width - 72*2, 155);
    //materials
    pdf.textAlign (CENTER, CENTER);
    pdf.textSize (15);
    pdf.text ("Materials", pdf.width/2, start + 170);
    pdf.textAlign (LEFT, TOP);
    String materialsJoined = join (materials, "\n");
    materialsJoined.replace ("\n\n", "\n");
    pdf.text (materialsJoined, 72, start + 170 + 45, pdf.width - 72*2, 155);
    //observation and analysis
    pdf.textAlign (CENTER, CENTER);
    pdf.textSize (15);
    pdf.text ("Observation and Analysis", pdf.width/2, start + 169 + 194);
    pdf.textAlign (LEFT, TOP);
    //String obAnJoined = join (obAn, "\n");
    //pdf.text (obAnJoined, 72, start + 170 + 45 + 200, pdf.width - 72*2, 155);
    for (int i = 0; i < obAn.length; i ++) {
      pdf.text (obAn [i], 72, start + 20 + 169 + 204 + 45 + 50*i + 20*i, pdf.width - 72*2, 337);
    }

    //conclusion 
    pdf.textAlign (CENTER, CENTER);
    pdf.textSize (15);
    pdf.text ("Conclusion", pdf.width/2, start + 169 + 194 + 337);
    pdf.textAlign (LEFT, TOP);
    String conclusionJoined = join (conclusion, "\n");
    conclusionJoined.replace ("\n\n", "\n");
    pdf.text (conclusionJoined, 72, start + 45 + 200 + 337 + 169, pdf.width - 72*2, 155);
    pdf.dispose();
    pdf.endDraw();
  }
}
