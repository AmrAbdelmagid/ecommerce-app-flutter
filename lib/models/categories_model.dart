
class CategoriesModel {

  bool? status;
  CategoriesDataModel? data;
  CategoriesModel.fromJson(Map<String,dynamic> jsonData){
    status = jsonData['status'];
    data = CategoriesDataModel.fromJson(jsonData['data']);

  }
}

class CategoriesDataModel{
  List<CategoryDataModel> categoryDataModelList = [];
  CategoriesDataModel.fromJson(Map<String,dynamic> jsonData){

    (jsonData['data'] as List).forEach((category) {
      categoryDataModelList.add(CategoryDataModel.fromJson(category));
    });
  }
}

class CategoryDataModel {
  int? id;
  String name = '';
  String image = '';
  CategoryDataModel.fromJson(Map<String,dynamic> jsonData){
    id = jsonData['id'];
    name = jsonData['name'];
    image = jsonData['image'];
  }
}