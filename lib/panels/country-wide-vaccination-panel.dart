import 'package:covid_tracker/panels/country-wide-panel.dart';
import 'package:flutter/material.dart';

class CountryWideVaccinationPanel extends StatelessWidget {

  final List? vaccinationData;

  const CountryWideVaccinationPanel({Key? key, required this.vaccinationData}) : super(key: key);

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
            panelColor: Colors.deepPurple[100],
            textColor: Colors.deepPurple[900],
            title: "Total doses",
            count: vaccinationData![0]['total_doses'].toString()
          ),
          StatusPanel(
            panelColor: Colors.lime[100],
            textColor: Colors.lime[900],
            title: "Vaccinated",
            count: vaccinationData![0]['total_vaccinated'].toString()
          ),
          StatusPanel(
            panelColor: Colors.teal[100],
            textColor: Colors.teal[900],
            title: "Fully Vaccinated",
            count: vaccinationData![0]['total_fully_vaccinated'].toString()
          ),
          StatusPanel(
            panelColor: Colors.cyan[100],
            textColor: Colors.cyan[900],
            title: "Population",
            count: vaccinationData![0]['population'].toString()
          ),
        ],
      ),
    );
  }
}