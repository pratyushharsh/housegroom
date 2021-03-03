import 'package:flutter/material.dart';

class ProfessionalWidget extends StatelessWidget {
  final title;
  ProfessionalWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.black, width: 2)),
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      )),
    );
  }
}
