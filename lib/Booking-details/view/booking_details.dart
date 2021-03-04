import 'package:flutter/material.dart';
import 'package:housegroom/widgets/button.dart';

class BookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Booking Detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/groom.png",
              fit: BoxFit.fill,
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 40,
            ),
            MyTextField('Select Date'),
            MyTextField("Setect Hour"),
            Divider(
              thickness: 2.0,
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 40,
              alignment: Alignment.centerLeft,
              color: Colors.grey[300],
              child: Text(
                "Amount",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 2.0,
            ),
            AppButton(title: "submit", onpressed: null),
          ],
        ),
      ),
    );
  }
}

//textfields
class MyTextField extends StatelessWidget {
  final String text;
  MyTextField(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
