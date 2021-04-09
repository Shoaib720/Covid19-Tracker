import 'package:flutter/material.dart';

class CountryWidePanel extends StatelessWidget {
  final Map? countryData;

  const CountryWidePanel({Key? key, required this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2
        ),
        children: [
          StatusPanel(
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            title: "Confirmed",
            count: countryData!['data']['summary']['confirmedCasesIndian'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            title: "Active",
            count: countryData!['data']['unofficial-summary'][0]['active'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.green[100],
            textColor: Colors.green[900],
            title: "Recovered",
            count: countryData!['data']['summary']['discharged'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            title: "Deaths",
            count: countryData!['data']['summary']['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color? panelColor;
  final Color? textColor;
  final String title;
  final String count;

  const StatusPanel({Key? key, required this.panelColor, required this.textColor, required this.title, required this.count}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(5),
      color: panelColor,
      width: MediaQuery.of(context).size.width/2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor
            ),
          ),
        ],
      ),
    );
  }
}