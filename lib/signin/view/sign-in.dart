import 'package:flutter/material.dart';
import 'package:housegroom/widgets/button.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: PageFlatbutton(title: "Skip"),
                ),
                SizedBox(height: 20),
                Image.asset(
                  "images/groom1.png",
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                ),
                Text(
                  "Housegroom",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Pagetext(title: "Home Service Expert"),
                SizedBox(height: 100),
                PageTextField(
                  hinttext: "Enter Mobile number",
                  labeltext: "Mobile Number",
                ),
                PageTextField(
                  hinttext: "Enter Mobile password",
                  labeltext: "Password",
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: PageFlatbutton(title: 'Forgotten Password?'),
                ),
                AppButton(
                  title: "Continue",
                  onpressed: null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pagetext(title: 'New user?'),
                    PageFlatbutton(title: 'Register here')
                  ],
                ),
                Center(
                  child: Pagetext(
                    title: "By continue, you agree to our Terms & Conditions" +
                        "\n                           and Privacy Policy",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//flatbutton
class PageFlatbutton extends StatelessWidget {
  final String title;
  PageFlatbutton({this.title});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(title),
      onPressed: () {},
    );
  }
}

//small text
class Pagetext extends StatelessWidget {
  final String title;
  Pagetext({this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.normal),
    );
  }
}
//this page textField

class PageTextField extends StatelessWidget {
  final String labeltext;
  final String hinttext;

  PageTextField({@required this.labeltext, @required this.hinttext});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            hintText: hinttext,
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            labelText: labeltext,
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            // prefix: Text('+91'),
            //Flags
            // prefixIcon: Icon(
            //   Icons.,
            //   color: Colors.green,
            // ),
          ),
        ));
  }
}
