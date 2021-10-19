import 'package:flutter/material.dart';

class PrenotationsListTile extends StatelessWidget {
  final String title;
  final String telephoneNumber;
  final String date;

  const PrenotationsListTile(this.title, this.telephoneNumber, this.date);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(title),
        subtitle: Text(date),
      ),
    );
  }
}
