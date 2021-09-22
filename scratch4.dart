import 'package:count_stepper/count_stepper.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/data/customers.dart';
import 'package:gestionale_main/data/prenotations.dart';
import 'package:gestionale_main/models/seats/pool_chair.dart';
import 'package:gestionale_main/models/seats_prenotation.dart';
import 'package:gestionale_main/screens/Prenotations/pool_prenotations/pool_bundle_selection_gridview_%20screen.dart';
import 'package:gestionale_main/widgets/app_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';







void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: PoolPrenotationScreen(),
    );
  }
}


class PoolPrenotationScreen extends StatefulWidget {

  static const String routeName = '/PoolPrenotationScreen';

  ///questa key mi occorre per identificare il form di inserimento
  final  formKey = GlobalKey<FormState>();

  @override
  _PoolPrenotationScreenState createState() => _PoolPrenotationScreenState();
}

class _PoolPrenotationScreenState extends State<PoolPrenotationScreen> {


  ///controller che contiene le informazioni relative alla data e ora
  TextEditingController _timeController = TextEditingController();

  ///la variabile che costituisce effettivamente la prenotazione le cui proprietà verranno compilate con i dati dell'utente
  PoolPrenotation _prenotation = PoolPrenotation(
    title: '',
    surname: '',
    seatsId: '0',
    totalAmount: 0.0,
    done: false,
    numberOfCustomers: 0,
    prenotationDate: DateTime.now(),
    prenotationHour:  DateFormat('hh:mm').format(DateTime.now()),
    seatsLocation: '',
    prenotationNotes: '',
    elementsChosen: [],
    telephoneNumber: '',
    date: '',
  );

  ///una lista di servizio che registra i beachBundle selezionati
  List beachBundleSelectedForPrenotation = [];

  ///questa variabile registra il numero di lettini selezionati nella prenotazione
  int beachChairAmount = 0;

  List beachChairSelectedForPrenotation = [];

  bool halfDayPrenotationSwitchInitialValue = false;

  ///metodo che aggiunge alla lista di riferimento tanti PoolChair() quanti indica beachChairAmount
  void addBeachChair() {
    for (int i = 0; i < beachChairAmount; i++) {
      beachChairSelectedForPrenotation.add(PoolChair());
    }
  }

  ///metodo che aggiunge gli elementi scelti alla prenotazione
  void addAllElementChosenToPrenotation() {
    beachChairSelectedForPrenotation.forEach((element) {
      _prenotation.elementsChosen.add(element);
    });


    beachBundleSelectedForPrenotation.forEach((element) {
      _prenotation.elementsChosen.add(element);
    });
  }

  /// metodo che prende una lista in ingresso e, qualora assenti,  ne aggiunge gli elementi alla lista dei beachBUndle selezionati
  void updateBundleList(List newList) {
    setState(() {
      for (var element in newList) {
        if (beachBundleSelectedForPrenotation.contains(element) == false) {
          beachBundleSelectedForPrenotation.add(element);
        }
      }
    });
    print(beachBundleSelectedForPrenotation);
  }


  /// metodo che restituisce il prezzo totale
  double returnTotalCost() {
    double totalCost = 0;

    for (int i = 0; i < beachChairAmount; i++) {
      totalCost += PoolChair().cost;
    }

    beachBundleSelectedForPrenotation.forEach((element) {
      totalCost += 9.0;
    });

    return totalCost;
  }


  /// metodo che aggiunge il prezzo totale alla prenotazione
  void addTotalAmountToPrenotation (){
    _prenotation = PoolPrenotation(
      title: _prenotation.title,
      surname: _prenotation.surname,
      prenotationHour: _prenotation.prenotationHour,
      telephoneNumber: _prenotation.telephoneNumber,
      seatsId: _prenotation.seatsId,
      totalAmount: returnTotalCost(),
      done: _prenotation.done,
      numberOfCustomers:
      _prenotation.numberOfCustomers,
      prenotationDate: _prenotation.prenotationDate,
      seatsLocation: _prenotation.seatsLocation,
      prenotationNotes: _prenotation
          .prenotationNotes,
      elementsChosen: _prenotation.elementsChosen,
      date:_prenotation.date,
    );
  }

  @override
  void initState() {
    ///per evitare malfunzionamenti devo inizializzare la formKey nello stato iniziale
    widget.formKey;
    super.initState();
  }

