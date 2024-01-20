import 'dart:io';

class NewPostModel {
  String? name;
  String? uid;
  String? image;
  File? postimage;
  String? time;
  String? text;

  NewPostModel(
      {this.time, this.text, this.name, this.uid, this.image, this.postimage});

  NewPostModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];

    name = json['name'];
    postimage = json['postimage'];
    uid = json['uid'];
    image = json['image'];
    time = json['time'];
  }

  Map<String, dynamic> tomap() {
    return {
      'text': text,
      'name': name,
      'postimage': postimage,
      'uid': uid,
      'image': image,
      'time': time,
    };
  }
}
