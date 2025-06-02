extension StringExtensions on String{
  String get addSlash => '/$this';

  String get capitalize => this[0].toUpperCase() + substring(1);

  // String formatPrice() {
  //   final number = double.tryParse(this) ?? 0.0;
  //   final formatter = NumberFormat('#,##0.###');

  //   return formatter.format(number);
  // }

}