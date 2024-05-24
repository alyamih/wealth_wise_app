import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wealth_wise_app/model/expense_item.dart';
import 'package:wealth_wise_app/model/income_item.dart';
import 'package:wealth_wise_app/pages/activities_page.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget(
      {super.key, this.pointsExpenses, this.pointsIncomes, this.filterDate});

  final List<ExpenseItem>? pointsExpenses;
  final List<IncomeItem>? pointsIncomes;
  final EFilterDate? filterDate;

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  double totalCost = 0.0;
  Map<int, List<ExpenseItem>> transactionsMapExpenses = {};
  Map<int, List<IncomeItem>> transactionsMapIncomes = {};
  bool add = false;
  int savedDateTime = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pointsExpenses != null && widget.pointsExpenses!.isNotEmpty) {
      transactionsMapExpenses =
          groupBy(widget.pointsExpenses!, (ExpenseItem e) => e.date!.month);
    }
    if (widget.pointsIncomes != null && widget.pointsIncomes!.isNotEmpty) {
      transactionsMapIncomes =
          groupBy(widget.pointsIncomes!, (IncomeItem e) => e.date!.month);
    }
    totalCost = 0.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.only(left: 8, bottom: 8, top: 40, right: 8),
        child: AspectRatio(
          aspectRatio: 2,
          child: BarChart(
            BarChartData(
              barTouchData: BarTouchData(enabled: false),
              alignment: widget.filterDate == EFilterDate.today
                  ? BarChartAlignment.center
                  : BarChartAlignment.start,
              barGroups: _chartGroups(),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Color(0xFFF9F9F9),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(
                  border: Border.all(color: const Color(0xFFF9F9F9))),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                    sideTitles: widget.filterDate == EFilterDate.today ||
                            widget.filterDate == EFilterDate.week
                        ? _bottomWeekTitles
                        : _bottomTitlesMonths),
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    List<BarChartGroupData> list = [];
    savedDateTime = 0;
    if (transactionsMapExpenses.isNotEmpty) {
      transactionsMapExpenses.forEach((key, value) {
        if (savedDateTime != key) {
          for (var transaction
              in value.where((element) => element.date!.month == key)) {
            totalCost = totalCost + transaction.cost!;
          }
          savedDateTime = key;
          list.add(BarChartGroupData(x: savedDateTime, barRods: [
            BarChartRodData(
                toY: totalCost,
                color: Colors.black.withOpacity(0.14),
                width: 16,
                borderRadius: const BorderRadius.all(Radius.circular(4)))
          ]));

          totalCost = 0.0;
        }
      });
    }
    if (transactionsMapIncomes.isNotEmpty) {
      transactionsMapIncomes.forEach((key, value) {
        for (var transaction
            in value.where((element) => element.date!.month == key)) {
          totalCost = totalCost + transaction.cost!;
        }
        savedDateTime = key;
        list.add(BarChartGroupData(x: savedDateTime, barRods: [
          BarChartRodData(
              toY: totalCost,
              color: const Color(0xFF029BF4),
              width: 16,
              borderRadius: const BorderRadius.all(Radius.circular(4)))
        ]));

        totalCost = 0.0;
      });
    }
    return list;
  }

  SideTitles get _bottomTitlesMonths => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Jan';
              break;
            case 2:
              text = 'Feb';
              break;
            case 3:
              text = 'Mar';
              break;
            case 4:
              text = 'Apr';
              break;
            case 5:
              text = 'May';
              break;
            case 6:
              text = 'Jun';
              break;
            case 7:
              text = 'Jun';
              break;
            case 8:
              text = 'Aug';
              break;
            case 9:
              text = 'Sep';
              break;
            case 10:
              text = 'Oct';
              break;
            case 11:
              text = 'Nov';
              break;
            case 12:
              text = 'Dec';
              break;
          }

          return Text(
            text,
            style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'SF Pro Text'),
          );
        },
      );
  SideTitles get _bottomWeekTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Mon';
              break;
            case 2:
              text = 'Tue';
              break;
            case 3:
              text = 'Wed';
              break;
            case 4:
              text = 'Thr';
              break;
            case 5:
              text = 'Fri';
              break;
            case 6:
              text = 'Sat';
              break;
            case 7:
              text = 'Sun';
              break;
          }

          return Text(
            text,
            style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'SF Pro Text'),
          );
        },
      );
}
