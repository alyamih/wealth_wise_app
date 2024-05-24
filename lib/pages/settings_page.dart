import 'package:flutter/material.dart';
import 'package:wealth_wise_app/widgets/bottom_bar.dart';
import 'package:wealth_wise_app/pages/show_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                  'Settings',
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const ReadTermsOrPrivacyScreenView(
                                            link: 'google.com',
                                          )),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/terms.png'),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'Terms of uses',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.black.withOpacity(0.4),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 8),
                            child: Divider(
                              color: Colors.black.withOpacity(0.08),
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const ReadTermsOrPrivacyScreenView(
                                            link: 'google.com',
                                          )),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/privacy.png'),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'Privacy Policy',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.black.withOpacity(0.4),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 8),
                            child: Divider(
                              color: Colors.black.withOpacity(0.08),
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/support.png'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Support page',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.black.withOpacity(0.4),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 8),
                            child: Divider(
                              color: Colors.black.withOpacity(0.08),
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/share.png'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Share with friends',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.black.withOpacity(0.4),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 8),
                            child: Divider(
                              color: Colors.black.withOpacity(0.08),
                              height: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/sub.png'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'Subscription info',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.black.withOpacity(0.4),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
}
