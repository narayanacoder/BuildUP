import 'package:flutter/material.dart';

class SolutionSummary extends StatelessWidget {
  final List<String> summaryList;

  SolutionSummary(this.summaryList,);

  factory SolutionSummary.withSampleData() {
    return new SolutionSummary(
      _createSampleData()
    );
  }

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new Container(
      child: Column(
        children: [
          for (String item in summaryList )
            Column(
                children: <Widget>[
                  SizedBox(height: 8,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item,
                      style: TextStyle(
                        height: 1.2,
                      ),
                    ),
                  ),
                ]
            ),
        ],
      ),
    );
  return Container();
  }

  static List<String> _createSampleData() {
    final summary = ['She is also worried that even if her restaurant opens for dining in, will customers come by?',
      'Charlie idea reassures customers that it is safe to dine in this restaurant.',
      'The waiter is also responsible for cleaning the table, chair well before next customer comes in.',
      'Life has to get normal again! This is a great idea for people to get back to work!'];

    return summary;
  }
}