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
    return Scaffold(backgroundColor: Colors.white,
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Your Name'),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Your Email'),
                validator: (value) => value != null && value.contains('@')
                    ? null
                    : 'Enter valid email',
              ),
              TextFormField(
                controller: messageController,
                decoration: const InputDecoration(labelText: 'Your Message'),
                maxLines: 5,
                validator: (value) => value != null && value.length > 5
                    ? null
                    : 'Message too short',
              ),
              const SizedBox(height: 50),
              MainButton(
                function: _submitForm,
                title: 'Send Message',
              ),
            ],
          ),
        ),
      ) : Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1,
            child: Padding(
              // padding: MediaQuery.of(context).size.width < 600
              //     ? const EdgeInsets.symmetric(horizontal: 30, vertical: 50)
               //   :

                  padding: const EdgeInsets.only(left: 100, top: 100, right: 0, bottom: 100),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Your Name'),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Your Email'),
                      validator: (value) => value != null && value.contains('@')
                          ? null
                          : 'Enter valid email',
                    ),
                    TextFormField(
                      controller: messageController,
                      decoration: const InputDecoration(labelText: 'Your Message'),
                      maxLines: 5,
                      validator: (value) => value != null && value.length > 5
                          ? null
                          : 'Message too short',
                    ),
                    const SizedBox(height: 50),
                    MainButton(
                      function: _submitForm,
                      title: 'Send Message',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child:Image.asset("assets/images/customer_support.gif", width: 100, height: 500,)


          // Container(
          //     decoration: BoxDecoration(
          //         boxShadow: [
          //
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.7), // Shadow color
          //             spreadRadius: 3, // How much the shadow spreads
          //             blurRadius: 9, // How soft the shadow is
          //             offset: Offset(0, 3), // X and Y offset
          //           ),
          //
          //         ],
          //         borderRadius:
          //         BorderRadius.circular(20)),
          //     clipBehavior: Clip.hardEdge,
          //     child:
          //     )

          )
        ],
      ),
    );
  }
}
