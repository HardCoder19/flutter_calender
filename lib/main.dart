

import 'package:flutter/material.dart';
import 'buildtextfield.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final TextEditingController _dateinput = TextEditingController();
  final TextEditingController _dateinput1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(" Date Picker"),
          backgroundColor: Colors.redAccent, //background color of app bar
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Center(
                child: Column(
              children: [
                ReuseDatePicker(
                    form: 'dd-MM-yyyy',
                    textcontroller: _dateinput1,
                    utcDate: (ans) {
                      print(ans);
                      _dateinput1.text = ans;
                    }),
                ReuseDatePicker(
                    form: 'dd-MM-yyyy',
                    textcontroller: _dateinput,
                    utcDate: (ans) {
                      print(ans);
                    }),
              ],
            ))));
  }
}
