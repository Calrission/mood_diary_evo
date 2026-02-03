extension StringsExtensions on String {
  String toTitle() => this[0].toUpperCase() + substring(1);
}