class UserData{
  String name='';
  String phone='';
  String email='';
  String uId='';

  UserData(this.name, this.phone, this.email, this.uId);

  UserData.fromJson(Map<String, dynamic>json){
    name=json['name'];
    phone=json['phone'];
    email=json['email'];
    uId=json['uId'];

  }
  Map<String, dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
    };
  }
}