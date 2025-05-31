// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utility/buttons.dart';
// import '../../utility/text_styles.dart';
//
// class ContactUsPage extends StatefulWidget {
//   const ContactUsPage({super.key});
//
//   @override
//   ContactUsPageState createState() => ContactUsPageState();
// }
//
// class ContactUsPageState extends State<ContactUsPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // You can send the email using EmailJS, a backend, or redirect
//       debugPrint('Name: ${nameController.text}');
//       debugPrint('Email: ${emailController.text}');
//       debugPrint('Message: ${messageController.text}');
//     }
//   }
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
//               title: const WhiteBodyText(text: 'Contact Us'),
//               backgroundColor: Colors.blue,
//             )
//           : AppBar(
//               leading: IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.black,
//                   )),
//               title: const HeadlineText(text: 'Contact Us'),
//               centerTitle: true,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//             ),
//       body: MediaQuery.of(context).size.width < 600 ?
//
//       Padding(
//         padding: MediaQuery.of(context).size.width < 600
//             ? const EdgeInsets.symmetric(horizontal: 30, vertical: 50)
//             : const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
//         child:
//         const Column(
//           crossAxisAlignment: CrossAxisAlignment.start
//           ,
//           children: [
//             Text('We’re here to help, answer your questions, or just have a chat — directly and personally.'),
//             Text("Whether you're reaching out with an inquiry, a request, or simply want to learn more about what we do, we believe in real conversations and fast responses. That’s why we’ve made it easy to connect with us via WhatsApp."),
//             SizedBox(height: 30,),
//             Text( '📱 Chat With Us on WhatsApp', style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue)),
//             SizedBox(height: 10,),
//             Text('For quick responses and personalized support, send us a message anytime.'),
//             SizedBox(height: 10,),
//             Text('WhatsApp: +2348138442423', style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue)),
//             SizedBox(height: 10,),
//             Text('We’re usually available Monday to Friday, 9AM – 6PM, and we do our best to respond promptly outside those hours too.'),
//           ],
//         ),
//
//         // Form(
//         //   key: _formKey,
//         //   child: Column(
//         //     children: [
//         //       TextFormField(
//         //         controller: nameController,
//         //         decoration: const InputDecoration(labelText: 'Your Name'),
//         //       ),
//         //       TextFormField(
//         //         controller: emailController,
//         //         decoration: const InputDecoration(labelText: 'Your Email'),
//         //         validator: (value) => value != null && value.contains('@')
//         //             ? null
//         //             : 'Enter valid email',
//         //       ),
//         //       TextFormField(
//         //         controller: messageController,
//         //         decoration: const InputDecoration(labelText: 'Your Message'),
//         //         maxLines: 5,
//         //         validator: (value) => value != null && value.length > 5
//         //             ? null
//         //             : 'Message too short',
//         //       ),
//         //       const SizedBox(height: 50),
//         //       MainButton(
//         //         function: _submitForm,
//         //         title: 'Send Message',
//         //       ),
//         //     ],
//         //   ),
//         // ),
//       ) : Row(crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Expanded(flex: 1,
//             child: Padding(
//               // padding: MediaQuery.of(context).size.width < 600
//               //     ? const EdgeInsets.symmetric(horizontal: 30, vertical: 50)
//                //   :
//
//                   padding: EdgeInsets.only(left: 100, top: 100, right: 0, bottom: 100),
//               child:
//               SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start
//                   ,
//                   children: [
//                     Text('We’re here to help, answer your questions, or just have a chat — directly and personally.'),
//                     Text("Whether you're reaching out with an inquiry, a request, or simply want to learn more about what we do, we believe in real conversations and fast responses. That’s why we’ve made it easy to connect with us via WhatsApp."),
//                     SizedBox(height: 30,),
//                     Text( '📱 Chat With Us on WhatsApp', style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue)),
//                     SizedBox(height: 10,),
//                     Text('For quick responses and personalized support, send us a message anytime.'),
//                     SizedBox(height: 10,),
//                     SelectableText('WhatsApp: +2348138442423', style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue)),
//                     SizedBox(height: 10,),
//                     Text('📌 14 Yalinga Street, off Adetokunbo Ademola Crescent, Wuse 2, Abuja 900288, Federal Capital Territory.'),
//                     SizedBox(height: 10,),
//                     Text('We’re usually available Monday to Friday, 9AM – 6PM, and we do our best to respond promptly outside those hours too.'),
//                   ],
//                 ),
//               ),
//               // Form(
//               //   key: _formKey,
//               //   child: Column(
//               //     children: [
//               //       TextFormField(
//               //         controller: nameController,
//               //         decoration: const InputDecoration(labelText: 'Your Name'),
//               //       ),
//               //       TextFormField(
//               //         controller: emailController,
//               //         decoration: const InputDecoration(labelText: 'Your Email'),
//               //         validator: (value) => value != null && value.contains('@')
//               //             ? null
//               //             : 'Enter valid email',
//               //       ),
//               //       TextFormField(
//               //         controller: messageController,
//               //         decoration: const InputDecoration(labelText: 'Your Message'),
//               //         maxLines: 5,
//               //         validator: (value) => value != null && value.length > 5
//               //             ? null
//               //             : 'Message too short',
//               //       ),
//               //       const SizedBox(height: 50),
//               //       MainButton(
//               //         function: _submitForm,
//               //         title: 'Send Message',
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ),
//           ),
//           Expanded(flex: 1, child: Image.asset("assets/images/customer_support.png", width: 100, height: 500,))
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:remobridge/utility/colors.dart';
// import 'package:remobridge/utility/text_styles.dart';
// import 'package:remobridge/view/collaborate_with_us/collaborate_with_us.dart';
//
// class ContactUsPage extends StatefulWidget {
//   const ContactUsPage({super.key});
//
//   @override
//   State<ContactUsPage> createState() => _ContactUsState();
// }
//
// class _ContactUsState extends State<ContactUsPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _companyController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();
//
//   String? _selectedPurpose;
//   bool get _isFormValid =>
//       _nameController.text.isNotEmpty &&
//       _emailController.text.isNotEmpty &&
//       _selectedPurpose != null &&
//       _messageController.text.isNotEmpty;
//
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 1000;
//     return Scaffold(backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const BodyText(
//                 alignLess600: TextAlign.center,
//                   alignMore600: TextAlign.center,
//                   text:'We’re here to help, answer your questions, or just have a chat — directly and personally.'),
//               const SizedBox(height: 10,),
//               SizedBox(
//                   width: MediaQuery.of(context).size.width <600 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width / 2,
//                   child: const BodyText(
//                     alignLess600: TextAlign.center,
//                       alignMore600: TextAlign.center,
//                       text:
//                           "Whether you're reaching out with an inquiry, a request, or simply want to learn more about what we do, we believe in real conversations and fast responses. That’s why we’ve made it easy to connect with us via WhatsApp.")),
//               const SizedBox(
//                 height: 30,
//               ),
//               Text('📱 Chat With Us on WhatsApp',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: MyColors.red)),
//               const SizedBox(
//                 height: 10,
//               ),
//               const BodyText(
//                 alignLess600: TextAlign.center,
//                  alignMore600: TextAlign.center,
//                  text: 'For quick responses and personalized support, send us a message anytime.'),
//               const SizedBox(
//                 height: 10,
//               ),
//               SelectableText('WhatsApp: +2348138442423',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: MyColors.red)),
//               const SizedBox(
//                 height: 10,
//               ),
//               const BodyText(
//                  text: '📌 14 Yalinga Street, off Adetokunbo Ademola Crescent, Wuse 2, Abuja 900288, Federal Capital Territory.'),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                   'We’re usually available Monday to Friday, 9AM – 6PM, and we do our best to respond promptly outside those hours too.'),
//               const SizedBox(height: 100),
//               Container(
//                 color: const Color(0xFFFF3333),
//                 padding: const EdgeInsets.all(24),
//                 child: Center(
//                   child: isMobile
//                       ? Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             _buildTextSection(),
//                             const SizedBox(height: 24),
//                             _buildFormSection(),
//                           ],
//                         )
//                       : Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Expanded(child: _buildTextSection()),
//                             const SizedBox(width: 48),
//                             Expanded(child: _buildFormSection()),
//                           ],
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextSection() {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Collaborate With Us',
//           style: TextStyle(
//               fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         SizedBox(height: 12),
//         Text(
//           'Innovation starts with collaboration. Let’s work together to address your needs,\nconnect you with the right talent, and create a tangible impact.',
//           style: TextStyle(fontSize: 16, color: Colors.white),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFormSection() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFF2CC),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Form(
//         key: _formKey,
//         onChanged: () => setState(() {}),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(hintText: 'Full name'),
//                     validator: (value) => value!.isEmpty ? 'Required' : null,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(hintText: 'Email'),
//                     validator: (value) => value!.isEmpty ? 'Required' : null,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: _companyController,
//                     decoration: const InputDecoration(hintText: 'Company name'),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     value: _selectedPurpose,
//                     hint: const Text('Select Purpose'),
//                     onChanged: (value) {
//                       setState(() => _selectedPurpose = value);
//                     },
//                     items: const [
//                       DropdownMenuItem(
//                           value: 'Partnership', child: Text('Partnership')),
//                       DropdownMenuItem(
//                           value: 'Sponsorship', child: Text('Sponsorship')),
//                       DropdownMenuItem(value: 'Other', child: Text('Other')),
//                     ],
//                     validator: (value) => value == null ? 'Required' : null,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             TextFormField(
//               controller: _messageController,
//               decoration: const InputDecoration(hintText: 'Type a message'),
//               maxLines: 4,
//               validator: (value) => value!.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 16),
//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                 onPressed: () {}, // _isFormValid ? _submitForm : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       _isFormValid ? const Color(0xFFFF3333) : Colors.grey,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: const Text('Submit'),
//               ),
//             ),
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
import 'package:remobridge/view/homepage/our_strategy_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utility/buttons.dart';
import '../../utility/text_styles.dart';
import '../collaborate_with_us/collaborate_with_us.dart';
import '../homepage/first_section.dart';
import '../homepage/home_page.dart';
import '../subscribe_to_newsletter.dart';

class ContactUsPage extends StatefulWidget {
  final GlobalKey? sponsorKey;
  const ContactUsPage({super.key, this.sponsorKey});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                    Get.offAllNamed('/');
                  },
                    child: Padding(
                      padding: isMobile?  const EdgeInsets.only(bottom: 30) : const EdgeInsets.only(bottom: 0),
                      child: SizedBox(
                        width: isMobile ? 200 : 250,
                          child: Image.asset("assets/images/logo_new.png", fit: BoxFit.scaleDown,)),
                    )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const EmpoweringTalents(),

            // const EmpoweringTalents(),
            const SizedBox(
              height: 100,
            ),

            ///OUR STRATEGY SECTION
            const OurStrategySection(),
            const SizedBox(height: 150,),

            ///COLLABORATE WITH US SECTION

            const SubHeadlineText(text: "Contact Us"),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                color: MyColors.red, //const Color(0xFFFF3333),
                padding: const EdgeInsets.all(24),
                height: MediaQuery.of(context).size.width < 1000 ? 1000 : MediaQuery.of(context).size.height,
                child: Center(
                  child: isMobile
                      ? Column(
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

            const SizedBox(
              height: 30,
            ),

            const SizedBox(
              height: 150,
            ),

            const SizedBox(
              height: 100,
            ),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  "copyright 2025 ",
                )),
          ],
        ),
      ),
    ));
  }

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width < 1000
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SansText(
        //   text: 'Collaborate With Us',
        //   fontSize: 40,
        //   color: Colors.white,
        //   maxLines: 1,
        //   alignLess600: TextAlign.center,
        // ),
        Image.asset("assets/images/google_map.jpg"),
        const SizedBox(height: 5),
        const BodyText(text: "14 Yalinga street off Adetokunbo Ademola crescent, Wuse 2, Abuja 900288, FCT", color: Colors.white,),
        const SizedBox(height: 5),
        const BodyText(text: "_2348138442423", color: Colors.white,),
        const SizedBox(height: 5),
        const BodyText(text: "remobridge@outlook.com", color: Colors.white,),
        // BodyText(
        //   text:
        //       'Innovation starts with collaboration. Let’s work together to address your needs, connect you with the right talent, and create a tangible impact.',
        //   color: Colors.white,
        //   alignLess600: TextAlign.center,
        // ),
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
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
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
