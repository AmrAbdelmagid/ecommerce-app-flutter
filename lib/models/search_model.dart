
class SearchModel {
  bool status = false;
  SearchDataModel? data;
  SearchModel.fromJson(Map<String,dynamic> jsonData){
    data = SearchDataModel.fromJson(jsonData['data']);
  }
}

class SearchDataModel{
  List<Product>? productsData = [];

  SearchDataModel.fromJson(Map<String,dynamic> jsonData){
    (jsonData['data'] as List).forEach((element) {
      productsData!.add(Product.fromJson(element));
    });
  }
}

class Product {
  int id = -1;
  dynamic price;
  String image = '';
  String name = '';

  Product.fromJson(Map<String,dynamic> jsonData){
    id = jsonData['id'];
    price = jsonData['price'];
    image = jsonData['image'];
    name = jsonData['name'];
  }

}