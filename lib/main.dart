import 'package:flutter/material.dart';
import './transections.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transection> transections = [
    Transection(id: "item1", title: "any", amount: 10.5, date: DateTime.now()),
    Transection(id: "item2", title: "any2", amount: 20.5, date: DateTime.now())
  ];

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("item"),
            TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                )),
            TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: "Amount",
                )),
            TextButton(
              onPressed: () {
                setState(() {
                  transections.add(Transection(
                      id: "item3",
                      title: titleController.text,
                      amount: double.parse(amountController.text),
                      date: DateTime.now()));
                });
              },
              child: Text("Add Poduct"),
            ),
            Expanded(
              child: ListView(
                  children: transections
                      .map((e) => Card(
                            elevation: 5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.0, color: Colors.purple)),
                                  child: Text(
                                    "\$${e.amount.toString()}",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      e.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      DateFormat.yMMMd().format(e.date),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                      .toList()),
            ),
          ],
        ));
  }
}
