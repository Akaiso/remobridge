import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/text_styles.dart';

class NavBar extends StatelessWidget {
  final VoidCallback action;
  const NavBar({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 50),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width < 600
                    ? MediaQuery.of(context).size.width / 3
                    : MediaQuery.of(context).size.width / 4,
                child: Image.asset("assets/images/logo.gif")),
            const Spacer(),
            MediaQuery.of(context).size.width < 600
                ? InkWell(
                    onTap: Scaffold.of(context).openEndDrawer,
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  )
                : Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                            onTap: () {
                              Get.toNamed('/aboutUs');
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const NavText(
                                  text: "About Us",
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                            onTap: () {
                              Get.toNamed('/contactUs');
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const NavText(
                                  text: "Contact Us",
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                            onTap: action,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const NavText(
                                  text: "Sponsors",
                                ))),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
