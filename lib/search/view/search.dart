import 'package:flutter/material.dart';
import 'package:housegroom/widgets/button.dart';

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
      image: Image.asset(
        'images/service.png',
      ),
    ),
    Item(
      header: "specialities",
      body: "body3",
      image: Image.asset('images/speciality.png'),
    ),
    Item(
      header: "Gender",
      body: "body2",
      image: Image.asset('images/gender.png'),
    ),
    Item(
      header: "Age",
      body: "body3",
      image: Image.asset('images/age.png'),
    ),
    Item(
      header: "Experience",
      body: "body3",
      image: Image.asset('images/Experience.png'),
    ),
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
                    ProfessionalWidget("Domestic helper"),
                    ProfessionalWidget("Cook"),
                    ProfessionalWidget("Office boy"),
                    ProfessionalWidget("Driver"),
                    ProfessionalWidget("xyz"),
                    ProfessionalWidget("Electrician"),
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
                                backgroundColor: Colors.white,
                                child: item.image,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              //TODO:check
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
            Container(
                margin: EdgeInsets.all(15),
                child: AppButton(
                    title: "submit", onpressed: null, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

//profession chips listview
class ProfessionalWidget extends StatelessWidget {
  final title;
  ProfessionalWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Chip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        elevation: 5,
        label: Container(
          height: 40,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
