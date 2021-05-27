import 'package:chat_app/layouts/home-layout.dart';
import 'package:chat_app/models/user-data.dart';
import 'package:chat_app/modules/register/register-states.dart';
import 'package:chat_app/share/component/component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit <RegisterStates>{
  RegisterCubit() : super(RegisterInitState());
  static RegisterCubit getInstance(context) => BlocProvider.of(context);

  //Password Handling
  IconData suffix=Icons.remove_red_eye;
  bool isHidden=true;
  changePasswordState(){
    isHidden= !isHidden;
    suffix=isHidden?Icons.remove_red_eye:Icons.remove_red_eye_outlined;
    emit(RegisterChangePasswordState());
  }
  register({
    required String email,
    required String password,
    required String phone,
    required String name,
    required BuildContext context,
  }){
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(RegisterSuccessState());
          createUser(email: email, uId: value.user!.uid, phone: phone, name: name,context: context);
      print(value.user?.email.toString());
    }).catchError((onError){
      print(onError.toString());
    });
  }
  createUser({ required String email,
    required String uId,
    required String phone,
    required String name,
  required BuildContext context}){
    Map<String,dynamic> model=UserData(name, phone, email, uId).toMap();
    FirebaseFirestore.instance.collection('users').doc(uId).set(model).then((value){
      navigateAndFinish(context, HomeLayout());
    }).catchError((onError){
      FirebaseAuth.instance.currentUser?.delete().then((value){
      }).catchError((onError){
        print(onError);
      });
    });
  }

}
