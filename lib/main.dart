import 'package:flutter/material.dart';
import 'package:retrofit_xml_sample_app/api/smart_dublin.dart';
import 'package:retrofit_xml_sample_app/models/stop.dart';
import 'package:dio/dio.dart';

const kStopId = '7602';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus stop info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stop _stop = Stop(arrivals: [], stopId: kStopId);
  final _apiClient = SmartDublinClient(Dio());

  void loadStopInformation() async {
    Stop stop = await _apiClient.getStopInformation(kStopId);
    setState(() {
      _stop = stop;
    });
  }

  Widget buildList() {
    if (_stop.arrivals.isEmpty) {
      return Text("Empty");
    }
    return ListView.builder(
      itemCount: _stop.arrivals.length,
      itemBuilder: (BuildContext context, int index) {
        return Text('LOL');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loadStopInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ' 🚌 Stop 7602',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Flexible(
              child: buildList(),
            )
          ],
        ),
      ),
    );
  }
}
