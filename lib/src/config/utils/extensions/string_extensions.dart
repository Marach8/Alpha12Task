extension StringExtensions on String{
  String get addSlash => '/$this';

  String get capitalize => this[0].toUpperCase() + substring(1);

}