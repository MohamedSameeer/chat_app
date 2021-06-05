import 'package:chat_app/share/style/Iconly-Broken_icons.dart';
import 'package:chat_app/share/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultTextFormField({
  required controller,
  required String label,
  required prefix,
  required textType,
  suffix,
  init,
  bool isPassword = false,
}) =>
    TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        maxLines: 1,
        initialValue: init,
        keyboardType: textType,
        validator: (String? text) {
          if ((text?.isEmpty) == true)
            return "This field can't be empty";
          else
            return null;
        });

Widget defaultSeparator() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget defaultButton({
  required onPressed,
  required text,
}) =>
    MaterialButton(
      minWidth: double.infinity,
      color: defaultColor,
      onPressed: onPressed,
      child: Text(text),
    );

toast({
  required msg,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }
Color chooseToastColor(ToastState state) {
  switch (state) {
    case ToastState.SUCCESS:
      return Colors.green;
      break;
    case ToastState.ERROR:
      return Colors.red;
      break;
    case ToastState.WARNING:
      return Colors.amber;
      break;
  }
}

AppBar defaultAppBar({
  required BuildContext context,
  required onPressed,
  title,
  action,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Iconly_Broken.Arrow___Left_2),
      ),
      title: Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    ),
      actions: [
        action
      ],
    );
