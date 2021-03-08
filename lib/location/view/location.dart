import 'package:flutter/material.dart';
import 'package:housegroom/widgets/button.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(8),
          child: Image.asset(
            'images/groom1.png',
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 100, top: 15, bottom: 15),
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 5),
                  prefixIcon: Icon(Icons.location_on, color: Colors.black),
                  hintText: "Choose your location",
                  fillColor: Colors.white70),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            //TODO:location logic
            AppButton(
              onpressed: null,
              title: "SAVED LOCATION",
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
