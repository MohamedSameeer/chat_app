class PostModel {
  String name = '';
  String date= '';
  String post = '';
  String postImage='';
  String profileImage='';


  PostModel(this.name, this.date, this.post, this.postImage, this.profileImage);

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    post = json['post'];
    date = json['date'];
    postImage = json['postImage'];
    profileImage = json['profileImage'];
  }
  Map<String, dynamic> toMap() {
    return {
    'name': name,
    'post' : post,
    'date' : date,
    'postImage' :postImage,
    'profileImage' :profileImage,
    };
  }
}
