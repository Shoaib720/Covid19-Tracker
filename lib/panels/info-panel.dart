import 'package:covid_tracker/data-source.dart';
import 'package:covid_tracker/pages/faq-page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
            },
            child:   Container(
              color: primaryBlack,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FAQs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 30,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              launch('https://covid19responsefund.org/en');
            },
            child: Container(
              color: primaryBlack,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Donate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 30,),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
              color: primaryBlack,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Myth Busters",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 30,),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}