import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wealth_wise_app/pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                if (page.value == 0)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 65, 26, 29),
                    child: Image.asset('assets/onBoarding1.png'),
                  ),
                if (page.value == 1)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 65, 26, 29),
                    child: Image.asset('assets/onBoarding2.png'),
                  ),
                if (page.value == 0)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Your personal financial assistant',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 32,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                if (page.value == 0)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'This mobile application will help you easily and efficiently manage your money.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (page.value == 1)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Everything You Need, Right Here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 32,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                if (page.value == 1)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Track your income and expenses, plan your budget, and stay up-to-date on currency and cryptocurrency exchange rates.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: InkWell(
              onTap: () {
                if (page.value == 0) {
                  page.value = 1;
                  setState(() {});
                } else if (page.value == 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF029BF4),
                    borderRadius: BorderRadius.circular(32)),
                child: Text(
                  page.value == 0 ? 'Next' : 'Get started',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
}
