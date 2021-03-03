import 'package:flutter/material.dart';
import 'package:housegroom/widgets/professionWidget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class Item {
  bool isExpanded;
  final String header;
  final String body;
  final Image image;
  Item({this.isExpanded: false, this.header, this.body, this.image});
}

class _SearchState extends State<Search> {
  //TODO: add images
  List<Item> _items = <Item>[
    Item(
      header: "Types of Services",
      body: "body1",
    ),
    Item(header: "specialities", body: "body3"),
    Item(header: "Gender", body: "body2"),
    Item(header: "Age", body: "body3"),
    Item(header: "Experience", body: "body3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.blue,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 80,
                width: 500,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: ProfessionalWidget("Domestic"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: ProfessionalWidget("Cook"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: ProfessionalWidget("Office boy"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: ProfessionalWidget("Driver"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: ProfessionalWidget("xyz"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: ProfessionalWidget("Electrician"),
                      //todo: onselect color changes to black
                      onPressed: () {},
                    ),
                  ],
                )),

            //expansion panel
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map((Item item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              //check
                              item.header,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  isExpanded: item.isExpanded,
                  body: Column(
                    children: [
                      Card(
                        elevation: 7,
                        child: ListTile(
                          title: Text(item.body),
                          //todo:change radio logic
                          trailing: Radio(
                            value: 1,
                            groupValue: 1,
                            activeColor: Colors.blue,
                            onChanged: (val) {
                              print("Radio $val");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 40),
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
      ),
    );
  }
}
