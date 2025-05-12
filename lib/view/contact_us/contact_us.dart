import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/buttons.dart';
import '../../utility/text_styles.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  ContactUsPageState createState() => ContactUsPageState();
}

class ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // You can send the email using EmailJS, a backend, or redirect
      debugPrint('Name: ${nameController.text}');
      debugPrint('Email: ${emailController.text}');
      debugPrint('Message: ${messageController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width < 600
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              title: const WhiteBodyText(text: 'Contact Us'),
              backgroundColor: Colors.blue,
            )
          : AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              title: const HeadlineText(text: 'Contact Us'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
      body: MediaQuery.of(context).size.width < 600 ?

      Padding(
        padding: MediaQuery.of(context).size.width < 600
            ? const EdgeInsets.symmetric(horizontal: 30, vertical: 50)
            : const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
        child:
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start
          ,
          children: [
            Text('We’re here to help, answer your questions, or just have a chat — directly and personally.'),
            Text("Whether you're reaching out with an inquiry, a request, or simply want to learn more about what we do, we believe in real conversations and fast responses. That’s why we’ve made it easy to connect with us via WhatsApp."),
            SizedBox(height: 30,),
            Text( '📱 Chat With Us on WhatsApp', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue)),
            SizedBox(height: 10,),
            Text('For quick responses and personalized support, send us a message anytime.'),
            SizedBox(height: 10,),
            Text('WhatsApp: +2348138442423', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue)),
            SizedBox(height: 10,),
            Text('We’re usually available Monday to Friday, 9AM – 6PM, and we do our best to respond promptly outside those hours too.'),
          ],
        ),

        // Form(
        //   key: _formKey,
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         controller: nameController,
        //         decoration: const InputDecoration(labelText: 'Your Name'),
        //       ),
        //       TextFormField(
        //         controller: emailController,
        //         decoration: const InputDecoration(labelText: 'Your Email'),
        //         validator: (value) => value != null && value.contains('@')
        //             ? null
        //             : 'Enter valid email',
        //       ),
        //       TextFormField(
        //         controller: messageController,
        //         decoration: const InputDecoration(labelText: 'Your Message'),
        //         maxLines: 5,
        //         validator: (value) => value != null && value.length > 5
        //             ? null
        //             : 'Message too short',
        //       ),
        //       const SizedBox(height: 50),
        //       MainButton(
        //         function: _submitForm,
        //         title: 'Send Message',
        //       ),
        //     ],
        //   ),
        // ),
      ) : Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 1,
            child: Padding(
              // padding: MediaQuery.of(context).size.width < 600
              //     ? const EdgeInsets.symmetric(horizontal: 30, vertical: 50)
               //   :

                  padding: EdgeInsets.only(left: 100, top: 100, right: 0, bottom: 100),
              child:
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start
                  ,
                  children: [
                    Text('We’re here to help, answer your questions, or just have a chat — directly and personally.'),
                    Text("Whether you're reaching out with an inquiry, a request, or simply want to learn more about what we do, we believe in real conversations and fast responses. That’s why we’ve made it easy to connect with us via WhatsApp."),
                    SizedBox(height: 30,),
                    Text( '📱 Chat With Us on WhatsApp', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                    SizedBox(height: 10,),
                    Text('For quick responses and personalized support, send us a message anytime.'),
                    SizedBox(height: 10,),
                    SelectableText('WhatsApp: +2348138442423', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                    SizedBox(height: 10,),
                    Text('📌 14 Yalinga Street, off Adetokunbo Ademola Crescent, Wuse 2, Abuja 900288, Federal Capital Territory.'),
                    SizedBox(height: 10,),
                    Text('We’re usually available Monday to Friday, 9AM – 6PM, and we do our best to respond promptly outside those hours too.'),
                  ],
                ),
              ),
              // Form(
              //   key: _formKey,
              //   child: Column(
              //     children: [
              //       TextFormField(
              //         controller: nameController,
              //         decoration: const InputDecoration(labelText: 'Your Name'),
              //       ),
              //       TextFormField(
              //         controller: emailController,
              //         decoration: const InputDecoration(labelText: 'Your Email'),
              //         validator: (value) => value != null && value.contains('@')
              //             ? null
              //             : 'Enter valid email',
              //       ),
              //       TextFormField(
              //         controller: messageController,
              //         decoration: const InputDecoration(labelText: 'Your Message'),
              //         maxLines: 5,
              //         validator: (value) => value != null && value.length > 5
              //             ? null
              //             : 'Message too short',
              //       ),
              //       const SizedBox(height: 50),
              //       MainButton(
              //         function: _submitForm,
              //         title: 'Send Message',
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ),
          Expanded(flex: 1, child: Image.asset("assets/images/customer_support.png", width: 100, height: 500,))
        ],
      ),
    );
  }
}