  @override
  void dispose() {
    ///mi ricordo di pulire il controller per evitare sprechi di memoria
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ///stabilisco un provider che mi faccia accedere alla list Prenotations
    final prenotationsProvider = Provider.of<Prenotations>(context);

    /// pare che mettendo la formKey direttamente nel build sia impossibile aprire la tastiera
    final  _formKey = widget.formKey;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Pool Prenotation',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [


                      //TODO aggiungere un toggle per segnalare se la prenotazione è giornaliera o pomeridiana
                      //TODO sostituire questo datepicker con uno che non contenga l'ora in quanto non necessaria
                      /// FORM PER DATA E ORA nella stessa riga
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'd MMM, yyyy',
                          controller: _timeController,
                          //initialValue: _initialValue,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          onSaved: (day) {
                            _prenotation = PoolPrenotation(
                              date: day!,
                              title: _prenotation.title,
                              surname: _prenotation.surname,
                              prenotationHour: _prenotation.prenotationHour,
                              telephoneNumber: _prenotation.telephoneNumber,
                              seatsId: _prenotation.seatsId,
                              totalAmount: _prenotation.totalAmount,
                              done: _prenotation.done,
                              numberOfCustomers:
                              _prenotation.numberOfCustomers,
                              prenotationDate: _prenotation.prenotationDate,
                              seatsLocation: _prenotation.seatsLocation,
                              prenotationNotes: _prenotation
                                  .prenotationNotes,
                              elementsChosen: _prenotation.elementsChosen,
                            );



                          },
                          //use24HourFormat: false,
                          //locale: Locale('pt', 'BR'),

