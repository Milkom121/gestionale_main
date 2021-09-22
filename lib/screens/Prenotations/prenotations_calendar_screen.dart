import 'package:flutter/material.dart';
import 'package:gestionale_main/data/customers.dart';
import 'package:gestionale_main/data/prenotations.dart';
import 'package:gestionale_main/screens/Prenotations/pool_prenotations/pool_prenotation_screen.dart';
import 'package:gestionale_main/screens/Prenotations/restaurant_prenotation/restaurant_prenotation_screen.dart';
import 'package:gestionale_main/widgets/app_navigation_bar.dart';
import 'package:gestionale_main/widgets/expandable_fab.dart';
import 'package:gestionale_main/widgets/prenotation_list_tile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class PrenotationsCalendarScreen extends StatefulWidget {
  static const String routeName = '/PrenotationsCalendarScreen';
  final int screenIndex = 4;

  @override
  _PrenotationsCalendarScreenState createState() =>
      _PrenotationsCalendarScreenState();
}

class _PrenotationsCalendarScreenState
    extends State<PrenotationsCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final prenotationsProvider = Provider.of<Prenotations>(context);

    return Scaffold(
      bottomNavigationBar: AppNavigationBar(widget.screenIndex),
      floatingActionButton: ExpandableFab(distance: 95, children: [
        ActionButton(
          icon: Icon(Icons.pool),
          onPressed: () =>
              Navigator.pushNamed(context, PoolPrenotationScreen.routeName),
        ),
        ActionButton(
          icon: Icon(Icons.restaurant),
          onPressed: () => Navigator.pushNamed(
              context, RestaurantPrenotationScreen.routeName),
        ),
        ActionButton(
            icon: Icon(Icons.add),
            onPressed: () =>
            ///------------------------------------------------------- Start test----------------------------------------------
            ///------------------------------------------------------- Start test---------------------------------------------
            ///------------------------------------------------------- Start test---------------------------------------------
                showModalBottomSheet(context: context, builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: new Icon(Icons.photo),
                        title: new Text('Photo'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: new Icon(Icons.music_note),
                        title: new Text('Music'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: new Icon(Icons.videocam),
                        title: new Text('Video'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: new Icon(Icons.share),
                        title: new Text('Share'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },),
          ///------------------------------------------------------- End test----------------------------------------------
          ///------------------------------------------------------- End test----------------------------------------------
          ///------------------------------------------------------- End test----------------------------------------------

        ),
      ]),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.pushNamed(context, PoolPrenotationScreen.routeName);
      //   },
      // ),

      appBar: AppBar(
        title: Text('Prenotations Overview'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: ExpansionTile(
                title: Text('Calendar'),
                initiallyExpanded: true,
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },

                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                      prenotationsProvider
                          .searchPrenotationsByDate(_selectedDay!);

                      ///verificare perche non funziona, probabilmente il formato di _selectedDay
                    },

                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },

                    // eventLoader: ,
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: prenotationsProvider.foundPrenotations.length,
                itemBuilder: (BuildContext context, int index) {
                  return PrenotationsListTile(
                    prenotationsProvider.foundPrenotations[index].title,
                    prenotationsProvider
                        .foundPrenotations[index].telephoneNumber,
                    prenotationsProvider.foundPrenotations[index].date,
                  );
                }),
          )
        ],
      ),
    );
  }
}
