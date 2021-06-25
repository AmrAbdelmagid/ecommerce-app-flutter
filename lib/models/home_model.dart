class HomeModel {
  bool? status;
  DataModel? data;

  HomeModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['status'];
    data = DataModel.fromJson(jsonData['data']); // data model
  }
}

class DataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  DataModel.fromJson(Map<String, dynamic> jsonData) {
    (jsonData['banners'] as List).forEach((element) {
      banners.add(BannerModel.fromJson(element));
    });
    (jsonData['products'] as List).forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel {
  int? id;
  String image = '';
  Category? category;

  BannerModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    image = jsonData['image'];
    category = Category.fromJson(jsonData['category']);
  }
}

class Category {
  String image = '';

  Category.fromJson(Map<String, dynamic> jsonData) {
    image = jsonData['image'];
  }
}

class ProductModel {
  int? id;
  String name = '';
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image = '';
  bool? inFavorites;
  bool? inCart;

  ProductModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    name = jsonData['name'];
    price = jsonData['price'];
    oldPrice = jsonData['old_price'];
    discount = jsonData['discount'];
    image = jsonData['image'];
    inFavorites = jsonData['in_favorites'];
    inCart = jsonData['in_cart'];
  }
}
