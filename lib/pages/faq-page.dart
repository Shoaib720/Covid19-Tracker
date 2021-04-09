import 'package:covid_tracker/data-source.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQs",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context, int index){
          return ExpansionTile(
            childrenPadding: EdgeInsets.all(10),
            title: Text(
              DataSource.questionAnswers[index]['question'],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            children: [
              Text(
                DataSource.questionAnswers[index]['answer'],
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          );
        }
      )
    );
  }
}