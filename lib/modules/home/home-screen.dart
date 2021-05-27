import 'package:chat_app/share/style/Iconly-Broken_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                itemBuilder: (context,index)=>buildPost(context), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: 10),
          ],
        ),
      ),
    );
  }
  Widget buildPost(context)=>Card(
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
                  'https://image.freepik.com/free-photo/happy-man-listening-music-apple-airpods-wireless_132310-3265.jpg',
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
                        'Mohamed Samir',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.check_circle,
                        color:Colors.lightBlue,
                        size: 18.0,
                      ),
                    ],
                  ),
                  Text(
                    'May 27, 2021 at 1:00 pm',
                    style:
                    Theme.of(context).textTheme.caption?.copyWith(
                      height: 1.3,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.more_horiz),
            ],
          ),
          SizedBox(height: 15,),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              height: 1.7,
            ),
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                Container(
                  height:20,
                  child: MaterialButton(
                    minWidth: 0,
                    padding:EdgeInsets.zero,
                    onPressed: () {  },
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
          SizedBox(height: 10.0,),
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
              image:DecorationImage(
                image: NetworkImage(
                  'https://image.freepik.com/free-photo/cheerful-girl-stylish-shirt-headphones-communicates-with-friend-by-video-link_197531-4884.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Iconly_Broken.Heart,
                    size: 16.0,
                    color: Colors.red,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '120',
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
                  SizedBox(width: 5,),
                  Text(
                    '120 comments',
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
                    radius:20.0,
                    backgroundImage: NetworkImage(
                      'https://image.freepik.com/free-photo/happy-man-listening-music-apple-airpods-wireless_132310-3265.jpg',
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
                    SizedBox(width: 5,),
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
