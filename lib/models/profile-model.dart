class ProfileModel{
  String name='';
  String phone='';
  String email='';
  String uId='';
  String bio='';
  String coverImage='';
  String profileImage='';


  ProfileModel(this.name, this.phone, this.email, this.uId, this.bio,
      this.coverImage, this.profileImage);

  ProfileModel.fromJson(Map<String, dynamic>json){
    name=json['name'];
    phone=json['phone'];
    email=json['email'];
    uId=json['uId'];
    bio=json['bio'];
    coverImage=json['coverImage'];
    profileImage=json['profileImage'];
  }
  Map<String,dynamic>toMap(){
    return {
      'bio': bio,
      'coverImage':coverImage,
      'email':email,
      'name': name,
      'phone': phone,
      'profileImage': profileImage,
      'uId':uId,
    };
  }
}