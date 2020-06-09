/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedHorizontalBarChart.withSampleData() {
    return new StackedHorizontalBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
      behaviors: [
        new charts.SeriesLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.bottom,
          // For a legend that is positioned on the left or right of the chart,
          // setting the justification for [endDrawArea] is aligned to the
          // bottom of the chart draw area.
          outsideJustification: charts.OutsideJustification.startDrawArea,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as new rows first instead of a new column.
          horizontalFirst: false,
          // By setting this value to 2, the legend entries will grow up to two
          // rows before adding a new column.
          desiredMaxRows: 1,
          // This defines the padding around each legend entry.
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Render the legend entry text with custom styles.
          entryTextStyle: charts.TextStyleSpec(
              color: charts.Color(r: 90, g: 90, b: 90),
              fontSize: 11),
        )
      ],
      primaryMeasureAxis: new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  return Container();
  }

  /// Create series list with multiple series
  static List<charts.Series<KeyWords, String>> _createSampleData() {
    final PositiveData = [
      new KeyWords('Affordable', 70),
      new KeyWords('Safety factor', 95),
      new KeyWords('Distancing', 75),
      new KeyWords('Creative', 45),
    ];

    final NegativeData = [
      new KeyWords('Affordable', 30),
      new KeyWords('Safety factor', 5),
      new KeyWords('Distancing', 25),
      new KeyWords('Creative', 55),
    ];

    return [
      new charts.Series<KeyWords, String>(
        id: 'Positive  ',
        domainFn: (KeyWords wordOfInterest, _) => wordOfInterest.concern,
        measureFn: (KeyWords wordOfInterest, _) => wordOfInterest.percent,
        data: PositiveData,
        colorFn: (_, __) => charts.Color(r: 0, g: 98, b: 255), //charts.MaterialPalette.green.shadeDefault
        fillColorFn: (_, __) => charts.Color(r: 0, g: 98, b: 255),
      ),
      new charts.Series<KeyWords, String>(
        id: 'Negative',
        domainFn: (KeyWords wordOfInterest, _) => wordOfInterest.concern,
        measureFn: (KeyWords wordOfInterest, _) => wordOfInterest.percent,
        data: NegativeData,
        colorFn: (_, __) => charts.Color(r: 140, g: 140, b: 140),
        fillColorFn: (_, __) => charts.Color(r: 140, g: 140, b: 140),
      ),
    ];
  }
}

/// Sample ordinal data type.
class KeyWords {
  final String concern;
  final double percent;

  KeyWords(this.concern, this.percent);
}