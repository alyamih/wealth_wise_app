import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wealth_wise_app/pages/home_page.dart';
import 'package:wealth_wise_app/widgets/bottom_bar.dart';
import 'package:wealth_wise_app/widgets/chart_widget.dart';

enum EFilterDate { today, week, month, year }

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  EFilterDate currentFilter = EFilterDate.today;
  final now = DateTime.now();
  dynamic firstJan;
  dynamic weekNumber;
  @override
  void initState() {
    super.initState();
    firstJan = DateTime(now.year, 1, 1);
    weekNumber = weeksBetween(firstJan, now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 65, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Activities',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    if (currentFilter == EFilterDate.today)
                      Column(children: [
                        ChartWidget(
                          filterDate: currentFilter,
                          pointsIncomes: incomes
                              .where((element) =>
                                  element.date!.day == DateTime.now().day &&
                                  element.date!.year == DateTime.now().year &&
                                  element.date!.month == DateTime.now().month)
                              .toList(),
                          pointsExpenses: expenses
                              .where((element) =>
                                  element.date!.day == DateTime.now().day &&
                                  element.date!.year == DateTime.now().year &&
                                  element.date!.month == DateTime.now().month)
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.today;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter ==
                                                EFilterDate.today
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Day',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.today
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.week;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter == EFilterDate.week
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Week',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.week
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.month;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter ==
                                                EFilterDate.month
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Month',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.month
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.06),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF029BF4)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$${getAllIncomes()}',
                                              style: const TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(
                                              'Incomes',
                                              style: TextStyle(
                                                  color: Color(0xFF828282),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'SF Pro Text'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.06),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.black.withOpacity(0.14)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getAllExpenses() != 0
                                                  ? '\$${getAllExpenses()}'
                                                  : '\$0',
                                              style: const TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(
                                              'Expense',
                                              style: TextStyle(
                                                  color: Color(0xFF828282),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'SF Pro Text'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total amount',
                                  style: TextStyle(
                                      color: Color(0xFF828282),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF Pro Text'),
                                ),
                                Text(
                                  '\$${getAllIncomes() - getAllExpenses()}',
                                  style: const TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    if (currentFilter == EFilterDate.week)
                      Column(children: [
                        ChartWidget(
                          filterDate: currentFilter,
                          pointsIncomes: incomes
                              .where((element) =>
                                  weeksBetween(firstJan, now) ==
                                  weeksBetween(firstJan, element.date!))
                              .toList(),
                          pointsExpenses: expenses
                              .where((element) =>
                                  weeksBetween(firstJan, now) ==
                                  weeksBetween(firstJan, element.date!))
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.today;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter ==
                                                EFilterDate.today
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Day',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.today
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.week;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter == EFilterDate.week
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Week',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.week
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.month;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter ==
                                                EFilterDate.month
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Month',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.month
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.06),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF029BF4)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$${getAllIncomes()}',
                                              style: const TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(
                                              'Incomes',
                                              style: TextStyle(
                                                  color: Color(0xFF828282),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'SF Pro Text'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.06),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.black.withOpacity(0.14)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getAllExpenses() != 0
                                                  ? '\$${getAllExpenses()}'
                                                  : '\$0',
                                              style: const TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(
                                              'Expense',
                                              style: TextStyle(
                                                  color: Color(0xFF828282),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'SF Pro Text'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total amount',
                                  style: TextStyle(
                                      color: Color(0xFF828282),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Text'),
                                ),
                                Text(
                                  '\$${getAllIncomes() - getAllExpenses()}',
                                  style: const TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    if (currentFilter == EFilterDate.month)
                      Column(children: [
                        ChartWidget(
                          filterDate: currentFilter,
                          pointsIncomes: incomes
                              .where((element) =>
                                  element.date!.month == DateTime.now().month &&
                                  element.date!.year == DateTime.now().year)
                              .toList(),
                          pointsExpenses: expenses
                              .where((element) =>
                                  element.date!.month == DateTime.now().month &&
                                  element.date!.year == DateTime.now().year)
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.today;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter ==
                                                EFilterDate.today
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Day',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.today
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.week;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter == EFilterDate.week
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Week',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.week
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    currentFilter = EFilterDate.month;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 9, 25, 9),
                                    decoration: BoxDecoration(
                                        color: currentFilter ==
                                                EFilterDate.month
                                            ? const Color(0xFF029BF4)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Month',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: currentFilter ==
                                                  EFilterDate.month
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.06),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF029BF4)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$${getAllIncomes()}',
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Text(
                                              'Incomes',
                                              style: TextStyle(
                                                  color: Color(0xFF828282),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'SF Pro Text'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.06),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.black.withOpacity(0.14)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getAllExpenses() != 0
                                                  ? '\$${getAllExpenses()}'
                                                  : '\$0',
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Text(
                                              'Expense',
                                              style: TextStyle(
                                                  color: Color(0xFF828282),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'SF Pro Text'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total amount',
                                  style: TextStyle(
                                      color: Color(0xFF828282),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Text'),
                                ),
                                Text(
                                  '\$${getAllIncomes() - getAllExpenses()}',
                                  style: const TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                  ],
                ),
              ),
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }

  int getAllIncomes() {
    int cost = 0;
    if (currentFilter == EFilterDate.today) {
      for (var income in incomes
          .where((element) =>
              element.date!.day == DateTime.now().day &&
              element.date!.month == DateTime.now().month &&
              element.date!.year == DateTime.now().year)
          .toList()) {
        cost = cost + income.cost!.toInt();
      }
    } else if (currentFilter == EFilterDate.week) {
      for (var income in incomes
          .where((element) =>
              weeksBetween(firstJan, now) ==
              weeksBetween(firstJan, element.date!))
          .toList()) {
        cost = cost + income.cost!.toInt();
      }
    } else if (currentFilter == EFilterDate.month) {
      for (var income in incomes
          .where((element) =>
              element.date!.month == DateTime.now().month &&
              element.date!.year == DateTime.now().year)
          .toList()) {
        cost = cost + income.cost!.toInt();
      }
    } else if (currentFilter == EFilterDate.year) {
      for (var income in incomes
          .where((element) => element.date!.year == DateTime.now().year)
          .toList()) {
        cost = cost + income.cost!.toInt();
      }
    } else {
      return 0;
    }
    return cost;
  }

  int getAllExpenses() {
    int cost = 0;
    if (currentFilter == EFilterDate.today) {
      for (var expense in expenses
          .where((element) =>
              element.date!.day == DateTime.now().day &&
              element.date!.month == DateTime.now().month &&
              element.date!.year == DateTime.now().year)
          .toList()) {
        cost = cost + expense.cost!.toInt();
      }
    } else if (currentFilter == EFilterDate.week) {
      for (var expense in expenses
          .where((element) =>
              weeksBetween(firstJan, now) ==
              weeksBetween(firstJan, element.date!))
          .toList()) {
        cost = cost + expense.cost!.toInt();
      }
    } else if (currentFilter == EFilterDate.month) {
      for (var expense in expenses
          .where((element) =>
              element.date!.month == DateTime.now().month &&
              element.date!.year == DateTime.now().year)
          .toList()) {
        cost = cost + expense.cost!.toInt();
      }
    } else if (currentFilter == EFilterDate.year) {
      for (var expense in expenses
          .where((element) => element.date!.year == DateTime.now().year)
          .toList()) {
        cost = cost + expense.cost!.toInt();
      }
    } else {
      return 0;
    }
    return cost;
  }

  int weeksBetween(DateTime from, DateTime to) {
    from = DateTime.utc(from.year, from.month, from.day);
    to = DateTime.utc(to.year, to.month, to.day);
    return (to.difference(from).inDays / 7).ceil();
  }
}
