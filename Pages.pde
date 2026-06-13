class Pages {
  String page;
  StringList prevPages;
  StringList TempoPrevpage;

  String APP_INFO = "AI";
  String EDUCATION_LEVEL = "EL";
  String GRADE = "GD";
  String UNAVAILABLE_PAGE = "UP";
  String PFIRST_CYCLE = "PFCycle", SFIRST_CYCLE = "SFCycle", PSECOND_CYCLE = "PSCycle", SSECOND_CYCLE = "SSCycle" ;
  String EXPERIMENT_OPTIONS = "EO";
  String GUIDE = "GU";
  String EXPERIMENT_AREA = "EA";
  String LAB_REPORT = "LR";
  String OBJECTIVE = "OBJ";
  String RULES_REGULATI0N = "RR";
  String PROCEDURE = "PRO";
  String OBANCONCLUSION = "OBANCO";

  Pages () {
    prevPages = new StringList ();
    TempoPrevpage = new StringList (EDUCATION_LEVEL);
  }
  void setPage (String page) {
    this.page = page;

    if (!prevPages.hasValue (page)) {
      prevPages.append (page);
    } else {
      int pIndex = prevPages.index (page);
      //Remove pages
      if (prevPages.size() > 1) {
        for (int a = pIndex; a < prevPages.size (); ) {
          prevPages.remove(a);
        }
      }
    }
  }
  void back () {
    // Back functionality
    if (prevPages.size() > 1) {
      int prevIndex = prevPages.index(page) - 1;
      prevIndex = constrain (prevIndex, 0, prevPages.size ());
      String prevpage = prevPages.get(prevIndex);
      page = prevpage;
    }
  }
  boolean isunavailablePage () {
    return page.equals (UNAVAILABLE_PAGE);
  }
  boolean isAppInfo () {
    return page.equals (APP_INFO);
  }
  boolean isEducationLevel () {
    return page.equals (EDUCATION_LEVEL);
  }
  boolean isGrade () {
    return page.equals (GRADE);
  }
  boolean isPrimaryFirstCycle () {
    return page.equals (PFIRST_CYCLE);
  }
  boolean isSecondaryFirstCycle () {
    return page.equals (SFIRST_CYCLE);
  }
  boolean isPSecondCycle () {
    return page.equals (PSECOND_CYCLE);
  }
  boolean isSSecondCycle () {
    return page.equals (SSECOND_CYCLE);
  }
  boolean isExperimentOP () {
    return page.equals (EXPERIMENT_OPTIONS);
  }
  boolean isObjective () {
    return page.equals (OBJECTIVE);
  }
  boolean isRules_Regulation () {
    return page.equals (RULES_REGULATI0N);
  }
  boolean isProcedure () {
    return page.equals (PROCEDURE);
  }
  boolean isExperimentArea () {
    return page.equals (EXPERIMENT_AREA);
  }
  boolean isLabReport () {
    return page.equals (LAB_REPORT);
  }
  boolean isObAnConclusion () {
    return page.equals (OBANCONCLUSION);
  }
}
