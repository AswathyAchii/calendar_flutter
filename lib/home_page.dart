
import 'package:flutter/material.dart';


import 'calender/calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _date = DateTime.now();
  // ignore: unused_element
  Future<void> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        // ignore: avoid_print
        print(_date.toString());
      });
    }
  }

  Future calender(BuildContext ctx) async {
    return showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return const SimpleDialog(
            title: Text("Schedule Date"),
            children: [
              SizedBox(height: 600, width: 450, child: Calendar()),
            ],
          );
        });
  }

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // _selectDate(context);
            calender(context);

            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Calendar()));
          },
          child: const Text("Calender"),
        ),
      ),
    );
  }
}

