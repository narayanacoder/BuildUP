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
    final summary = ['It is cheap and affordable way to achieve social distancing while ensuring safety I could use this in my hair salon!',
      'It can achieve high safety in an affordable way while being creative Love the creativity of this idea, how did you come up with it??',
      'It is cheap and affordable This is a great creative idea so we can go back to restaurants!',
      'However, it does achieve social distancing while ensuring safety in an affordable way The idea is creative and affordable.',
      'It is creative but Will restaurants clean these shower curtains often?'];

    return summary;
  }
}