import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Add Post',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),

    );
  }
}
