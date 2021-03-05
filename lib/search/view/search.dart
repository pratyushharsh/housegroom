import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/route.dart';
import 'package:housegroom/search/bloc/search_bloc.dart';
import 'package:housegroom/search/view/options.dart';
import 'package:housegroom/widgets/button.dart';

class DomesticHelperSearch extends StatefulWidget {
  @override
  _DomesticHelperSearchState createState() => _DomesticHelperSearchState();
}

class Item {
  bool isExpanded;
  final String header;
  final String body;
  final Image image;
  Item({this.isExpanded: false, this.header, this.body, this.image});
}

class _DomesticHelperSearchState extends State<DomesticHelperSearch> {
  var _items = SEARCH_OPTIONS;

  Set<String> expandedSet = new Set();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(),
      child: Scaffold(
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
        body: SingleChildScrollView(
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return Column(
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
                      // _items[index].isExpanded = !_items[index].isExpanded;
                      print('Index ${index} ${isExpanded}');
                      if (isExpanded) {
                        expandedSet.remove(_items[index].headerTag);
                      } else {
                        expandedSet.add(_items[index].headerTag);
                      }
                    });
                  },
                  children: _items.map((DomesticHelperSearchOption item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Container(
                            padding: EdgeInsets.all(10),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(item.imageUrl),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  //TODO:check
                                  item.headerDescription,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      isExpanded: expandedSet.contains(item.headerTag),
                      body: Column(
                        children: item.items
                            .map(
                              (e) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: ListTile(
                                  title: Text(e.description),
                                  trailing: Radio(
                                    value: e.tag,
                                    groupValue: state.map[item.headerTag],
                                    activeColor: Colors.blue,
                                    onChanged: (val) {
                                      BlocProvider.of<SearchBloc>(context).add(
                                          ChangeCategoryValue(
                                              item.headerTag, e.tag));
                                    },
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),
                Container(
                    margin: EdgeInsets.all(15),
                    child: AppButton(
                        title: "submit",
                        onpressed: () {
                          BlocProvider.of<SearchBloc>(context).state;
                          Navigator.of(context)
                              .pushNamed(RouteConfiguration.LISTING_PAGE);
                        })),
              ],
            );
          }),
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
      margin: EdgeInsets.all(4),
      child: Chip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        elevation: 5,
        label: Container(
          height: 25,
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
