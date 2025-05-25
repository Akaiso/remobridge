import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remobridge/utility/buttons.dart';
import 'package:remobridge/utility/colors.dart';
import 'package:remobridge/view/about_us/about_us.dart';
import 'package:remobridge/view/animated_scroll_section.dart';
import 'package:remobridge/view/homepage/first_section.dart';
import 'package:remobridge/view/homepage/how_we_do_it.dart';
import 'package:remobridge/view/homepage/our_strategy_section.dart';
import 'package:remobridge/view/homepage/testimonial_section.dart';
import 'package:remobridge/view/nav_bar.dart';
import 'package:remobridge/view/subscribe_to_newsletter.dart';
import 'package:remobridge/view/websiteBody.dart';
//import 'dart:html' as html;  //using url_launcher/url_launcher.dart instead
import 'package:url_launcher/url_launcher.dart';

import '../../utility/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  ///VISIBILITY OF ABOUTUS PABE
  bool isHomePageVisible = true;

  ///scroll to sponsors and top of page variables and functions
  final ScrollController _scrollController = ScrollController();
  final ScrollController toTopScrollController = ScrollController();
  final GlobalKey _section2Key = GlobalKey();

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

  ///SCROLL TO TOP OF PAGE
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

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
  void initState() {
    // TODO: implement initState
    isHomePageVisible = true;
   // body = const AboutUsPage();
    super.initState();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 50,
        width: 50,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: FloatingActionButton(
          backgroundColor: MyColors.gold,
          onPressed: () {
            _scrollToTop();
          },
          tooltip: "scroll to top",
          child: const Icon(
            Icons.arrow_upward,
            color: Colors.black,
          ),
        ),
      ),

      ///FOR EXTENDED FLOATING ACTION WITH MORE TEXT note: It doesn't have a child property when the .extended is added
      // FloatingActionButton.extended(
      //   backgroundColor: const Color(0xfffdbc5a),
      //   isExtended: true,
      //   onPressed: () {},
      //   tooltip: "Chatbot launching soon",
      //   label: const Text(
      //     "Chatbot in progress",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0), // Top-left corner rounded
            bottomLeft: Radius.circular(0), // Bottom-left corner rounded
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              color: MyColors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Get.offAndToNamed('/aboutUs');
                },
                child: const NavText(
                  text: "About Us",
                  color: Colors.black,
                )),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Get.offAndToNamed('/contactUs');
                },
                child: const NavText(
                  text: "Contact Us",
                  color: Colors.black,
                )),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  launchURLInNewTab('https://remobridgeapplication.vercel.app');
                  // Get.offAndToNamed('/learnMore');
                },
                child: const NavText(color: Colors.black, text: "Learn more")),
            const Spacer(),
            Text(
              "Remobridge.Africa",
              style: GoogleFonts.poppins(fontSize: 10, color: MyColors.red),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title: NavBar(sponsorFunction: () {
          _scrollToSection(_section2Key);
        }, aboutUsFunction: () {
          setState(() {
            isHomePageVisible = false;
          });
          }, contactUsFunction: () {  },
        homePageVisibility: (){
          Get.offAllNamed("/");
          setState(() {
            isHomePageVisible = true;
          });
          },),
        actions: [Container()],
      ),

      ///BODY OF PAGE
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: MediaQuery.of(context).size.width < 600? const EdgeInsets.all(0) : const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(replacement:   AboutUsPage(sponsorKey: _section2Key,),
                visible: isHomePageVisible,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                      ),
                      const EmpoweringTalents(),
                      const SizedBox(
                        height: 120,
                      ),

                      ///OUR STRATEBY SECTION
                      const OurStrategySection(),

                      ///HOW WE DO IT SECTION
                      SizedBox(
                          height:
                          MediaQuery.of(context).size.width < 600 ? 60 : 200),
                      const HowWeDoIt(),

                      const SizedBox(
                        height: 50,
                      ),

                      ///ANIMATED SCROLL SECTION 1
                      const ScrollTriggeredAnimationSection(),
                      const SizedBox(
                        height: 120,
                      ),

                      ///TESTIMONIALS
                      const Column(
                        children: [
                          SizedBox(height: 80),
                          FadingTestimonialSection(),
                          SizedBox(height: 80),
                        ],
                      ),

                      ///sponsors section
                      Container(
                          key: _section2Key,
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

                      const SizedBox(
                        height: 150,
                      ),

                      ///SUBSCRIBE TO OUR NEWSLETTER SECTION
                      const SubscribeToNewsletter(),

                      const SizedBox(
                        height: 150,
                      ),

                      ///BOTTOM LINKS
                      MediaQuery.of(context).size.width < 700? Column(
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
                          const SizedBox(height: 40,),
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
                              onTap3: (){}),
                        ],
                      ) : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                            Expanded (
                              child: BottomLinks(
                                  headerText: "Contact Us",
                                  text1: "14 Yalinga Street, off Adetokunbo Ademola Crescent, Wuse 2 , Abuja 900288, Federal Capital Territory",
                                  text2: "+2348138442423",
                                  text3: "remobridge@outlook.com",
                                  onTap1: () {},
                                  onTap2: () {},
                                  onTap3: (){}),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40,),

                      ///SOCIAL MEDIA HANDLES
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Socials(),
                      ),

                      ///FAQs FREQUENTLY ASKED QUESTIONS
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.toNamed('/faq');
                                },
                                child: const SubHeadlineText(text: "FAQs >>>")),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              const SizedBox(
                height: 100,
              ),

              const Align(alignment: Alignment.center,  child: Text("copyright 2025 ",)),
              ///OBSOLETE FOOTER
             // const Footer()
            ],
          ),
        ),
      ),
    ));
  }
}

