import 'package:chat_app/models/user-data.dart';
import 'package:chat_app/modules/update-user/update-user-screen.dart';
import 'package:chat_app/share/component/component.dart';
import 'package:chat_app/share/cubit/cubit.dart';
import 'package:chat_app/share/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var profile = MainCubit.getInstance(context).profile;
          return MainCubit.getInstance(context).profile!=null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 260,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      MainCubit.getInstance(context)
                                          .profile
                                          !.coverImage,
                                    ),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                radius: 64.0,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage: NetworkImage(
                                    MainCubit.getInstance(context)
                                        .profile
                                        !.profileImage,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        MainCubit.getInstance(context).profile!.name,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        MainCubit.getInstance(context).profile!.bio,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                            onPressed: () {
                              print(MainCubit.getInstance(context).profile);
                              navigateTo(context, UpdateUserScreen());
                            },
                            child: Text(
                                'Edit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
