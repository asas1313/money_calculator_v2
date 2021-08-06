final String imageAssetsRoot = "img/";
final String bg1 = _getImagePath("bg1.png");
final String logo_sm = _getImagePath('logo_sm.png');
final String logo_white_sm = _getImagePath('logo_white_sm.png');

String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}
