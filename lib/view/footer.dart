import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utility/text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.width < 1000 ? 300 : 200,
        child: MediaQuery.of(context).size.width < 1000
            ? Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            // Container(height: 200, child: Image.asset("assets/images/dark_abstract.gif")),const SizedBox(width: 50,),
            InkWell(
              onTap: () {
                Get.toNamed('/contactUs');
              },
              child: const WhiteBodyText(
                text: "Contact Us  ",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/aboutUs');
              },
              child: const WhiteBodyText(
                text: "About Us  ",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/terms');
              },
              child: const WhiteBodyText(
                text: "Terms  ",
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
            )
          ],
        )
            : Row(
          children: [
            SizedBox(
                height: 200,
                child: Image.asset(
                    "assets/images/dark_abstract.gif")),
            const SizedBox(
              width: 50,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/contactUs');
              },
              child: const WhiteSubHeadlineText(
                text: "Contact Us      |  ",
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/aboutUs');
              },
              child: const WhiteSubHeadlineText(
                text: "  About Us      |  ",
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/terms');
              },
              child: const WhiteSubHeadlineText(
                text: "  Terms  ",
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
