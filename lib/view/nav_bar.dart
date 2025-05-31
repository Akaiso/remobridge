import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remobridge/utility/buttons.dart';

import '../utility/colors.dart';
import '../utility/text_styles.dart';

class NavBar extends StatefulWidget {
  final VoidCallback sponsorFunction;
  final VoidCallback aboutUsFunction;
  final VoidCallback contactUsFunction;
  final VoidCallback homePageVisibility;
  const NavBar({super.key, required this.sponsorFunction, required this.aboutUsFunction, required this.contactUsFunction, required this.homePageVisibility});

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
            InkWell(
              onTap: widget.homePageVisibility,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.width / 2
                      : MediaQuery.of(context).size.width / 4,
                  child: Image.asset("assets/images/logo_new.png")),
            ),
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
                                      text: "Individual", color: Colors.white, letterSpacing: 1,),
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
                          child:
                          NavbarButtons(
                            text: 'About Us',
                            pageName: '' , //'/aboutUs',
                            function: widget.aboutUsFunction,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: NavbarButtons(
                            text: 'Contact Us',
                            pageName: '/contactUs',
                            function: () {
                              Get.offAllNamed("/contactUs");
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: InkWell(
                              onTap: widget.sponsorFunction,
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
