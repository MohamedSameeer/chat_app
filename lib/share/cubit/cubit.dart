import 'package:chat_app/modules/add-post/add-post-screen.dart';
import 'package:chat_app/modules/chat/chat-screen.dart';
import 'package:chat_app/modules/home/home-screen.dart';
import 'package:chat_app/modules/settings/settings-screen.dart';
import 'package:chat_app/modules/user/user-screen.dart';
import 'package:chat_app/share/component/component.dart';
import 'package:chat_app/share/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<States>{
  MainCubit():super(InitialState());
  static MainCubit getInstance(context)=>BlocProvider.of(context);

  // Change Pages
  int currentIndex=0;
  List<String> titles=[
    'Home',
    'Chat',
    'Add Post',
    'User',
    'Settings',
  ];
  List<Widget> bottomNavigationPages=[
    HomeScreen(),
    ChatScreen(),
    AddPost(),
    UserScreen(),
    SettingsScreen(),
  ];
  changeBottomNav(int index,BuildContext context){
    if(index!=2)
      currentIndex=index;
    else{
      navigateTo(context,AddPost());
    }
    emit(ChangeBottomNaveState());
  }
}