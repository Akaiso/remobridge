import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utility/text_styles.dart';

class OurStrategySection extends StatelessWidget {
  const OurStrategySection({super.key});

  @override
  Widget build(BuildContext context) {
    return  MediaQuery.of(context).size.width < 600
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubHeadlineText(text: "Our Strategy"),
              Container(
                height: 250,
                width: 500,
                padding: const EdgeInsets.only(
                    left: 30, top: 40, right: 30, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: WhiteLeftJustifiedBodyText(
                      text: "We empower individuals\n"
                          "to excel in the digital economy by\n"
                          "equipping them with world-class tech skills.\n"
                          "At the same time, we support entrepreneurs\n"
                          "in building impactful, job-generating businesses.\n"),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubHeadlineText(text: ""),
              Container(
                height: 250,
                width: 500,
                padding: const EdgeInsets.only(
                    left: 30, top: 40, right: 30, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: WhiteLeftJustifiedBodyText(
                      text: "Driving digital transformation\n"
                          "forward in businesses, our solutions\n"
                          "span talent placement and project\n"
                          "execution -empowering business to \n"
                          "innovate and grow with confidence."),
                ),
              ),
            ],
          ),
        )
      ],
    )
        : Padding(
      padding: const EdgeInsets.only(left: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeadlineText(text: "Our Strategy"),
                Container(
                  height: 300,
                  width: 600,
                  padding: const EdgeInsets.only(
                      left: 30,
                      top: 40,
                      right: 30,
                      bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius:
                      BorderRadius.circular(20)),
                  child: const Center(
                    child: WhiteBodyText(
                      text: "We empower individuals\n"
                          "to excel in the digital economy by\n"
                          "equipping them with world-class tech skills.\n"
                          "At the same time, we support entrepreneurs\n"
                          "in building impactful, job-generating businesses.\n",
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeadlineText(text: ""),
                Container(
                  height: 300,
                  width: 600,
                  padding: const EdgeInsets.only(
                      left: 30,
                      top: 40,
                      right: 30,
                      bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius:
                      BorderRadius.circular(20)),
                  child: const Center(
                    child: WhiteBodyText(
                        text:
                        "Driving digital transformation\n"
                            "forward in businesses, our solutions\n"
                            "span talent placement and project\n"
                            "execution -empowering business to \n"
                            "innovate and grow with confidence."),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
