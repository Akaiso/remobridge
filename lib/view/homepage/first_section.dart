import 'package:flutter/cupertino.dart';
import '../../utility/buttons.dart';
import '../../utility/text_styles.dart';
//import 'dart:html' as html;  //using url_launcher/url_launcher.dart instead
import 'package:url_launcher/url_launcher.dart';

class EmpoweringTalents extends StatefulWidget {
  const EmpoweringTalents({super.key});

  @override
  State<EmpoweringTalents> createState() => _EmpoweringTalentsState();
}

class _EmpoweringTalentsState extends State<EmpoweringTalents> {
  ///NEW WINDOW URL GENERIC LAUCHER METHOD
  ///USING dart:html as html which is not advisable because it only workd for web apps and not on mobile and desktop applications
  // void launchURLInNewTab(String url) {
  //   html.window.open(url, '_blank');
  // }


  void launchURLInNewTab(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // opens in new tab on web
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
              MediaQuery.of(context).size.width / 9, ),
          child: const Align(
            heightFactor: 0.5,
            alignment: Alignment.center,
            child: HeadlineText(
              maxLines: 3,
                text: "Empowering Talents for "
                    "the Global Digital Economy \n"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
              MediaQuery.of(context).size.width / 9),
          child: const Align(
            alignment: Alignment.center,
            child: BodyText(
                text:
                "We empower individuals to become valuable in the global "
                    "digital economy and thrive as an employee or a business owner."
                    "Businesses also benefit from our pool of talents."),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MainButton(
            title: "Learn more",
            function: () {
              launchURLInNewTab(
                  'https://remobridgeapplication.vercel.app');
              // Get.toNamed('/learnMore');
            }),
      ],
    )
        : SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    //  width: 500,
                    child: Align(
                      heightFactor: 0.5,
                      alignment: Alignment.center,
                      child: HeadlineText(
                        maxLines: 3,
                        text: "Empowering Talents for "
                            "the Global Digital Economy \n",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: BodyText(
                      text:
                      "We empower individuals to become valuable in the global "
                          "digital economy and thrive as an employee or a business owner."
                          "Businesses also benefit from our pool of talents.",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      title: "Learn more",
                      function: () {
                        launchURLInNewTab(
                            'https://remobridgeapplication.vercel.app');
                        // Get.toNamed('/learnMore');
                      })
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 8,
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/worldGif.gif",
                width: 500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
