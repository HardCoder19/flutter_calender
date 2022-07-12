import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReuseDatePicker extends StatefulWidget {
  const ReuseDatePicker(
      {required this.form,
      required this.textcontroller,
      required this.utcDate});
  final String form;
  final TextEditingController textcontroller;
  final Function(String) utcDate;

  @override
  _ReuseDatePickerState createState() => _ReuseDatePickerState();
}

class _ReuseDatePickerState extends State<ReuseDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextField(

        controller:
            widget.textcontroller, //editing controller of this TextField
        decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), //icon of text field
            labelText: "Enter Date" //label text of field
            ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            // print(
            //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat(widget.form).format(pickedDate);

            String formattedDate1 = DateFormat('yyyy-MM-dd').format(pickedDate);
            widget.utcDate(formattedDate1);
            // print(
            //     formattedDate); //formatted date output using intl package =>  2021-03-16
            //you can implement different kind of Date Format here according to your requirement
            setState(() {
              widget.textcontroller.text = formattedDate;
            });

            //print(widget.textcontroller.value);
            //set output date to TextField value.

          } else {
            print("Date is not selected");
          }
        },
      ),
    );
  }
}

//text editing controller for text field
