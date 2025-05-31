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
import 'package:google_fonts/google_fonts.dart';
import 'package:remobridge/utility/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utility/buttons.dart';
import '../../utility/text_styles.dart';
import '../collaborate_with_us/collaborate_with_us.dart';
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

  ///LIST OF COREVALUES
  List<String> coreValues = [
    "We pride ourselves in our African roots and thrive in a strong community where we believe we are because others are.",
    "We are on a journey of unleashing talent and innovation; our true sense of accomplishment comes from seeing lives changed and their impact on our society and the world at large.",
    "We deliver on our promise. You can count on us to follow through on our commitments while upholding consistent and uncompromising adherence to strong ethical principles and values.",
    "We are thinkers and tinkerers. We are focused on market-creating innovation by finding opportunities in the struggle.",
    "We are a learning community that seeks to unlock growth in any area of life, whether we are teaching or being taught.",
    "It’s in the smiles, the tears of joy, the ‘thank you,’ the jobs created, the people and businesses empowered, and ultimately, a thriving African society. This is why we exist - to touch and change lives and transform economies"
  ];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String? _selectedPurpose;
  bool get _isFormValid =>
      _nameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _selectedPurpose != null &&
      _messageController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1000;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
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
                    ? const BodyText(
                        text:
                            "As problem solvers, technologists, and optimists for a better Africa,"
                            " we help corporate and individuals rightly position themselves and adapt to the digital"
                            " era. Want to seamlessly transition into a thriving digital organization or career?  We are"
                            " your trusted partner",
                        color: Colors.white,
                        alignMore600: TextAlign.center,
                        alignLess600: TextAlign.center,
                      )
                    : const BodyText(
                        text:
                            "As problem solvers, technologists, and optimists for a better Africa,"
                            " we help \ncorporate and individuals rightly position themselves and adapt to the digital"
                            " era. \nWant to seamlessly transition into a thriving digital organization or career?  We are\n"
                            " your trusted partner",
                        color: Colors.white,
                        alignMore600: TextAlign.center,
                        alignLess600: TextAlign.center,
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
                    const SizedBox(
                      height: 30,
                    ),
                    purposeMissionAndVision2(
                        image: "assets/images/target_area.png",
                        headerText: "Our Mission",
                        bodyText:
                            "Enable Africa's digital transformation by building tech focused talent and businesses"),
                    const SizedBox(
                      height: 30,
                    ),
                    purposeMissionAndVision2(
                        image: "assets/images/binoculars_illustration.png",
                        headerText: "Our Vision",
                        bodyText:
                            "Africa will be home to a talented thriving technology community."),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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

        ///OUR CORE VALUES

        Container(
          color: MyColors.fadedYellow,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubHeadlineText(
                    text: "Our",
                    color: MyColors.red,
                  ),
                  const SubHeadlineText(text: " Core Values"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              ///ROW 1
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MediaQuery.of(context).size.width < 600
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 300,
                            child: ourCoreValueCard(
                                title: "Ubuntu",
                                bodyText:
                                    "We pride ourselves in our African roots and thrive in a strong community "
                                    "where we believe we are because others are."),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 300,
                            child: ourCoreValueCard(
                                title: "Fulfilment",
                                bodyText:
                                    "We are on a journey of unleashing talent and innovation; our true sense of "
                                    "accomplishment comes from seeing lives changed and their impact on our society and the world at large."),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ourCoreValueCard(
                                title: "Ubuntu",
                                bodyText:
                                    "We pride ourselves in our African roots and thrive in a strong community "
                                    "where we believe we are because others are."),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: ourCoreValueCard(
                                title: "Fulfilment",
                                bodyText:
                                    "We are on a journey of unleashing talent and innovation; our true sense of "
                                    "accomplishment comes from seeing lives changed and their impact on our society and the world at large."),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 50,
              ),

              ///Row 2
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MediaQuery.of(context).size.width < 600
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 300,
                            child: ourCoreValueCard(
                                title: "Integrity",
                                bodyText:
                                    "We deliver on our promise. You can count on us to follow through on our commitments "
                                    "while upholding consistent and uncompromising adherence to strong ethical principles and values."),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 300,
                            child: ourCoreValueCard(
                                title: "Innovation",
                                bodyText:
                                    "We are thinkers and tinkerers. We are focused on market-creating innovation by finding "
                                    "opportunities in the struggle."),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ourCoreValueCard(
                                title: "Integrity",
                                bodyText:
                                    "We deliver on our promise. You can count on us to follow through on our commitments "
                                    "while upholding consistent and uncompromising adherence to strong ethical principles and values."),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: ourCoreValueCard(
                                title: "Innovation",
                                bodyText:
                                    "We are thinkers and tinkerers. We are focused on market-creating innovation by finding "
                                    "opportunities in the struggle."),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 50,
              ),

              ///Row 3
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MediaQuery.of(context).size.width < 600
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 300,
                            child: ourCoreValueCard(
                                title: "Learning",
                                bodyText:
                                    "We are a learning community that seeks to unlock growth in any area of life, "
                                    "whether we are teaching or being taught."),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 300,
                            child: ourCoreValueCard(
                                title: "Impact",
                                bodyText:
                                    "It’s in the smiles, the tears of joy, the ‘thank you,’ the jobs created, "
                                    "the people and businesses empowered, and ultimately, a thriving African society. "
                                    "This is why we exist - to touch and change lives and transform economies"),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ourCoreValueCard(
                                title: "Learning",
                                bodyText:
                                    "We are a learning community that seeks to unlock growth in any area of life, "
                                    "whether we are teaching or being taught."),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: ourCoreValueCard(
                                title: "Impact",
                                bodyText:
                                    "It’s in the smiles, the tears of joy, the ‘thank you,’ the jobs created, "
                                    "the people and businesses empowered, and ultimately, a thriving African society. "
                                    "This is why we exist - to touch and change lives and transform economies"),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),

        ///MEET THE EXECUTIVES
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubHeadlineText(
                text: "Meet",
                color: MyColors.red,
              ),
              SubHeadlineText(
                text: " the Executives",
                color: MyColors.teal,
              )
            ],
          ),
        ),

        ///FOUNDER & CO-FOUNDERS
        MediaQuery.of(context).size.width < 600
            ? Column(
                children: [
                  founderCard(
                      image: "assets/images/portrait.png",
                      name: "Benson Akaiso",
                      position: "Co-founder",
                      icon: const Icon(Icons.facebook)),
                  const SizedBox(
                    height: 20,
                  ),
                  founderCard(
                      image: "assets/images/portrait.png",
                      name: "Famous Olatunji",
                      position: "Co-founder",
                      icon: const Icon(Icons.facebook)),
                  const SizedBox(
                    height: 20,
                  ),
                  founderCard(
                      image: "assets/images/portrait.png",
                      name: "Lekwa Obinna",
                      position: "Co-founder",
                      icon: const Icon(Icons.facebook)),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  founderCard(
                      image: "assets/images/portrait.png",
                      name: "Benson Akaiso",
                      position: "Founder",
                      icon: const Icon(Icons.facebook)),
                  const Flexible(
                      child: SizedBox(
                    width: 30,
                  )),
                  founderCard(
                      image: "assets/images/portrait.png",
                      name: "Famous Olatunji",
                      position: "Co-founder",
                      icon: const Icon(Icons.facebook)),
                  const Flexible(
                      child: SizedBox(
                    width: 30,
                  )),
                  founderCard(
                      image: "assets/images/portrait.png",
                      name: "Lekwa Obinna",
                      position: "Co-founder",
                      icon: const Icon(Icons.facebook)),
                ],
              ),

        ///COLLABORATE WITH US SECTION

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 150),
          child: Container(
            color: MyColors.red, //const Color(0xFFFF3333),
            padding: const EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: isMobile
                  ?

              Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTextSection(),
                        const SizedBox(height: 24),
                        _buildFormSection(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Container(
                          width: 50,
                        )),
                        Expanded(flex: 1, child: _buildTextSection()),
                        const SizedBox(width: 48),
                        Expanded(flex: 2, child: _buildFormSection()),
                      ],
                    ),
            ),
          ),
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

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width < 1000
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SansText(
          text: 'Collaborate With Us',
          fontSize: 40,
          color: Colors.white,
          maxLines: 1,
          alignLess600: TextAlign.center,
        ),
        SizedBox(height: 5),
        BodyText(
          text:
              'Innovation starts with collaboration. Let’s work together to address your needs, connect you with the right talent, and create a tangible impact.',
          color: Colors.white,
          alignLess600: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.fadedYellow, //const Color(0xFFFFF2CC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: _formKey,
        onChanged: () => setState(() {}),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        hintText: 'Full name',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border:
                        OutlineInputBorder(borderSide: BorderSide.none)),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _companyController,
                    decoration: const InputDecoration(
                        hintText: 'Company name',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border:
                        OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(

                    decoration: const InputDecoration(
                        hintText: 'Full name',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border:
                        OutlineInputBorder(borderSide: BorderSide.none)),
                    value: _selectedPurpose,
                    hint: const Text('Select Purpose'),
                    onChanged: (value) {
                      setState(() => _selectedPurpose = value);
                    },
                    items: const [
                      DropdownMenuItem(
                          value: 'Partnership', child: Text('Partnership')),
                      DropdownMenuItem(
                          value: 'Sponsorship', child: Text('Sponsorship')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    validator: (value) => value == null ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border:
                  OutlineInputBorder(borderSide: BorderSide.none)),
              maxLines: 10,
              validator: (value) => value!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {}, // _isFormValid ? _submitForm : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isFormValid ? const Color(0xFFFF3333) : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
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
          alignLess600: TextAlign.center,
          alignMore600: TextAlign.center,
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
        alignLess600: TextAlign.center,
        alignMore600: TextAlign.center,
      )
    ],
  );
}

Widget ourCoreValueCard({required String title, required String bodyText}) {
  return Builder(builder: (context) {
    return SizedBox(
      height: 330,
      width: MediaQuery.of(context).size.width < 600
          ? MediaQuery.of(context).size.width
          : 500,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Icon(Icons.account_balance),
              const SizedBox(
                height: 10,
              ),
              SubHeadlineText(
                text: title,
                maxLines: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              BodyText(
                color: MyColors.teal,
                text: bodyText,
                maxLine: 8,
                alignLess600: TextAlign.start,
                alignMore600: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  });
}

///FOUNDERS CARD
Widget founderCard(
    {required String image,
    required String name,
    required String position,
    required Icon icon}) {
  return Builder(builder: (context) {
    return SizedBox(
      height: 300,
      width: 200,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavText(
                    text: name,
                    color: MyColors.red,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(position),
                  const SizedBox(
                    height: 5,
                  ),
                  IconButton(onPressed: () {}, icon: icon)
                ],
              ),
            )
          ],
        ),
      ),
    );
  });
}
