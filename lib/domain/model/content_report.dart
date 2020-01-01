class ContentReport {
  final String typeReport;
  final String comment;

  ContentReport(this.typeReport, this.comment);
}

class TypeContentReport {
  static const String VIOLATION = 'AppViolation';
  static const String SEXUAL_CONTENT = 'SexualContent';
  static const String OFFENSIVE_CONTENT = 'OffensiveContent';
  static const String ANTISOCIAL_CONTENT = 'AntisocialContent';
  static const String DRUGS_AD = 'DrugsAd';
  static const String LAW_VIOLATION = 'LawViolation';
}