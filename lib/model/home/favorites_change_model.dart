class FavoritesChangeModel {
  bool? state;
  String message = '';

  FavoritesChangeModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    message = json['message'];
  }
}
