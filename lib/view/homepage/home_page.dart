import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remobridge/utility/buttons.dart';
import 'package:remobridge/view/homepage/nav_bar.dart';

import '../../utility/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _section2Key = GlobalKey();

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Text(
          "Chat",
          style: TextStyle(color: Colors.white),
        ),
      ),
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
              height: 50,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
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
                child: const NavText(text: "About Us")),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Get.offAndToNamed('/contactUs');
                },
                child: const NavText(text: "Contact Us")),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Get.offAndToNamed('/learnMore');
                },
                child: const NavText(text: "Learn more")),
            const Spacer(),
            Text(
              "remobridge.inc",
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.blue),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,elevation: 0,
        scrolledUnderElevation: 0,
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
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width < 600 ? 0 : 100,
                  ),
                  MediaQuery.of(context).size.width < 600
                      ? Column(
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: HeadlineText(
                                text: "Learn digital skills "
                                    "and start earning \n"
                                    "in dollars from home.",
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: BodyText(
                                text:
                                    "We don't just teach, we guide you to real results.",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MainButton(
                                title: "Learn more",
                                function: () {
                                  Get.toNamed('/learnMore');
                                }),
                          ],
                        )
                      : FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: HeadlineText(
                                      text: "Learn digital skills "
                                          "and start earning \n"
                                          "in dollars from home.",
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: BodyText(
                                      text:
                                          "We don't just teach, we guide you to real results.",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  MainButton(
                                      title: "Learn more",
                                      function: () {
                                        Get.toNamed('/learnMore');
                                      })
                                ],
                              ),
                              Image.asset(
                                "assets/images/rotating_earth.gif",
                                width: 200,
                              )
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 100,
                  ),
                  MediaQuery.of(context).size.width < 600
                      ? FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubHeadlineText(
                                      text: "Here is how we help"),
                                  Container(
                                    height: 250,
                                    width: 500,
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        top: 40,
                                        right: 30,
                                        bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const WhiteLeftJustifiedBodyText(
                                        text: "- Crafting winning proposals\n"
                                            "- Building a professional profile that sells\n"
                                            "- Positioning you on the right platforms\n"
                                            "- Withdrawal without worries\n"
                                            "- Hands-on Guidance & Real Support\n"
                                            "- 24/7 Whatsapp support group"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubHeadlineText(text: "Why Onboard?"),
                                  Container(
                                    height: 250,
                                    width: 500,
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        top: 40,
                                        right: 30,
                                        bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const WhiteLeftJustifiedBodyText(
                                        text:
                                            "- Learn in-demand remote skills\n"
                                            "- Get connected to job platforms\n"
                                            "- Real results from real people\n"
                                            "- Lower barrier to entry\n"
                                            "- Access to all resources needed"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubHeadlineText(
                                      text: "Here is how we help"),
                                  Container(
                                    height: 250,
                                    width: 500,
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        top: 40,
                                        right: 30,
                                        bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const WhiteBodyText(
                                        text: "- Crafting winning proposals\n"
                                            "- Building a professional profile that sells\n"
                                            "- Positioning you on the right platforms\n"
                                            "- Withdrawal without worries\n"
                                            "- Hands-on Guidance & Real Support\n"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubHeadlineText(text: "Key benefits"),
                                  Container(
                                    height: 250,
                                    width: 500,
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        top: 40,
                                        right: 30,
                                        bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const WhiteBodyText(
                                        text:
                                            "- Learn in-demand remote skills\n"
                                            "- Get connected to job platforms\n"
                                            "- Real results from real people\n"
                                            "- Lower barrier to entry\n"
                                            "- Access to all required resources "),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                  ///MISSION AND VISION
                  const SizedBox(
                    height: 200,
                  ),
                  const HeadlineText(
                    text: "Why?",
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    color: Colors.white,
                    height: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediaQuery.of(context).size.width < 800
                            ? Container()
                            : Expanded(
                                flex: 2,
                                child: Image.asset(
                                  "assets/images/abstract.gif",
                                  fit: BoxFit.contain,
                                )),
                        const SizedBox(
                          width: 30,
                        ),
                        const Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: BodyText(
                              text: "Millions of capable individuals in Nigeria"
                                  " remain unemployed or underpaid due to lack of access"
                                  " to global opportunities."
                                  " hence, our vision is to empower Nigerians with"
                                  " digital skills that open doors to remote jobs paying"
                                  " in dollars - right from the comfort of their homes.",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        MediaQuery.of(context).size.width < 600
                            ? Container()
                            : Expanded(
                                flex: 2,
                                child: Image.asset("assets/images/lappy.gif")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const SubHeadlineText(
                      text:
                          "Join a community of growing successful remote workers.\n"
                          "Let's help you take that first step - and every one after"),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      title: "Learn More",
                      function: () {
                        Get.toNamed('/learnMore');
                      }),
                  const SizedBox(
                    height: 100,
                  ),

                  ///TESTIMONIALS AND CAROUSEL
                  const HeadlineText(text: "Testimonials"),
                  const SizedBox(
                    height: 30,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction:
                          MediaQuery.of(context).size.width < 600 ? 0.9 : 0.4,
                      // aspectRatio: 16/9,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    items: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300), // default style
                          children: <TextSpan>[
                            const TextSpan(
                                text:
                                    '"Before I found this platform, I was stuck in a job with no growth. Within three months of training, I landed my first remote role as a customer support rep for a US company. The support has been incredible—even down to helping me withdraw my pay in naira!"'),
                            TextSpan(
                                text: '...Ada 0. - Lagos, Nigeria',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300), // default style
                          children: <TextSpan>[
                            const TextSpan(
                                text:
                                    '"I didn’t think it was possible to earn in dollars from Nigeria, but here I am! Thanks to the courses and job connections, I now work as a freelance UI/UX designer for a Canadian startup. This platform changed my life."'),
                            TextSpan(
                                text: '...Tolu F. -Abuja, Nigeria',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300), // default style
                          children: <TextSpan>[
                            const TextSpan(
                                text:
                                    ' "The training was practical, easy to follow, and aligned with what companies are actually looking for. I now work remotely as a virtual assistant and earn more than I ever did at my 9-5."'),
                            TextSpan(
                                text: '...Chidera M. -Enugu, Nigeria',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300), // default style
                          children: <TextSpan>[
                            const TextSpan(
                                text:
                                    ' "From learning digital marketing to getting hired by a UK agency, every step of the journey was made easier. Even when I had issues receiving payments, they helped me sort it out smoothly. Highly recommended!"'),
                            TextSpan(
                                text: '...Ibrahim A. -Kano, Nigeria',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300), // default style
                          children: <TextSpan>[
                            const TextSpan(
                                text:
                                    ' "I used to think remote jobs were only for people abroad. This platform proved me wrong. They equipped me with tech skills and connected me with platforms like Upwork and Toptal. Now, I get consistent gigs and steady income."'),
                            TextSpan(
                                text: '...Peace E. -Port Harcourt, Nigeria',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                    ],
                    // .map((imagePath) {
                    //   return Builder(
                    //     builder: (BuildContext context) {
                    //       return Container(
                    //         width: MediaQuery.of(context).size.width,
                    //         margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    //         decoration: BoxDecoration(color: Colors.grey[200]),
                    //         child: Text("Hi"), // Image.asset("assets/images/red_dot.png", fit: BoxFit.cover),
                    //       );
                    //     },
                    //   );
                    // }).toList(),
                  ),

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
            FittedBox(
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
            ),
          ],
        ),
      ),
    ));
  }
}
