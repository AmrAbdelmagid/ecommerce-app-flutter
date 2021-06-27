class UserDataModel {
  int? id;
  String name = '';
  String email = '';
  String phone = '';
  String? image;
  int? point;
  int? credit;
  String? token;

  UserDataModel.fromJson(Map<String, dynamic> jsonData){
    id = jsonData['id'];
    name = jsonData['name'];
    email = jsonData['email'];
    phone = jsonData['phone'];
    image = jsonData['image'];
    point = jsonData['point'];
    credit = jsonData['credit'];
    token = jsonData['token'];
  }
}
