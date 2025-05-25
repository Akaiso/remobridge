import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remobridge/view/subscribe_to_newsletter.dart';

import '../utility/buttons.dart';
import '../utility/text_styles.dart';
import 'animated_scroll_section.dart';
import 'homepage/first_section.dart';
import 'homepage/home_page.dart';
import 'homepage/how_we_do_it.dart';
import 'homepage/our_strategy_section.dart';
import 'homepage/testimonial_section.dart';

class HomeBody extends StatefulWidget {
  final GlobalKey section2Key ; //= GlobalKey();
   const HomeBody({super.key, required this.section2Key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {



  @override
  Widget build(BuildContext context) {
    return

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
              key: widget.section2Key,
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
          ) : Row(
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
      ),
    );
  }
}

