import 'package:chat_app/share/component/component.dart';
import 'package:chat_app/share/cubit/cubit.dart';
import 'package:chat_app/share/cubit/states.dart';
import 'package:chat_app/share/style/Iconly-Broken_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPost extends StatelessWidget {
  var postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, States>(
        listener: (context, stat) {},
        builder: (context, stat) => Scaffold(
              appBar: defaultAppBar(
                  context: context,
                  onPressed: () {},
                  title: 'Add Post',
                  action: TextButton(
                      onPressed: () {
                        MainCubit.getInstance(context).createPost(
                            post: postController.text,
                            date: DateTime.now().toString());
                      },
                      child: Text('POST'))),
              body: MainCubit.getInstance(context).profile == null
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 35.0,
                                backgroundImage: NetworkImage(
                                    MainCubit.getInstance(context)
                                        .profile!
                                        .profileImage),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                MainCubit.getInstance(context).profile!.name,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: postController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write here',
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                          MainCubit.getInstance(context).postImage != null
                              ? Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Image(
                                          width: double.infinity,
                                          height: 200,
                                          image: NetworkImage(
                                             MainCubit.getInstance(context).postImage??''),
                                          fit: BoxFit.cover,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              MainCubit.getInstance(context)
                                                  .deletePostImage();
                                            },
                                            icon: Icon(
                                                Iconly_Broken.Close_Square)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                )
                              : SizedBox(),
                          Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                onPressed: () {
                                  MainCubit.getInstance(context).uploadPost();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Iconly_Broken.Image),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('add photo'),
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: TextButton(
                                onPressed: () {},
                                child: Text('# add tags'),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
            ));
  }
}
