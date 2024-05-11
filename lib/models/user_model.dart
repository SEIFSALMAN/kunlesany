class UserModel
{
  String? name;
  String? email;
  String? uId;
  int? age;
  String? phoneNumber;

  UserModel({this.name, this.email, this.uId, this.age,this.phoneNumber});

  UserModel.fromJSON(Map <String,dynamic>json){
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    age = json['age'];
    phoneNumber = json['phoneNumber'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'email': email,
      'age': age,
      'uId':uId,
      'phoneNumber':phoneNumber
    };
  }

}