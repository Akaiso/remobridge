import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:remobridge/utility/buttons.dart';

import '../utility/colors.dart';
import '../utility/text_styles.dart';

class NavBar extends StatefulWidget {
  final VoidCallback action;
  const NavBar({super.key, required this.action});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void launchURLInNewTab(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width < 600
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width / 4,
                child: Image.asset("assets/images/logo3.png")),
            const Spacer(),
            MediaQuery.of(context).size.width < 600
                ? InkWell(
                    onTap: Scaffold.of(context).openEndDrawer,
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  )
                : FittedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: MyColors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: InkWell(
                                onTap: () {
                                  launchURLInNewTab(
                                      'https://remobridgeapplication.vercel.app');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: NavText(
                                      text: "Apply Here", color: Colors.white),
                                ),
                              )

                              // NavbarButtons(
                              //   text: 'Apply Here',
                              //   function: () {
                              //     launchURLInNewTab(
                              //         'https://remobridgeapplication.vercel.app');
                              //   }, pageName: '',
                              // ),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: NavbarButtons(
                            text: 'About Us',
                            pageName: '/aboutUs',
                            function: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: NavbarButtons(
                            text: 'Contact Us',
                            pageName: '/contactUs',
                            function: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: InkWell(
                              onTap: widget.action,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColors.red),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: NavText(
                                    text: "Sponsors", color: MyColors.red,

                                    // color: Colors.red,
                                  ))),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
