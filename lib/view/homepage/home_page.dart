import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remobridge/utility/buttons.dart';
import 'package:remobridge/view/homepage/how_we_do_it.dart';
import 'package:remobridge/view/homepage/nav_bar.dart';
import 'dart:html' as html;
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

  ///FOR THE DRAWER BUT NOT SURE IF IT IS USEFUL COS IT WORKS WITHOUT THIS FUNCTION - Source ChatGPT
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

  void _scrollToTop(){
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void launchURLInNewTab(String url) {
    html.window.open(url, '_blank');
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
        height: 50,width: 50,clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xfffdbc5a),
          onPressed: () {_scrollToTop();},
          tooltip: "scroll to top",
          child: const Icon(Icons.arrow_upward , color: Colors.black,),

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
                      icon: const Icon(Icons.close, color: Colors.white,),
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
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height < 600 ? 50 : 50,
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Expanded(
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
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 8,
                                ),
                                Expanded(
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
                  MediaQuery.of(context).size.width < 600
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
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
                            const SizedBox(
                              height: 40,
                            ),
                            Column(
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
                        ),

                  ///MISSION AND VISION
                  // const SizedBox(
                  //   height: 120,
                  // ),
                  // const HeadlineText(
                  //   text: "Why?",
                  // ),
                  // const SizedBox(
                  //   height: 120,
                  // ),
                  // Container(
                  //   color: Colors.white,
                  //   // height: 350,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       MediaQuery.of(context).size.width < 800
                  //           ? Container()
                  //           : Expanded(
                  //               flex: 2,
                  //               child: Image.asset(
                  //                 "assets/images/abstract.gif",
                  //                 fit: BoxFit.contain,
                  //               )),
                  //       const SizedBox(
                  //         width: 30,
                  //       ),
                  //       const Expanded(
                  //         flex: 4,
                  //         child: Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 30),
                  //           child: BodyTextMedium(
                  //             text:
                  //                 " 'Because we believe Africa’s greatest untapped resource is its people. Nigeria, in particular, has a vibrant, youthful population brimming with potential—but lacking access to global-standard training and the right opportunities. We’re closing that gap by equipping individuals with world-class tech skills and supporting entrepreneurs to build scalable, job-creating ventures."
                  //                 " At the same time, we recognize that for African businesses to thrive in a fast-changing global economy, they must embrace digital transformation. That’s why we provide talent, training, and strategic support to help them evolve and compete."
                  //                 "Our mission is not just to upskill individuals or deliver services—we’re building an ecosystem where talent meets opportunity, innovation drives growth, and the digital economy becomes a catalyst for inclusive prosperity across the continent.' ",
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 30,
                  //       ),
                  //       MediaQuery.of(context).size.width < 600
                  //           ? Container()
                  //           : Expanded(
                  //               flex: 2,
                  //               child: Image.asset("assets/images/lappy.jpg")),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 100,
                  // ),


                  ///HOW WE DO IT
                   SizedBox(height: MediaQuery.of(context).size.width < 600 ? 60 : 200),
                  const HowWeDoIt(),

                  const SizedBox(height: 50,),





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
                        launchURLInNewTab(
                            'https://remobridgeapplication.vercel.app');
                        // Get.toNamed('/learnMore');
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
