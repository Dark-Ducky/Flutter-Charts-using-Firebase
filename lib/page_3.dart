// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages

void main() {
  runApp(const Chart3());
}

class Chart3 extends StatelessWidget {
  const Chart3({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Chart Analysis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SalesDetails> sales = [];

  Future<String> getJsonFromFirebase() async {
    String url =
        'https://productiondata-33c6f-default-rtdb.firebaseio.com/data2.json';
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future loadSalesData() async {
    final String jsonString = await getJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      sales.add(SalesDetails.fromJson(i));
    }
  }

  @override
  void initState() {
    loadSalesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Line Chart"),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 8, 51, 79),
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
            body: FutureBuilder(
              future: getJsonFromFirebase(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return (SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    title: ChartTitle(text: 'Yearly Sales Analysis'),
                    legend: Legend(
                      isVisible: true,
                    ),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries>[
                      LineSeries<SalesDetails, String>(
                        dataSource: sales,
                        xValueMapper: (SalesDetails details, _) =>
                            details.Month,
                        yValueMapper: (SalesDetails details, _) =>
                            details.Production,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                        name: 'Production Of Fruits',
                      ),
                    ],
                    primaryYAxis: NumericAxis(
                      labelFormat: '{value} Ton',
                    ),
                  ));
                } else {
                  const Center(child: CircularProgressIndicator());
                }
                return const SizedBox.shrink();
              },
            )));
  }
}

class SalesDetails {
  SalesDetails(this.Month, this.Production);
  final String Month;
  final int Production;

  factory SalesDetails.fromJson(Map<String, dynamic> parsedJson) {
    return SalesDetails(
        parsedJson['Month'].toString(), parsedJson['Production']);
  }
}
