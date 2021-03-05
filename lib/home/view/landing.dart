import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housegroom/route.dart';

class CatategoryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width / 3 - 20;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouteConfiguration.DOMESTIC_HELPER_SEARCH);
      },
      child: Container(
        height: height,
        width: height,
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
          child: Icon(Icons.person_rounded),
        ),
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: Container(
        height: 200,
        width: 300,
      ),
    );
  }
}

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SliderCard(),
                    SliderCard(),
                    SliderCard(),
                    SliderCard(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(4),
                  child: Text(
                    "Service by Category",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: [
                  CatategoryContainer(),
                  CatategoryContainer(),
                  CatategoryContainer(),
                  CatategoryContainer(),
                  CatategoryContainer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