class BottomLinks extends StatefulWidget {
  final String headerText;
  final String text1;
  final String text2;
  final String? text3;
  final String? text4;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback? onTap3;
  final VoidCallback? onTap4;
  const BottomLinks(
      {super.key,
      required this.headerText,
      required this.text1,
      required this.text2,
      this.text3,
      this.text4,
      required this.onTap1,
      required this.onTap2,
      this.onTap3,
      this.onTap4});

  @override
  State<BottomLinks> createState() => _BottomLinksState();
}

class _BottomLinksState extends State<BottomLinks> {
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  Color color3 = Colors.black;
  Color color4 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BodyTextMedium(
          text: widget.headerText,
         // color: MyColors.teal,
        ),
        MouseRegion(
          onHover: (_) {
            setState(() {
              color1 = MyColors.red;
            });
          },
          onExit: (_) {
            setState(() {
              color1 = Colors.black;
            });
          },
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: widget.onTap1,
            child: Text(
              widget.text1,
              style: TextStyle(color: color1),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MouseRegion(
          onEnter: (_) {
            setState(() {
              color2 = MyColors.red;
            });
          },
          onExit: (_) {
            setState(() {
              color2 = Colors.black;
            });
          },
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: widget.onTap2,
            child: Text(
              widget.text2,
              style: TextStyle(color: color2),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MouseRegion(
          onEnter: (_) {
            setState(() {
              color3 = MyColors.red;
            });
          },
          onExit: (_) {
            setState(() {
              color3 = Colors.black;
            });
          },
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: widget.onTap3,
            child: Text(
              widget.text3 ?? "",
              style: TextStyle(color: color3),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MouseRegion(
          onEnter: (_) {
            setState(() {
              color4 = MyColors.red;
            });
          },
          onExit: (_) {
            setState(() {
              color4 = Colors.black;
            });
          },
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: widget.onTap4,
            child: Text(
              widget.text4 ?? "",
              style: TextStyle(color: color4),
            ),
          ),
        ),
      ],
    );
  }
}


class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BodyTextMedium(text: "Follow Us"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){}, icon:   Icon(Icons.facebook, color: MyColors.teal,), ),
            IconButton(onPressed: (){}, icon:   Icon(Icons.tiktok, color: MyColors.teal), ),
            IconButton(onPressed: (){}, icon:   Icon(Icons.linked_camera_outlined, color: MyColors.teal), )
          ],
        )
      ],
    );
  }
}



