import 'dart:convert';

import 'package:covid_tracker/data-source.dart';
import 'package:covid_tracker/pages/state-statistics-page.dart';
import 'package:covid_tracker/pages/state-vaccine-stats-page.dart';
import 'package:covid_tracker/panels/country-wide-panel.dart';
import 'package:covid_tracker/panels/country-wide-vaccination-panel.dart';
import 'package:covid_tracker/panels/info-panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? countryData = null;
  List? countryVaccinationData = null;
  fetchCountryData()async{
    http.Response response = await http.get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  fetchCountryVaccinationData()async{
    http.Response response = await http.get(Uri.parse('https://india-covid19vaccine.github.io/api/national_latest.json'));
    setState(() {
      countryVaccinationData = jsonDecode(response.body);
    });
  }

  @override
  void initState(){
    fetchCountryData();
    fetchCountryVaccinationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COVID-19 TRACKER",
          style: TextStyle(
            fontSize: 18
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.orange[100],
              height: 120,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                DataSource.quote,
                style: TextStyle(
                  color: Colors.orange[900],
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "India",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StateStatisticsPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Text(
                          "Regional",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            countryData == null
            ? Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/3,
              child: CircularProgressIndicator(),
            )
            : CountryWidePanel(countryData: countryData,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vaccination",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StateVaccineStatsPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Text(
                          "Regional",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            countryVaccinationData == null
            ? Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/3,
              child: CircularProgressIndicator(),
            )
            : CountryWideVaccinationPanel(vaccinationData: countryVaccinationData,),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(5),
              child: InfoPanel(),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "WE ARE TOGETHER IN THE FIGHT",
                style: TextStyle(
                  color: primaryBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}