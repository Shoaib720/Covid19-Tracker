import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class StateStatisticsPage extends StatefulWidget {
  @override
  _StateStatisticsPageState createState() => _StateStatisticsPageState();
}

class _StateStatisticsPageState extends State<StateStatisticsPage> {

  Map? countryData = null;
  List? stateData = null;
  fetchCountryData()async{
    http.Response response = await http.get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    setState(() {
      countryData = jsonDecode(response.body);
      stateData = countryData!['data']['regional'];
    });
  }

  @override
  void initState(){
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Case Statistics",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: stateData == null
      ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: stateData!.length,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.all(10),
            height: 190,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xfff5f5f5),
                  blurRadius: 10,
                  offset: Offset(0,10)
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    stateData![index]['loc'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                StateStatisticsDataPanel(title: "Confirmed", count: stateData![index]['confirmedCasesIndian'].toString(), textColor: Colors.red[900]),
                StateStatisticsDataPanel(title: "Recovered", count: stateData![index]['discharged'].toString(), textColor: Colors.green),
                StateStatisticsDataPanel(title: "Deaths", count: stateData![index]['deaths'].toString(), textColor: Colors.grey[600]),
                
              ],
            ),
          );
        }
      ),
    );
  }
}

class StateStatisticsDataPanel extends StatelessWidget {
  final String title;
  final String count;
  final Color? textColor;

  const StateStatisticsDataPanel({Key? key, required this.title, required this.count, required this.textColor}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        "$title: $count",
        style: TextStyle(
          fontSize: 15,
          color: textColor
        ),
      ),
    );
  }
}