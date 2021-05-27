import 'package:bloc/bloc.dart';
import 'package:chat_app/layouts/home-layout.dart';
import 'package:chat_app/share/component/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login-states.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() :super(LoginInitState());

  static LoginCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  //Password Handling
  IconData suffix = Icons.remove_red_eye;
  bool isHidden = true;

  changePasswordState() {
    isHidden = !isHidden;
    suffix = isHidden ? Icons.remove_red_eye : Icons.remove_red_eye_outlined;
    emit(LoginChangePasswordState());
  }
  login(String email, String password,BuildContext context){
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(LoginSuccessState());
          navigateAndFinish(context, HomeLayout());
    }).catchError((onError){
          print(onError.toString());
    });
  }
}