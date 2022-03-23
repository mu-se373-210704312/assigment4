import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Example',
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
   DateTime? _selectedDate;

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Application"),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 40,//for padding
            ),
            const Text(
              "Calculate your",
              style: TextStyle(fontSize: 24, color: Colors.deepOrangeAccent),//color and font size
            ),
            SizedBox(
              height: 40,//for padding
            ),
            Container(
              color: Colors.cyanAccent,//color
              alignment: Alignment.center,//aligment for centering
              child: const Text(
                "AGE",
                style: TextStyle(fontSize: (25), color: Colors.black),//color
              ),
            ),
            SizedBox(
              height: 40,//for padding
            ),
            const Text(
              "In Years,Months,Days,Minutes",
              style: TextStyle(fontSize: 23, color: Colors.blue),//font size and color
            ),
            SizedBox(
              height: 40,//for padding
            ),
            ElevatedButton(
              onPressed:_presentDatePicker,//function referance for press
              child: const Text("Date Picker"),

            ),
            SizedBox(
              height: 40,//for padding
            ),
            Text(_selectedDate != null
                ? _selectedDate.toString()//if statement for text
                : 'No date selected!',
              style: TextStyle(fontSize: 21, color: Colors.red),//font size andcolor
            ),
          ],
        ),
      ),
    );
  }
}
