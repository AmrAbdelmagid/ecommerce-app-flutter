class FavoritesCaseModel {
  bool status = false;
  String message = '';

  FavoritesCaseModel.fromJson(Map<String,dynamic> jsonData){
    status = jsonData['status'];
    message = jsonData['message'];
  }
}