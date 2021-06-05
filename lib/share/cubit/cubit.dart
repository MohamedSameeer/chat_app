import 'dart:io';

import 'package:chat_app/models/post-model.dart';
import 'package:chat_app/models/profile-model.dart';
import 'package:chat_app/modules/add-post/add-post-screen.dart';
import 'package:chat_app/modules/chat/chat-screen.dart';
import 'package:chat_app/modules/home/home-screen.dart';
import 'package:chat_app/modules/settings/settings-screen.dart';
import 'package:chat_app/modules/user/user-screen.dart';
import 'package:chat_app/share/component/component.dart';
import 'package:chat_app/share/cubit/states.dart';
import 'package:chat_app/share/network/local/cash-helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MainCubit extends Cubit<States> {
  MainCubit() : super(InitialState());
  static MainCubit getInstance(context) => BlocProvider.of(context);

  // Change Pages
  int currentIndex = 0;
  List<String> titles = [
    'Home',
    'Chat',
    'Add Post',
    'User',
    'Settings',
  ];
  List<Widget> bottomNavigationPages = [
    HomeScreen(),
    ChatScreen(),
    AddPost(),
    UserScreen(),
    SettingsScreen(),
  ];
  changeBottomNav(int index, BuildContext context) {
    if (index != 2)
      currentIndex = index;
    else {
      navigateTo(context, AddPost());
    }
    emit(ChangeBottomNaveState());
  }

  //Get User Data
  ProfileModel? profile;

  getProfile() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(CashHelper.getData('id'))
        .get()
        .then((value) {
      // print(value.data());
      profile = ProfileModel.fromJson(value.data()!);
      print(profile);
      print(state);
      emit(GetSettingsState());
      print(state);
    }).catchError((onError) {
      print("errrrror : " + onError);
      emit(OnErrorSettingsState());
    });
  }

  //Pick Image
  late File profileImage;
  final picker = ImagePicker();

  Future updateProfileImage() async {
    emit(LoadingSettingsState());
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(profileImage.path).pathSegments.last}')
          .putFile(profileImage)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          ProfileModel profileModel = ProfileModel(
              profile!.name,
              profile!.phone,
              profile!.email,
              profile!.uId,
              profile!.bio,
              profile!.coverImage,
              value);
          FirebaseFirestore.instance
              .collection('users')
              .doc(profile!.uId)
              .update(profileModel.toMap())
              .then((value) {
            firebase_storage.FirebaseStorage.instance
                .refFromURL(profile!.profileImage)
                .delete()
                .then((value) {
              getProfile();
            }).catchError((error) {
              print(error);
            });
          }).catchError((onError) {
            emit(OnErrorSettingsState());
          });
        });
      }).catchError((onError) {
        emit(OnErrorSettingsState());
      });
    } else {
      emit(ChangeProfileImageSettingsState());
      print('No image selected.');
    }
  }

  late File coverImage;

  Future updateCoverImage() async {
    emit(LoadingSettingsState());
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(coverImage.path).pathSegments.last}')
          .putFile(coverImage)
          .then((image) {
        firebase_storage.FirebaseStorage.instance
            .refFromURL(profile!.coverImage)
            .delete()
            .then((value) {
          image.ref.getDownloadURL().then((value) {
            FirebaseFirestore.instance
                .collection('users')
                .doc(CashHelper.getData('id'))
                .update({
              'bio': profile!.bio,
              'name': profile!.name,
              'email': profile!.email,
              'phone': profile!.phone,
              'uId': profile!.uId,
              'profileImage': profile!.profileImage,
              'coverImage': value,
            }).then((value) {
              getProfile();
            }).catchError((onError) {
              emit(OnErrorSettingsState());
            });
          });
        }).catchError((onError) {
          emit(ChangeProfileImageSettingsState());
        });
      });
    } else {
      emit(ChangeProfileImageSettingsState());
      print('No image selected.');
    }
  }

  //Update user without image
  updateUser(
      {required String bio, required String name, required String phone}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(CashHelper.getData('id'))
        .update({
      'bio': bio,
      'name': name,
      'email': profile!.email,
      'phone': phone,
      'uId': profile!.uId,
      'profileImage': profile!.profileImage,
      'coverImage': profile!.coverImage,
    }).then((value) {
      getProfile();
    }).catchError((onError) {
      emit(OnErrorSettingsState());
    });
  }

  //uploadPost
  String? postImage;
  uploadPost() async {
    File? postImage;
    emit(LoadingSettingsState());
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('posts/${Uri.file(postImage.path).pathSegments.last}')
          .putFile(postImage)
          .then((image) {
        image.ref.getDownloadURL().then((value) {
          this.postImage = value;
          emit(PickPostImageSuccessState());
        }).catchError((onError) {
          emit(OnErrorSettingsState());
        });
      }).catchError((onError) {
        emit(OnErrorSettingsState());
      });
    } else {
      emit(ChangeProfileImageSettingsState());
      print('No image selected.');
    }
  }

  //create post
  createPost({required post, required date}) {
    FirebaseFirestore.instance
        .collection('posts')
        .add(PostModel(profile!.name, date, post, this.postImage ?? '',
                profile!.profileImage)
            .toMap())
        .then((value) {
      emit(UploadPostSuccessState());
    }).catchError((error) {
      emit(OnErrorSettingsState());
    });
  }

  //Delete post image
  deletePostImage() {
    firebase_storage.FirebaseStorage.instance.refFromURL(postImage??'').delete().then((value){
      postImage=null;
      emit(DeletePostImageSuccessState());
    }).catchError((onError){
      emit(OnErrorSettingsState());
    });
  }

//GetPosts
  List<PostModel>posts=[];
  getPosts(){
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print(element.data());
        posts.add(PostModel.fromJson(element.data()));
        emit(HomeGetPostsSuccessState());
      });
    }).catchError((onError){
      print('Get posts error: '+onError.toString());
      emit(HomeGetPostsErrorState());
    });
  }
}
