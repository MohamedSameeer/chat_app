import 'package:chat_app/models/profile-model.dart';
import 'package:chat_app/share/component/component.dart';
import 'package:chat_app/share/cubit/cubit.dart';
import 'package:chat_app/share/cubit/states.dart';
import 'package:chat_app/share/style/Iconly-Broken_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserScreen extends StatelessWidget {
  // const UpdateUserScreen({Key key}) : super(key: key);
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var bioController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        var profile =
            MainCubit.getInstance(context).profile;
        nameController.text=profile!.name;
        bioController.text=profile.bio;
        phoneController.text=profile.phone;
        return Scaffold(
          appBar: defaultAppBar(context: context,onPressed: () {}),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if(state is LoadingSettingsState)
                  LinearProgressIndicator(),
                SizedBox(height: 15,),
                Container(
                  height: 260,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.lightBlue,
                              child: IconButton(
                                  onPressed: () {
                                    MainCubit.getInstance(context)
                                        .updateCoverImage();
                                  },
                                  icon: Icon(
                                    Iconly_Broken.Camera,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                MainCubit.getInstance(context)
                                    .profile!.coverImage,
                              ),
                            )),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
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
                                        .profile!.profileImage,
                                  )),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            child: IconButton(
                                onPressed: () {
                                  MainCubit.getInstance(context)
                                      .updateProfileImage();
                                },
                                icon: Icon(
                                  Iconly_Broken.Camera,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                defaultTextFormField(
                    controller: nameController,
                    label: 'Name',
                    prefix: Icon(Iconly_Broken.User),
                    textType: TextInputType.text
                ),
                SizedBox(height: 10,),
                defaultTextFormField(
                    controller: bioController,
                    label: 'Bio',
                    prefix: Icon(Iconly_Broken.Paper),
                    textType: TextInputType.text
                ),
                SizedBox(height: 10,),
                defaultTextFormField(
                    controller: phoneController,
                    label: 'Phone',
                    prefix: Icon(Iconly_Broken.Call),
                    textType: TextInputType.phone
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                      onPressed: () {
                        MainCubit.getInstance(context).updateUser(bio: bioController.text, name: nameController.text, phone: phoneController.text);
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
          ),
        );
      },
    );
  }
}
