import 'package:flutter/material.dart';

class RadioButtonsRow extends StatefulWidget {
  const RadioButtonsRow({super.key});

  @override
  _RadioButtonsRowState createState() => _RadioButtonsRowState();
}

class _RadioButtonsRowState extends State<RadioButtonsRow> {
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    // Initialize the selected radio button with a default value.
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (val) {
                  setSelectedRadio(val!);
                },
              ),
              const Text('fasfas')
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: selectedRadio,
                onChanged: (val) {
                  setSelectedRadio(val!);
                },
              ),
              const Text('fasfas')
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: selectedRadio,
                onChanged: (val) {
                  setSelectedRadio(val!);
                },
              ),
              const Text('ds')
            ],
          ),
        ],
      ),
    );
  }
}
