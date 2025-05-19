import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remobridge/utility/buttons.dart';
import 'package:remobridge/view/footer.dart';
import 'package:remobridge/view/homepage/how_we_do_it.dart';
import 'package:remobridge/view/homepage/our_strategy_section.dart';
import 'package:remobridge/view/homepage/testimonial_section.dart';
import 'package:remobridge/view/nav_bar.dart';
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
          backgroundColor: const Color(0xfffdbc5a),
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
              color: Colors.redAccent,
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
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.redAccent),
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
                  MediaQuery.of(context).size.width < 600
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 9),
                              child: const Align(
                                heightFactor: 0.5,
                                alignment: Alignment.center,
                                child: HeadlineText(
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
                                Expanded(flex: 1,
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
                                            text: "Empowering Talents for "
                                                "the Global Digital Economy \n",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
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
                                Expanded(flex: 2,
                                  child: Image.asset(
                                    "assets/images/worldGif.gif",
                                    width: 500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
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

                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width < 600 ? 30 : 0),
                      child: Column(
                        children: [
                          const SubHeadlineText(
                              text:
                                  "Become a Skilled Tech Talent without Prior Knowledge.\n"
                                  "Let's help you take that first step - and every one after"),
                          const Text(
                            "Get the skills and experience you need to become a global techtalent and "
                            "be a part of our thriving tech community and talent pool.",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MainButton(
                              title: "Learn More",
                              function: () {
                                launchURLInNewTab(
                                    'https://remobridgeapplication.vercel.app');
                                // Get.toNamed('/learnMore');
                              }),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      )),

                  ///TESTIMONIALS AND CAROUSEL
                  const HeadlineText(text: "Testimonials"),
                  const SizedBox(
                    height: 30,
                  ),
                  const TestimonialSection(),

                  ///sponsors section
                  Container(
                      key: _section2Key,
                      child: const HeadlineText(text: "Sponsors")),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 100,
                    // width: MediaQuery.of(context).size.width,
                    child: SubHeadlineText(
                        text:
                            '"We are currently seeking sponsors to support our mission of empowering remote workers. \nIf you’re interested in partnering with us, please contact us."'),
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
