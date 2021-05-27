import 'package:chat_app/share/cubit/cubit.dart';
import 'package:chat_app/share/cubit/states.dart';
import 'package:chat_app/share/style/Iconly-Broken_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context)=>MainCubit(),
      child: BlocConsumer<MainCubit,States>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state)=>Scaffold(
          appBar: AppBar(
            title: Text(
                MainCubit.getInstance(context).titles[MainCubit.getInstance(context).currentIndex],
            style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: MainCubit.getInstance(context).bottomNavigationPages[MainCubit.getInstance(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: MainCubit.getInstance(context).currentIndex,
            onTap: (index){
              MainCubit.getInstance(context).changeBottomNav(index,context);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Iconly_Broken.Home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconly_Broken.Chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconly_Broken.Paper_Plus),
                label: 'Add Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconly_Broken.User),
                label: 'User',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconly_Broken.Setting),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