// Widget aboutUs (BuildContext context){
//   return
//
//     Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width ,
//         decoration: const BoxDecoration(
//           color: Colors.blue,
//             image: DecorationImage(
//               fit: BoxFit.cover,
//                 image:
//                 AssetImage("assets/images/abtus_bg_img.jpg",))),
//         height: MediaQuery.of(context).size.height / 1.5,
//         child: const Center(
//             child: Text(
//               'THIS IS THE ABOUT US PAGE',
//               style: TextStyle(fontSize: 10, color: Colors.white),
//             )),
//       ),
//       const Text(
//         'THIS IS THE ABOUT US PAGE',
//         style: TextStyle(fontSize: 10, color: Colors.black),
//       ),
//       // const EmpoweringTalents(),
//       const SizedBox(
//         height: 120,
//       ),
//
//       ///sponsors section
//       // Container(
//       //     key: sponsorKey,
//       //     child: const HeadlineText(text: "Sponsors")),
//       const SizedBox(
//         height: 30,
//       ),
//       const SizedBox(
//         // width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: SubHeadlineText(
//               maxLines: 4,
//               text:
//               '"We are currently seeking sponsors to support our mission of empowering remote workers. \n'
//                   'If you’re interested in partnering with us, please contact us."'),
//         ),
//       ),
//       const SizedBox(
//         height: 30,
//       ),
//       MainButton(
//           title: "Contact Us",
//           function: () {
//             Get.toNamed('/contactUs');
//           }),
//
//       ///SUBSCRIBE TO OUR NEWSLETTER SECTION
//       const SubscribeToNewsletter(),
//
//       const SizedBox(
//         height: 150,
//       ),
//
//       ///BOTTOM LINKS
//       MediaQuery.of(context).size.width < 700
//           ? Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           BottomLinks(
//             headerText: "For Businesses",
//             text1: "Talent Outsourcing",
//             text2: "Corporate Training",
//             text3: "Project Implementation",
//             text4: "Project Advisory",
//             onTap1: () {},
//             onTap2: () {},
//             onTap3: () {},
//             onTap4: () {},
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           BottomLinks(
//               headerText: "For Individuals",
//               text1: "Techpreneurship Program",
//               text2: "Data Analytics Program",
//               onTap1: () {},
//               onTap2: () {}),
//           BottomLinks(
//               headerText: "About Us",
//               text1: "Careers",
//               text2: "Stories",
//               onTap1: () {},
//               onTap2: () {}),
//           BottomLinks(
//               headerText: "Contact Us",
//               text1:
//               "14 Yalinga Crescent , Wuse2 , Abuja, FCT",
//               text2: "+2348138442423",
//               text3: "remobridge@outlook.com",
//               onTap1: () {},
//               onTap2: () {},
//               onTap3: () {}),
//         ],
//       )
//           : Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Expanded(
//             child: BottomLinks(
//               headerText: "For Businesses",
//               text1: "Talent Outsourcing",
//               text2: "Corporate Training",
//               text3: "Project Implementation",
//               text4: "Project Advisory",
//               onTap1: () {},
//               onTap2: () {},
//               onTap3: () {},
//               onTap4: () {},
//             ),
//           ),
//           Expanded(
//             child: BottomLinks(
//                 headerText: "For Individuals",
//                 text1: "Techpreneurship Program",
//                 text2: "Data Analytics Program",
//                 onTap1: () {},
//                 onTap2: () {}),
//           ),
//           Expanded(
//             child: BottomLinks(
//                 headerText: "About Us",
//                 text1: "Careers",
//                 text2: "Stories",
//                 onTap1: () {},
//                 onTap2: () {}),
//           ),
//           Expanded(
//             child: BottomLinks(
//                 headerText: "Contact Us",
//                 text1:
//                 "14 Yalinga Street, off Adetokunbo Ademola Crescent, Wuse 2 , Abuja 900288, Federal Capital Territory",
//                 text2: "+2348138442423",
//                 text3: "remobridge@outlook.com",
//                 onTap1: () {},
//                 onTap2: () {},
//                 onTap3: () {}),
//           ),
//         ],
//       ),
//
//       const SizedBox(
//         height: 40,
//       ),
//
//       ///SOCIAL MEDIA HANDLES
//       const Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         child: Socials(),
//       ),
//       const SizedBox(
//         height: 100,
//       ),
//
//       const Align(
//           alignment: Alignment.center,
//           child: Text(
//             "copyright 2025 ",
//           ))
//     ],
//   );
// }