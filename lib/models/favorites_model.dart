class FavoritesModel {
  bool status = false;
  PreferredProductModel? data;
  FavoritesModel.fromJson(Map<String,dynamic> jsonData){
    data = PreferredProductModel.fromJson(jsonData['data']);
  }
}

class PreferredProductModel {
 List<DataModel> listData = [];

 PreferredProductModel.fromJson(Map<String,dynamic> jsonData){
   (jsonData['data'] as List).forEach((element) {
     listData.add(DataModel.fromJson(element));
   });
 }
}

class DataModel {
  PreferredProductModelData? product;
  DataModel.fromJson(Map<String,dynamic> jsonData){
    product = PreferredProductModelData.fromJson(jsonData['product']);
  }
}

class PreferredProductModelData {
  int id = 0;
  String name = '';
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image = '';

  PreferredProductModelData.fromJson(Map<String,dynamic> jsonData){
    id = jsonData['id'];
    price = jsonData['price'];
    oldPrice = jsonData['old_price'];
    discount = jsonData['discount'];
    image = jsonData['image'];
    name = jsonData['name'];
  }

}