import 'package:flutter/material.dart';
import 'package:miniproject/page_1.dart';
import 'package:miniproject/page_2.dart';
import 'package:miniproject/page_3.dart';
import 'package:miniproject/page_4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Supply Chain Management';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title), backgroundColor: Colors.blue),
        body: const MyStatefulWidget(),
        backgroundColor: Colors.cyanAccent,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  const Color.fromARGB(255, 8, 51, 79), // foreground
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chart1()),
              );
            },
            child: const Text('A.Y. 2020-2021'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  const Color.fromARGB(255, 8, 51, 79), // foreground
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chart2()),
              );
            },
            child: const Text('A.Y. 2021-2022'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  const Color.fromARGB(255, 8, 51, 79), // foreground
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chart3()),
              );
            },
            child: const Text('A.Y. 2022-2023'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  const Color.fromARGB(255, 8, 51, 79), // foreground
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chart4()),
              );
            },
            child: const Text('A.Y. 2023-2024'),
          ),
        ],
      ),
    );
  }
}
