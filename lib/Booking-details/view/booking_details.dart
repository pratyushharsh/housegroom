import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Detail"),
      ),
      body: Column(
        children: [
          Image.asset("images\groom.png"),
          SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Selected Date',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Selected Hour',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            thickness: 5.0,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            color: Colors.grey,
            child: Text(
              "Amount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            thickness: 5.0,
          ),
          SizedBox(
            height: 90,
          ),
          ButtonTheme(
            minWidth: 300,
            height: 50,
            child: RaisedButton(
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
