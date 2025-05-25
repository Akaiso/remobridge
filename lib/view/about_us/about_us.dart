// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../utility/text_styles.dart';
//
// class AboutUsPage extends StatelessWidget {
//   const AboutUsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MediaQuery.of(context).size.width < 600
//           ? AppBar(
//               leading: IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                   )),
//               title: const WhiteBodyText(text: 'About Us'),
//               backgroundColor: Colors.blue,
//             )
//           : AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             )),
//         title: const HeadlineText(text: 'About Us'),centerTitle: true,
//         backgroundColor: Colors.transparent, elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: MediaQuery.of(context).size.width < 600
//             ? const EdgeInsets.symmetric(horizontal: 30)
//             : const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             Text(
//               'Welcome to RemoBridge  💻🌐',
//               style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "At Remobridge, we believe Millions of capable individuals in Nigeria"
//               " remain unemployed or underpaid due to lack of access"
//               " to global opportunities."
//               " hence, our vision is to empower Nigerians with"
//               " digital skills that open doors to remote jobs paying"
//               " in dollars - right from the comfort of their homes.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               '🚀 Our Mission',
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Empower Nigerians with digital skills that open doors to remote jobs paying in dollars - right from the comfort of their homes.',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               '🎯 Our Solution',
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "We are organizing a high-impact webinar where participants will: \n"
//               "- Learn valuable digital skills\n"
//               "- Get guidance to build a strong online profile\n"
//               "- Connect directly to global freelance/job platforms\n"
//               "- Start earning in USD\n",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               '📞 Contact Us',
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               //   'Email: support@remobridge.app\nInstagram: @remobridge\nTwitter: @remobridge_io',
//               'Email: remobridge@outlook.com\n',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 40),
//             const Center(
//               child: Text(
//                 'Building bridges to remote opportunities 💜',
//                 style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue),
//               ),
//             ),
//             MediaQuery.of(context).size.width < 600? const SizedBox(height: 30,): const SizedBox(height: 0,),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remobridge/utility/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utility/buttons.dart';
import '../../utility/text_styles.dart';
import '../homepage/home_page.dart';
import '../subscribe_to_newsletter.dart';

class AboutUsPage extends StatefulWidget {
  final GlobalKey? sponsorKey;
  const AboutUsPage({super.key, this.sponsorKey});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController toTopScrollController = ScrollController();
  final GlobalKey _section2Key = GlobalKey();

