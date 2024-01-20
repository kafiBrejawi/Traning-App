class CreateUserModel {
  String? email;
  String? phone;
  String? name;
  String? uid;
  String? image;
  String? bio;

  CreateUserModel(
      {this.email, this.phone, this.name, this.uid, this.image, this.bio});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];

    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];
    image = json['image'];
    bio = json['bio'];
  }

  Map<String, dynamic> tomap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uid': uid,
      'image': image,
      'bio': bio
    };
  }
}
