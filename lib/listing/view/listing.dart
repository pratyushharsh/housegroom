import 'package:flutter/material.dart';

import '../../route.dart';

class Listing extends StatelessWidget {
  final names = List<String>.generate(10, (i) => "Person $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Results",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 7,
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: CircleAvatar(
                //backgroundImage: ,
                radius: 30,
                backgroundColor: Colors.blue,
              ),
              title: Text('${names[index]}'),
              //TODO:add stars
              subtitle: Row(
                children: [
                  starWidget(),
                  starWidget(),
                  starWidget(),
                  starWidget(),
                  starWidget(),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      RouteConfiguration.DOMESTIC_WORKER_PROFILE_PAGE);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

Icon starWidget() {
  return Icon(
    Icons.star,
    color: Colors.amberAccent,
    size: 30,
  );
}
