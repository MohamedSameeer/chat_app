import 'package:chat_app/modules/home/home-cubit.dart';
import 'package:chat_app/share/cubit/cubit.dart';
import 'package:chat_app/share/cubit/states.dart';
import 'package:chat_app/share/style/Iconly-Broken_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home-states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainCubit.getInstance(context).getPosts();
    return MainCubit.getInstance(context).posts.isEmpty
        ? Center(
            child: Text('No posts yet'),
          )
        : BlocConsumer<MainCubit, States>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 20.0,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Image(
                              width: double.infinity,
                              height: 200,
                              image: NetworkImage(
                                  'https://image.freepik.com/free-photo/cheerful-girl-stylish-shirt-headphones-communicates-with-friend-by-video-link_197531-4884.jpg'),
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Communication with friends',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildPost(context, index),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: MainCubit.getInstance(context).posts.length),
                    ],
                  ),
                ),
              );
            },
          );
  }

  Widget buildPost(context, int index) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 20.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      MainCubit.getInstance(context).posts[index].profileImage,
                    ),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            MainCubit.getInstance(context).posts[index].name,
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      height: 1.3,
                                    ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.lightBlue,
                            size: 18.0,
                          ),
                        ],
                      ),
                      Text(
                        MainCubit.getInstance(context).posts[index].date,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              height: 1.3,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                MainCubit.getInstance(context).posts[index].post,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      height: 1.7,
                    ),
              ),
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Container(
                      height: 20,
                      child: MaterialButton(
                        minWidth: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Text(
                          '#Flutter',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Colors.lightBlue,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              MainCubit.getInstance(context).posts[index].postImage != ''
                  ? Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            MainCubit.getInstance(context)
                                .posts[index]
                                .postImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconly_Broken.Heart,
                        size: 16.0,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Iconly_Broken.Chat,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0 comments',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 1.0,
                margin: EdgeInsets.symmetric(vertical: 8.0),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          MainCubit.getInstance(context).profile!.profileImage,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Write a comment...',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Iconly_Broken.Heart,
                          size: 16.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
