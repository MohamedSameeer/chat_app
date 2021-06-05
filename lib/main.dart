import 'package:chat_app/layouts/home-layout.dart';
import 'package:chat_app/share/component/constant.dart';
import 'package:chat_app/share/cubit/cubit.dart';
import 'package:chat_app/share/network/local/cash-helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/login/login-screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit()..getProfile(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.cyan[600],
          primarySwatch: Colors.blue,

          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.blue,
            showSelectedLabels: true,
            unselectedItemColor: Colors.grey,
          ),
        ),
        home: CashHelper.getData('id') != null ? HomeLayout() : Login(),
      ),
    );
  }
}
