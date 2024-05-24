import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wealth_wise_app/model/expense_item.dart';
import 'package:wealth_wise_app/model/income_item.dart';
import 'package:wealth_wise_app/pages/home_page.dart';

class AddExpenseIncomePage extends StatefulWidget {
  const AddExpenseIncomePage({super.key, required this.isIncome});

  final bool isIncome;
  @override
  State<AddExpenseIncomePage> createState() => _AddExpenseIncomePageState();
}

class _AddExpenseIncomePageState extends State<AddExpenseIncomePage> {
  TextEditingController incomeNameController = TextEditingController();
  TextEditingController incomeAmountController = TextEditingController();
  TextEditingController expenseNameController = TextEditingController();
  TextEditingController expenseAmountController = TextEditingController();
  List<EIncomeType> incomeTypeList = [
    EIncomeType.salary,
    EIncomeType.business,
    EIncomeType.dividends,
    EIncomeType.freelance,
    EIncomeType.investment,
    EIncomeType.passive,
    EIncomeType.rent,
    EIncomeType.royalty
  ];
  List<EExpenseType> expenseTypeList = [
    EExpenseType.food,
    EExpenseType.investment,
    EExpenseType.procurement,
    EExpenseType.transport,
    EExpenseType.rest,
  ];
  EIncomeType selectedIncome = EIncomeType.salary;
  EExpenseType selectedExpense = EExpenseType.food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/button.png')),
                Text(
                  widget.isIncome ? 'Add income' : 'Add expense',
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Title',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextField(
                        cursorColor: Colors.black,
                        controller: widget.isIncome
                            ? incomeNameController
                            : expenseNameController,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Name title',
                          hintStyle: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 16),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.06),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (text) {
                          if (widget.isIncome) {
                            incomeNameController.text = text;
                          } else {
                            expenseNameController.text = text;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Amount (\$)',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        controller: widget.isIncome
                            ? incomeAmountController
                            : expenseAmountController,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        decoration: InputDecoration(
                          hintText: widget.isIncome
                              ? 'Amount Income'
                              : 'Amount Expense',
                          hintStyle: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 16),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.06),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (text) {
                          if (widget.isIncome) {
                            incomeAmountController.text = text;
                          } else {
                            expenseAmountController.text = text;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Category',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    if (!widget.isIncome) getTypesOfExpense(),
                    if (widget.isIncome) getTypesOfIncome()
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: InkWell(
              onTap: () {
                if (widget.isIncome) {
                  if (incomeAmountController.text.isNotEmpty &&
                      incomeNameController.text.isNotEmpty) {
                    IncomeItem income = IncomeItem();
                    income.cost = double.tryParse(incomeAmountController.text);
                    income.type = selectedIncome;
                    income.description = incomeNameController.text;
                    income.date = DateTime.now();
                    incomes.add(income);
                    addIncomesExpensesSP();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomePage()),
                    );
                  }
                } else {
                  if (expenseAmountController.text.isNotEmpty &&
                      expenseNameController.text.isNotEmpty) {
                    ExpenseItem expense = ExpenseItem();
                    expense.cost =
                        double.tryParse(expenseAmountController.text);
                    expense.type = selectedExpense;
                    expense.description = expenseNameController.text;
                    expense.date = DateTime.now();
                    expenses.add(expense);
                    addIncomesExpensesSP();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomePage()),
                    );
                  }
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF029BF4),
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  'Done',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTypesOfExpense() {
    List<Widget> list = [];
    for (var type in expenseTypeList) {
      list.add(InkWell(
        onTap: () {
          selectedExpense = type;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(
              color: selectedExpense == type
                  ? const Color(0xFF029BF4).withOpacity(0.14)
                  : Colors.black.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    type == EExpenseType.transport
                        ? 'assets/train.png'
                        : type == EExpenseType.food
                            ? 'assets/food.png'
                            : type == EExpenseType.investment
                                ? 'assets/hand.png'
                                : type == EExpenseType.procurement
                                    ? 'assets/cart.png'
                                    : 'assets/drink.png',
                    color: selectedExpense == type
                        ? const Color(0xFF029BF4)
                        : null,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    type.text,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: selectedExpense == type
                            ? const Color(0xFF029BF4)
                            : Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              if (selectedExpense == type) Image.asset('assets/check.png'),
              if (selectedExpense != type)
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.06)),
                )
            ],
          ),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getTypesOfIncome() {
    List<Widget> list = [];
    for (var type in incomeTypeList) {
      list.add(InkWell(
        onTap: () {
          selectedIncome = type;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(
              color: selectedIncome == type
                  ? const Color(0xFF029BF4).withOpacity(0.14)
                  : Colors.black.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    type == EIncomeType.salary
                        ? 'assets/salary.png'
                        : type == EIncomeType.business
                            ? 'assets/business.png'
                            : type == EIncomeType.investment
                                ? 'assets/investment.png'
                                : type == EIncomeType.freelance
                                    ? 'assets/freelance.png'
                                    : type == EIncomeType.passive
                                        ? 'assets/passive.png'
                                        : type == EIncomeType.rent
                                            ? 'assets/rent.png'
                                            : type == EIncomeType.dividends
                                                ? 'assets/dividends.png'
                                                : 'assets/royalty.png',
                    color:
                        selectedIncome == type ? const Color(0xFF029BF4) : null,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    type.text,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: selectedIncome == type
                            ? const Color(0xFF029BF4)
                            : Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              if (selectedIncome == type) Image.asset('assets/check.png'),
              if (selectedIncome != type)
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.06)),
                )
            ],
          ),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }
}

Future<void> addIncomesExpensesSP() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('expenses', jsonEncode(expenses));
  prefs.setString('incomes', jsonEncode(incomes));
}

void getIncomesExpensesSP(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();

  final List<dynamic> jsonData1 =
      jsonDecode(prefs.getString('expenses') ?? '[]');
  final List<dynamic> jsonData2 =
      jsonDecode(prefs.getString('incomes') ?? '[]');

  expenses = jsonData1.map<ExpenseItem>((jsonList) {
    {
      return ExpenseItem.fromJson(jsonList);
    }
  }).toList();
  incomes = jsonData2.map<IncomeItem>((jsonList) {
    {
      return IncomeItem.fromJson(jsonList);
    }
  }).toList();

  callBack();
}
