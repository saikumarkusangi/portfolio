class RoutesPath {
  final String projectTitle;
  final bool isUnKnown;
  RoutesPath.home()
      : projectTitle = '',
        isUnKnown = false;

  RoutesPath.details(this.projectTitle) : isUnKnown = false;

  RoutesPath.unKnown()
      : projectTitle = '',
        isUnKnown = true;

  bool get isHomePage => projectTitle == '';
  bool get isDetailsPage => projectTitle != '';
}
