import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onpressed;
  AppButton({@required this.onpressed, @required this.title});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: Colors.green,
      minWidth: 350,
      height: 50,
      child: RaisedButton(
        color: Colors.green,
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        textColor: Colors.white,
        onPressed: onpressed,
      ),
    );
  }
}
