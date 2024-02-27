import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: RoutingTestBody()));
}

class RoutingTestBody extends StatefulWidget {
  @override
  _RoutingTestBodyState createState() => _RoutingTestBodyState();
}

class _RoutingTestBodyState extends State<RoutingTestBody> {
  int _currentIndex = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> myList = [
    {'number': 'one', 'int': 1},
    {'number': 'two', 'int': 2},
    {'number': 'three', 'int': 3},
    {'number': 'four', 'int': 4},
    {'number': 'five', 'int': 5},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % myList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: ContainerWidget(
          key: ValueKey<int>(_currentIndex),
          data: myList[_currentIndex],
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const ContainerWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue[(data['int'] as int) * 100],
      child: TextButton(
        onPressed: () {
          // print('Button ${data['number']} clicked');
        },
        child: Text('Button ${data['number']}'),
      ),
    );
  }
}
