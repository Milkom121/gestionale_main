import 'package:flutter/material.dart';

class CustomerListTile extends StatelessWidget {
  final String name;
  final String telephoneNumber;
  final String location;

  const CustomerListTile(this.name, this.telephoneNumber, this.location);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(name),
        subtitle: Text(telephoneNumber),
      ),
    );
  }
}
