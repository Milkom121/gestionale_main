import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class RestaurantPrenotationScreen extends StatefulWidget {
  static const String routeName = '/RestaurantPrenotationScreen';

  final _formKey = GlobalKey<FormState>();

  ///la key che mi consentirà di gestire le azioni sul form di inserimento

  @override
  _RestaurantPrenotationScreenState createState() =>
      _RestaurantPrenotationScreenState();
}

class _RestaurantPrenotationScreenState
    extends State<RestaurantPrenotationScreen> {

  var _timeController;

  @override
  void initState() {
    ///per evitare malfunzionamenti (es: tasiera che si chiude appena aperta) devo inizializzare la formKey nello stato iniziale
    widget._formKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Form(
                key: widget._formKey,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          // Use email input type for emails.
                          decoration: InputDecoration(
                              icon: Icon(Icons.account_circle),
                              hintText: 'Search customer',
                              labelText: 'Customer')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        controller: _timeController,
                        //initialValue: _initialValue,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        onSaved: (day) {


                        },

                        onChanged: (val) =>
                            setState(() => _timeController.text = val),
                      ),

                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
