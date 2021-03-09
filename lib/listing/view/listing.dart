import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/listing/bloc/listing_bloc.dart';

import '../../route.dart';

class Listing extends StatelessWidget {
//  final names = List<String>.generate(10, (i) => "Person $i");
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
      body: BlocBuilder<ListingBloc, ListingState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.names.length,
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
                  //todp:add here
                  title: Text('${state.names}'),
                  //TODO:add stars
                  subtitle: Row(
                    children: [
                      starWidget(state.star),
                      starWidget(state.star),
                      starWidget(state.star),
                      starWidget(state.star),
                      starWidget(state.star),
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
          );
        },
      ),
    );
  }
}

Icon starWidget(Widget icons) {
  return Icon(
    Icons.star,
    color: Colors.amberAccent,
    size: 30,
  );
}
