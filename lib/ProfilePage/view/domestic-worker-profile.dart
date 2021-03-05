import 'package:flutter/material.dart';

import '../../route.dart';

class DomesticWorkerProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'images/groom1.png',
            fit: BoxFit.fill,
            height: 30,
            width: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(RouteConfiguration.HOME_PAGE);
          },
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 7,
              margin: EdgeInsets.only(top: 15),
              child: Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.amberAccent,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 30),
                          child: Text(
                            "Poonam Devi",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            "+91-987654321",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.call,
                                color: Colors.blue,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Colors.grey,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 7,
              margin: EdgeInsets.only(top: 15),
              child: Container(
                height: 150,
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Specialities- Cooking",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Gender - Female",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Age - 30",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Experience - 2-3 years",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 7,
              margin: EdgeInsets.only(top: 15),
              child: Container(
                height: 200,
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                            Text(
                              "4/5",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ButtonTheme(
                                minWidth: 100,
                                height: 30,
                                buttonColor: Colors.white,
                                child: RaisedButton(
                                  child: Text("View All"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "10 Rating",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.lock_clock,
                            size: 30,
                          ),
                          Icon(
                            Icons.lock_clock,
                            size: 30,
                          ),
                          Icon(
                            Icons.lock_clock,
                            size: 30,
                          ),
                          Icon(
                            Icons.lock_clock,
                            size: 30,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("2"),
                          Text("2"),
                          Text("2"),
                          Text("2"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Very punctual"),
                          Text("Quite Regular"),
                          Text("Exceptional service"),
                          Text("Great Attitude"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
