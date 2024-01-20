import 'dart:io';
import 'package:path/path.dart';
import 'package:bmi_culc/layouts/Social_app/social-app-states.dart';
import 'package:bmi_culc/modules/social-app/chats/chats.dart';
import 'package:bmi_culc/modules/social-app/feeds/feeds.dart';
import 'package:bmi_culc/modules/social-app/settings/Social-Settings.dart';
import 'package:bmi_culc/modules/social-app/social-login/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/SocialApp/newpost.dart';
import '../../models/SocialApp/users.dart';
import '../../modules/social-app/home/HomeScreen.dart';
import '../../modules/social-app/post/post.dart';
import '../../modules/social-app/users/users.dart';
import '../../shared/components/contstants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SocialAppCubit extends Cubit<SocialAppState> {
  SocialAppCubit() : super(SocialInitialState());

  static SocialAppCubit get(context) => BlocProvider.of(context);

  var namecontroller = TextEditingController();
  var biocontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  CreateUserModel? model;

  void getuserdata() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      print(value.data());
      model = CreateUserModel.fromJson(value.data()!);

      emit(SocialGetUserSucsessState());
    }).catchError((Error) {
      print(Error);
      emit(SocialGetUserErorrState(Error.toString()));
    });
  }

  int currentindex = 0;
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'home'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_sharp,
        ),
        label: 'chats'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.post_add,
        ),
        label: 'posts'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: 'users'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'settings'),
  ];

  List<Widget> screeen = [
    HomeScreen(),
    chats(),
    Newpost(),
    users(),
    SocialSettings()
  ];
  List<String> title = [
    'News feeds',
    'Chats',
    'posts',
    'Users',
    'SocialSettings'
  ];

  void changeBottomNavigationBar(int index) {
    if (index == 2)
      emit(SocialNewPostState());
    else {
      currentindex = index;
      emit(SocialBottomNavState());
    }
  }

  // File? profileImage;
  // var picker = ImagePicker();

  // Future<void> getProfileImage(
  //     {@required String? phone,
  //     @required String? name,
  //     @required String? bio,
  //     String? image}) async {
  //   final PickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (PickedFile != null) {
  //     var imagename = basename(PickedFile.path);

  //     profileImage = File(PickedFile.path);

  //     emit(SocialSucsessImagePickermState());
  //     updateuser(phone: phone, name: name, bio: bio, image: url);
  //     print(imagename);
  //   } else {
  //     print('no image selected');

  //     emit(SocialErorrImagePickerState());
  //   }
  //   ;
  // }
  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      profileImage = File(PickedFile.path);
    } else {
      print('no image selected');

      emit(SocialErorrImagePickerState());
    }
    ;
  }

  String profileImageUrl = '';

  void uploadprofileimage() {
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) => {
              value.ref
                  .getDownloadURL()
                  .then((value) => {
                        profileImageUrl = value,
                        print(profileImageUrl),
                        getuserdata(),
                        emit(SocialSucsessImageUploadState()),
                      })
                  .catchError((error) {
                emit(SocialErrorImageUploadState());
                print(error.toString());
              })
            })
        .catchError((erorr) {
      emit(SocialErrorImageUploadState());
      print(erorr.toString());
    });
  }

  // void updateuserimages({
  //   @required String? phone,
  //   @required String? name,
  //   @required String? bio,
  // }) {
  //   {
  //     emit(SocialUpdateUserLoadingState());
  //     if (profileImage != null) {
  //       uploadprofileimage();
  //     } else {
  //       updateuser(bio: bio, name: name, phone: phone);
  //     }
  //   }
  // }

  void updateuser(
      {@required String? phone,
      @required String? name,
      @required String? bio,
      String? image}) {
    CreateUserModel Model = CreateUserModel(
        name: name,
        phone: phone,
        bio: bio,
        image: profileImageUrl,
        email: model!.email,
        uid: model!.uid);

    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uid)
        .update(Model.tomap())
        .then((value) {
      getuserdata();
    }).catchError((Error) {
      print(Error);
      emit(SocialUpdateUserErorrState(Error.toString()));
    });
  }

  File? postImage;

  Future<void> UploadPostImage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      var imagename = basename(PickedFile.path);

      postImage = File(PickedFile.path);

      emit(SocialSucsessImagePostPickermState());

      print(imagename);
    } else {
      print('no image selected');

      emit(SocialErorrImagePostPickerState());
    }
  }

  void CreatePostImage({
    @required String? time,
    @required String? text,
  }) {
    emit(SocialCreatePostLoadingState());

    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) => {
              value.ref
                  .getDownloadURL()
                  .then((value) => {
                        CreatePost(time: time, text: text, postimage: value),
                        emit(SocialSucsessImageUploadState()),
                      })
                  .catchError((error) {
                emit(SocialErorrImagePostPickerState());
                print(error.toString());
              })
            })
        .catchError((erorr) {
      emit(SocialErorrImagePostPickerState());
      print(erorr.toString());
    });
  }

  void CreatePost(
      {@required String? uid,
      @required String? image,
      @required String? time,
      @required String? text,
      @required String? postimage}) {
    emit(SocialCreatePostLoadingState());

    NewPostModel Model = NewPostModel(
      uid: model?.uid,
      image: model?.image,
      postimage: postImage,
      time: time,
      text: text,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .doc('1')
        .set(Model.tomap())
        .then((value) {
      emit(SocialCreatePostSucsessState());
    }).catchError((Error) {
      print(Error);
      emit(SocialUpdateUserErorrState(Error.toString()));
    });
  }
}
