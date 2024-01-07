import 'package:flutter/material.dart';

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  int _pressedIndex = -1; // -1 means no button is currently selected

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                _pressedIndex == index ? Colors.blue : Colors.grey,
              ),
            ),
            onPressed: () {
              setState(() {
                _pressedIndex = index;
              });
            },
            child: Text('Button ${index + 1}'),
          );
        }),
      ),
    );
  }
}