                          onChanged: (val) =>
                              setState(() => _timeController.text = val),
                        ),
                        // child: TextFormField(
                        //   readOnly: true,
                        //   controller: _dateController,
                        //   decoration: InputDecoration(
                        //     labelText: 'Date',
                        //   ),
                        //   onTap: () async {
                        //     await showDatePicker(
                        //       context: context,
                        //       initialDate: DateTime.now(),
                        //       firstDate: DateTime(2015),
                        //       lastDate: DateTime(2025),
                        //     ).then((selectedDate) {
                        //       if (selectedDate != null) {
                        //         _dateController.text =
                        //             DateFormat('dd  MMM  yyyy')
                        //                 .format(selectedDate);
                        //       }
                        //     });
                        //   },
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter date.';
                        //     }
                        //     return null;
                        //   },
                        // ),
                      ),

                      ///FORM PER NOME CLIENTE
                      ///
                      //TODO implementare la ricerca e la selezione dei clienti registrati  invece di inserire semplicemente il nome
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child:

                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.account_circle),
                              labelText: 'Name'),
                          //textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _prenotation = PoolPrenotation(
                              title: value.toString(),
                              surname: _prenotation.surname,
                              prenotationHour: _prenotation.prenotationHour,
                              telephoneNumber: _prenotation.telephoneNumber,
                              seatsId: _prenotation.seatsId,
                              totalAmount: _prenotation.totalAmount,
                              done: _prenotation.done,
                              numberOfCustomers:
                              _prenotation.numberOfCustomers,
                              prenotationDate: _prenotation.prenotationDate,
                              seatsLocation: _prenotation.seatsLocation,
                              prenotationNotes: _prenotation
                                  .prenotationNotes,
                              elementsChosen: _prenotation.elementsChosen,
                              date: _prenotation.date,
                            );
                          },
                        ),
                      ),


                      ///------------------------- clone di prova per livesearch
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 30, right: 30),
                      //       child:SearchField(
                      //         suggestions: customersProvider.listOfAllCustomersNames(),
                      //         hint: 'SearchField Sample 2',
                      //         searchStyle: TextStyle(
                      //           fontSize: 18,
                      //           color: Colors.black.withOpacity(0.8),
                      //         ),
                      //         // validator: (x) {
                      //         //   if (!_statesOfIndia.contains(x) || x.isEmpty) {
                      //         //     return 'Please Enter a valid State';
                      //         //   }
                      //         //   return null;
                      //         // },
                      //         searchInputDecoration:
                      //         InputDecoration(
                      //           focusedBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //               color: Colors.black.withOpacity(0.8),
                      //             ),
                      //           ),
                      //           border: OutlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.red),
                      //           ),
                      //         ),
                      //         maxSuggestionsInViewPort: 6,
                      //         itemHeight: 50,
                      //         onTap: (x) {
                      //           print(x);
                      //         },
                      //       ),
                      //
                      //
                      //     ),
                      ///------------------------------------------


                      ///FORM PER NUMERO TELEFONO
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(Icons.phone),
                              labelText: 'Telephone'),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a Number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _prenotation = PoolPrenotation(
                              title: value.toString(),
                              surname: _prenotation.surname,
                              prenotationHour: _prenotation.prenotationHour,
                              telephoneNumber: value.toString(),
                              seatsId: _prenotation.seatsId,
                              totalAmount: _prenotation.totalAmount,
                              done: _prenotation.done,
                              numberOfCustomers:
                              _prenotation.numberOfCustomers,
                              prenotationDate: _prenotation.prenotationDate,
                              seatsLocation: _prenotation.seatsLocation,
                              prenotationNotes: _prenotation
                                  .prenotationNotes,
                              elementsChosen: _prenotation.elementsChosen, date: '',
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //prendo nota di ciò che desiderano tra sdraio ombrelloni e bundle sdraio+obrelloni
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 28.0, right: 30.0),
                        child: Column(
                          // column provvisoria, da rimuovere
                          children: [

                            ///QUASI UN "CUSTOM FORM" CHE AL TOCCO APRE LO SCHERMO DI SELEZIONE DEI BUNDLE E POI LI MOSTRA
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return PoolBundleSelectionAlertDialogScreen(
                                          alreadySelectedItems:
                                          beachBundleSelectedForPrenotation,
                                          sendPoolBundleSelectionToPrenotationScreen:
                                              (List newList) {
                                            updateBundleList(newList);
                                          });
                                    });
                                // setState(() {
                                //   _beachBundlePrenotation++;
                                // });
                              },
                              child: Column(
                                children: [

                                  ///QUESTA ROW CONTIENE L'ICONA E LA LABEL
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.chair_alt,
                                          color: Colors.grey, size: 30),
                                      SizedBox(width: 15),
                                      Text(
                                        beachBundleSelectedForPrenotation
                                            .isEmpty
                                            ? 'Select pool bundle'
                                            : 'Selected pool bundle',
                                        style: TextStyle(
                                            fontSize:
                                            beachBundleSelectedForPrenotation
                                                .isEmpty
                                                ? 17
                                                : 13,
                                            color: Colors.grey[600]),
                                      )
                                    ],
                                  ),

                                  ///QUESTO CONTAINER CONTIENE LA LISTVIEW CHE MOSTRA I BUNDLE SELEZIONATI
                                  Container(
                                    padding: EdgeInsets.only(left: 35),
                                    alignment: Alignment.center,
                                    color: Colors.transparent,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: beachBundleSelectedForPrenotation
                                        .isEmpty
                                        ? 10
                                        : 35,
                                    child: Padding(
                                      padding: EdgeInsets.all(3),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                        beachBundleSelectedForPrenotation
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return CircleAvatar(
                                            child: Text(
                                                beachBundleSelectedForPrenotation[
                                                index]
                                                    .toString()),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  ///QUESTA è LA LINEA CHE STA SOTTO IL FORM
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 43.0),
                                    child: Container(
                                      height: 1,
                                      width: double.infinity,
                                      color: Colors.grey[400],
                                    ),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            ///QUASI UN "CUSTOM FORM" CON COUNTER DEI LETTINI

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start,
                                  children: [
                                    Icon(Icons.chair_alt,
                                        color: Colors.grey, size: 30),
                                    SizedBox(width: 15),
                                    Text(
                                      'Select poolchairs',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey[600]),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 42.0),
                                  child: CountStepper(
                                    iconColor: Theme
                                        .of(context)
                                        .primaryColor,
                                    defaultValue: 0,
                                    // max: 100,
                                    min: 0,
                                    iconDecrementColor: Colors.red,
                                    iconIncrementColor: Colors.green,
                                    splashRadius: 30,
                                    onPressed: (value) {
                                      //TODO:aggiungere logica per inserire i lettini nella lista di elementi selezionati per la prenotazione. Per ora ho aggiunto un foor loop ma non va bene, forse sarà meglio usare un controller per questo CountStepper

                                      setState(() {
                                        beachChairAmount = value;
                                      });
                                    },
                                  ),
                                ),





                              ],
                            ),

                            ///FORM PER IL PREZZO TOTALE
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4.0, top: 50),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.euro,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    returnTotalCost().toString(),
                                    style: TextStyle(fontSize: 40),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            fontWeight: FontWeight
                                                .bold),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green)),
                                      onPressed: () {

                                        addBeachChair();
                                        addTotalAmountToPrenotation();
                                        _formKey.currentState!.save();
                                        addAllElementChosenToPrenotation();
                                        prenotationsProvider
                                            .poolPrenotations.add(
                                            _prenotation);

                                        //TODO verificare ed aggiungere i dati che mancano alla prenotation

                                      },
                                    ),
                                  )
                                ],
                              ),
                            )


                          ],
                        ),
                      ),


                      //eventuale lista dei bundle selezionati
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
