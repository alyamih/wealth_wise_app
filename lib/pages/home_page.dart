import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forex_conversion/forex_conversion.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wealth_wise_app/widgets/bottom_bar.dart';
import 'package:wealth_wise_app/model/coin_controller.dart';
import 'package:wealth_wise_app/model/expense_item.dart';
import 'package:wealth_wise_app/model/income_item.dart';
import 'package:wealth_wise_app/pages/add_expense_income_page.dart';

List<ExpenseItem> expenses = [];
List<IncomeItem> incomes = [];
EPageOnSelect page = EPageOnSelect.homePage;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CoinController controller = Get.put(CoinController());
  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    getIncomesExpensesSP(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(
                        8,
                        12,
                        8,
                        12,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your balance',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '\$${getIncomesCost() - getExpensesCost()}',
                                              style: const TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            'Income',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          '\$${getIncomesCost()}',
                                          style: const TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            'Expense',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          '\$${getExpensesCost()}',
                                          style: const TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const AddExpenseIncomePage(
                                                isIncome: true,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffdfdfdf),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Text(
                                      'Add Income',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 16,
                                          color: Color(0xFF029BF4),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const AddExpenseIncomePage(
                                                isIncome: false,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffdfdfdf),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Text(
                                      'Add Expense',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 16,
                                          color: Color(0xFF029BF4),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            selectedPage = 0;
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: selectedPage == 0
                                    ? const Color(0xFF029BF4)
                                    : Colors.black.withOpacity(0.06)),
                            child: Text(
                              'Exchange rates',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontSize: 16,
                                  color: selectedPage == 0
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            selectedPage = 1;
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: selectedPage == 1
                                    ? const Color(0xFF029BF4)
                                    : Colors.black.withOpacity(0.06)),
                            child: Text(
                              'History',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontSize: 16,
                                  color: selectedPage == 1
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (selectedPage == 1 &&
                      (expenses.isEmpty && incomes.isEmpty))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black.withOpacity(0.06)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/alert.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      'Your balance is empty.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'To add income or expenses, tap to the Add Income or Add Expense button.',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              fontSize: 16,
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (selectedPage == 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: getExpenses(),
                    ),
                  if (selectedPage == 1 && incomes.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        height: 1,
                        color: Colors.black.withOpacity(0.06),
                      ),
                    ),
                  if (selectedPage == 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: getIncomes(),
                    ),
                  if (selectedPage == 0)
                    FutureBuilder(
                      future: Forex().getAllCurrenciesPrices(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          double count = 0.0;
                          snapshot.data!.forEach((key, value) {
                            if (key == 'EUR') {
                              count = value;
                            }
                          });
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/euro.png'),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          const Text(
                                            'EUR',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'SF Pro Text',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "Euro",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'SF Pro Text',
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "€$count",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "\$1.00",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  if (selectedPage == 0)
                    Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF029BF4),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(controller
                                                          .coinList[index]
                                                          .symbol
                                                          .toUpperCase() ==
                                                      'BTC'
                                                  ? 'assets/btc.png'
                                                  : controller.coinList[index]
                                                              .symbol
                                                              .toUpperCase() ==
                                                          'ETH'
                                                      ? 'assets/eth.png'
                                                      : 'assets/usdt.png'),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    controller
                                                        .coinList[index].symbol
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'SF Pro Text',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    controller
                                                        .coinList[index].name,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'SF Pro Text',
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                "\$${controller.coinList[index].currentPrice.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'SF Pro Text',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "${controller.coinList[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                    )
                ],
              ),
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }

  Widget getExpenses() {
    List<Widget> list = [];
    for (var expense in expenses) {
      list.add(Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        decoration: BoxDecoration(
            border: Border(
                bottom: expense != expenses.last
                    ? BorderSide(color: Colors.black.withOpacity(0.06))
                    : BorderSide.none)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    expense.type == EExpenseType.transport
                        ? 'assets/train.png'
                        : expense.type == EExpenseType.food
                            ? 'assets/food.png'
                            : expense.type == EExpenseType.investment
                                ? 'assets/hand.png'
                                : expense.type == EExpenseType.procurement
                                    ? 'assets/cart.png'
                                    : 'assets/drink.png',
                    color: const Color(0xFF029BF4),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.type!.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Expense',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              '\$${expense.cost!.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'SF Pro Text',
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getIncomes() {
    List<Widget> list = [];
    for (var income in incomes) {
      list.add(Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        decoration: BoxDecoration(
            border: Border(
                bottom: income != incomes.last
                    ? BorderSide(color: Colors.black.withOpacity(0.06))
                    : BorderSide.none)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    income.type == EIncomeType.salary
                        ? 'assets/salary.png'
                        : income.type == EIncomeType.business
                            ? 'assets/business.png'
                            : income.type == EIncomeType.investment
                                ? 'assets/investment.png'
                                : income.type == EIncomeType.freelance
                                    ? 'assets/freelance.png'
                                    : income.type == EIncomeType.passive
                                        ? 'assets/passive.png'
                                        : income.type == EIncomeType.rent
                                            ? 'assets/rent.png'
                                            : income.type ==
                                                    EIncomeType.dividends
                                                ? 'assets/dividends.png'
                                                : 'assets/royalty.png',
                    color: const Color(0xFF029BF4),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      income.type!.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              '\$${income.cost!.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'SF Pro Text',
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  int getIncomesCost() {
    int cost = 0;
    for (var income in incomes) {
      cost = cost + income.cost!.toInt();
    }
    return cost;
  }

  int getExpensesCost() {
    int cost = 0;
    for (var expense in expenses) {
      cost = cost + expense.cost!.toInt();
    }
    return cost;
  }
}
