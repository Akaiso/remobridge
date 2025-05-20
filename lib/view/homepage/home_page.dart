import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remobridge/utility/buttons.dart';
import 'package:remobridge/utility/colors.dart';
import 'package:remobridge/view/animated_scroll_section.dart';
import 'package:remobridge/view/footer.dart';
import 'package:remobridge/view/homepage/first_section.dart';
import 'package:remobridge/view/homepage/how_we_do_it.dart';
import 'package:remobridge/view/homepage/our_strategy_section.dart';
import 'package:remobridge/view/homepage/testimonial_section.dart';
import 'package:remobridge/view/nav_bar.dart';
import 'package:remobridge/view/subscribe_to_newsletter.dart';
//import 'dart:html' as html;  //using url_launcher/url_launcher.dart instead
import 'package:url_launcher/url_launcher.dart';

import '../../utility/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        title: NavBar(action: () {
          _scrollToSection(_section2Key);
        }),
        actions: [Container()],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width < 600 ? 0 : 30),
              child: Column(
                children: [
                  Container(
                    height: 50,
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

                  ///FAQs FREQUENTLY ASKED QUESTIONS
                  InkWell(
                      onTap: () {
                        Get.toNamed('/faq');
                      },
                      child: const HeadlineText(text: "FAQs >>>")),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Footer()
          ],
        ),
      ),
    ));
  }
}