  ///SCROLL TO TOP OF PAGE
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  ///SCROLL TO THE SPONSORS SECTION
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/abtus_bg_img.jpg",
                  ))),
          height: MediaQuery.of(context).size.height / 1.5,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeadlineText(
                text: "Who We Are",
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MediaQuery.of(context).size.width < 700
                    ? const BodyTextAboutUsTop(
                        text:
                            "As problem solvers, technologists, and optimists for a better Africa,"
                            " we help corporate and individuals rightly position themselves and adapt to the digital"
                            " era. Want to seamlessly transition into a thriving digital organization or career?  We are"
                            " your trusted partner",
                        color: Colors.white,
                      )
                    : const BodyTextAboutUsTop(
                        text:
                            "As problem solvers, technologists, and optimists for a better Africa,"
                            " we help \ncorporate and individuals rightly position themselves and adapt to the digital"
                            " era. \nWant to seamlessly transition into a thriving digital organization or career?  We are\n"
                            " your trusted partner",
                        color: Colors.white,
                      ),
              )
            ],
          )),
        ),
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          "assets/images/chiefncrew_illustration.png",
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(
          height: 30,
        ),
        MediaQuery.of(context).size.width < 600
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    purposeMissionAndVision2(
                        image: "assets/images/binoculars_illustration.png",
                        headerText: "Our Purpose",
                        bodyText: "To position people to thrive and lead"),
                    const SizedBox(height: 30,),
                    purposeMissionAndVision2(
                        image: "assets/images/target_area.png",
                        headerText: "Our Mission",
                        bodyText: "Enable Africa's digital transformation by building tech focused talent and businesses"),
                    const SizedBox(height: 30,),
                    purposeMissionAndVision2(
                        image: "assets/images/binoculars_illustration.png",
                        headerText: "Our Vision",
                        bodyText:  "Africa will be home to a talented thriving technology community."),

                  ],
                ),
            )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    purposeMissionAndVision(
                        image: "assets/images/binoculars_illustration.png",
                        headerText: "Our Purpose",
                        bodyText: "To position people to thrive and lead"),
                    purposeMissionAndVision(
                        image: "assets/images/target_area.png",
                        headerText: "Our Mission",
                        bodyText:
                            "Enable Africa's digital transformation by building\n tech focused talent and businesses"),
                    purposeMissionAndVision(
                        image: "assets/images/binoculars_illustration.png",
                        headerText: "Our Vision",
                        bodyText:
                            "Africa will be home to a talented thriving\n technology community."),
                  ],
                ),
              ),

        // const EmpoweringTalents(),
        const SizedBox(
          height: 120,
        ),

        ///sponsors section
        Container(
            key: widget.sponsorKey,
            child: const HeadlineText(text: "Sponsors")),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          // width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SubHeadlineText(
                maxLines: 4,
                text:
                    '"We are currently seeking sponsors to support our mission of empowering remote workers. \n'
                    'If you’re interested in partnering with us, please contact us."'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        MainButton(
            title: "Contact Us",
            function: () {
              Get.toNamed('/contactUs');
            }),

        ///SUBSCRIBE TO OUR NEWSLETTER SECTION
        const SubscribeToNewsletter(),

        const SizedBox(
          height: 150,
        ),

        ///BOTTOM LINKS
        MediaQuery.of(context).size.width < 700
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomLinks(
                    headerText: "For Businesses",
                    text1: "Talent Outsourcing",
                    text2: "Corporate Training",
                    text3: "Project Implementation",
                    text4: "Project Advisory",
                    onTap1: () {},
                    onTap2: () {},
                    onTap3: () {},
                    onTap4: () {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BottomLinks(
                      headerText: "For Individuals",
                      text1: "Techpreneurship Program",
                      text2: "Data Analytics Program",
                      onTap1: () {},
                      onTap2: () {}),
                  BottomLinks(
                      headerText: "About Us",
                      text1: "Careers",
                      text2: "Stories",
                      onTap1: () {},
                      onTap2: () {}),
                  BottomLinks(
                      headerText: "Contact Us",
                      text1: "14 Yalinga Crescent , Wuse2 , Abuja, FCT",
                      text2: "+2348138442423",
                      text3: "remobridge@outlook.com",
                      onTap1: () {},
                      onTap2: () {},
                      onTap3: () {}),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: BottomLinks(
                        headerText: "For Businesses",
                        text1: "Talent Outsourcing",
                        text2: "Corporate Training",
                        text3: "Project Implementation",
                        text4: "Project Advisory",
                        onTap1: () {},
                        onTap2: () {},
                        onTap3: () {},
                        onTap4: () {},
                      ),
                    ),
                    Expanded(
                      child: BottomLinks(
                          headerText: "For Individuals",
                          text1: "Techpreneurship Program",
                          text2: "Data Analytics Program",
                          onTap1: () {},
                          onTap2: () {}),
                    ),
                    Expanded(
                      child: BottomLinks(
                          headerText: "About Us",
                          text1: "Careers",
                          text2: "Stories",
                          onTap1: () {},
                          onTap2: () {}),
                    ),
                    Expanded(
                      child: BottomLinks(
                          headerText: "Contact Us",
                          text1:
                              "14 Yalinga Street, off Adetokunbo Ademola Crescent, Wuse 2 , Abuja 900288, Federal Capital Territory",
                          text2: "+2348138442423",
                          text3: "remobridge@outlook.com",
                          onTap1: () {},
                          onTap2: () {},
                          onTap3: () {}),
                    ),
                  ],
                ),
              ),

        const SizedBox(
          height: 40,
        ),

        ///SOCIAL MEDIA HANDLES
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Socials(),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

Widget purposeMissionAndVision(
    {required String image,
    required String headerText,
    required String bodyText}) {
  return Expanded(
    child: Column(
      children: [
        SizedBox(
          width: 150,
          child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
          ),
        ),
        SubHeadlineText(
          text: headerText,
          color: MyColors.red,
        ),
        BodyText(
          text: bodyText,
          color: MyColors.teal,
          align: TextAlign.center,
        )
      ],
    ),
  );
}

Widget purposeMissionAndVision2(
    {required String image,
    required String headerText,
    required String bodyText}) {
  return Column(
    children: [
      SizedBox(
        width: 150,
        child: Image.asset(
          image,
          fit: BoxFit.scaleDown,
        ),
      ),
      SubHeadlineText(
        text: headerText,
        color: MyColors.red,
      ),
      BodyText(
        text: bodyText,
        color: MyColors.teal,
        align: TextAlign.center,
      )
    ],
  );
}
