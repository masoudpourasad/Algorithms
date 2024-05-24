import 'package:algorithms/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BottomPointer extends StatelessWidget {
  final int length;
  final List<int> pointers;

  const BottomPointer(
      {super.key, required this.length, required this.pointers});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: double.infinity,
      child: Stack(
        children: pointers
            .map(
              (item) => Padding(
                padding: EdgeInsets.only(
                    left:
                        item * MediaQuery.of(context).size.width / length + 8),
                child: const Icon(
                  Icons.arrow_upward,
                  color: activeData,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ChartWidget extends StatelessWidget {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  final List<int> numbers;
  final List<int> activeElements;

  const ChartWidget(
      {super.key, required this.numbers, required this.activeElements});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        mainBarData(),
        swapAnimationDuration: animDuration,
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    int y, {
    Color barColor = Colors.white,
    double width = 10,
  }) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        fromY: y.toDouble(),
        borderRadius: BorderRadius.circular(10.0),
        color: barColor,
        width: width,
        backDrawRodData:
            BackgroundBarChartRodData(show: true, toY: 12, color: primaryDark),
        toY: 12,
      ),
    ]);
  }

  List<BarChartGroupData> showingGroups() {
    return numbers.map((f) {
      return makeGroupData(numbers.indexOf(f), f,
          barColor: activeElements.contains(numbers.indexOf(f))
              ? Colors.grey
              : Colors.white);
    }).toList();
  }

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
        border: const Border.symmetric(vertical: BorderSide(color: Colors.red)),
      ),
      barGroups: showingGroups(),
    );
  }
}

class SoringAlgorithmsList extends StatefulWidget {
  final bool isDisabled;
  final Function(String) onTap;

  const SoringAlgorithmsList(
      {super.key, this.isDisabled = false, required this.onTap});
  @override
  State<SoringAlgorithmsList> createState() => _SoringAlgorithmsListState();
}

class _SoringAlgorithmsListState extends State<SoringAlgorithmsList> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: sortingAlgorithmsList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (!widget.isDisabled) {
                setState(() {
                  selected = index;
                });
                widget.onTap(sortingAlgorithmsList[selected].title);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: widget.isDisabled && !(selected == index)
                      ? primary
                      : selected == index
                          ? accent
                          : primaryDark,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Center(
                child: Text(
                  sortingAlgorithmsList[index].title,
                  style: TextStyle(
                    fontSize: 12,
                    color: selected == index ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
