class ProductDetailsModel {
  bool? status;
  ProductDetailsData? data;

  ProductDetailsModel({this.status, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic>? json) {
    status = json!['status'];
    data = ProductDetailsData.fromJson(json['data']);
  }
}

class ProductDetailsData {
  int id = 0;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image = '';
  String name = '';
  String description = '';
  bool? inFavorites;
  bool? inCart;
  List<Data>? images;

  ProductDetailsData.fromJson(Map<String, dynamic>? json) {
    id = json!['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    images = json['images'].cast<String>();
  }
}

class Data {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<Data>? images;
  bool? inFavorites;
  bool? inCart;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
