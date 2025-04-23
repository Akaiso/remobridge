import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/text_styles.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
              title: const WhiteBodyText(text: 'Terms & Conditions'),
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
       // title: const HeadlineText(text: 'Terms & Conditions'),centerTitle: true,
        backgroundColor: Colors.transparent, elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: MediaQuery.of(context).size.width < 600
            ? const EdgeInsets.symmetric(horizontal: 30.0)
            : const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            MediaQuery.of(context).size.width < 600? const Text(
              ' ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ) : const Text(
              ' Terms & Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Last updated: April 20, 2025',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const Text(
              'Company Name: Remobridge Institute',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const Text(
              'remogridge@outlook.com',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),
            const Text(
              '1. Acceptance of Terms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'By downloading, installing, or using the RemoBridge Institute app, you agree to be bound by these Terms and Conditions. If you do not agree, please do not use the app.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '2. Eligibility / Use of service',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'You must be at least 16 years old to access or use the app. By using the app, you represent and warrant that you meet this requirement.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '3. Account registration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'To access certain features, you may be required to create an account and provide accurate, complete, and updated information. You are responsible for maintaining the confidentiality of your account credentials.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '4. Services offered',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "RemoBridge Institute offers: "
                "Online digital skills training (e.g. Flutter, design, marketing, etc. )"
          "Career mentoring for remote jobs, "
      "Profile setup assistance, "
      "Resources to connect with global employers, "
      "Community support and workshops, ",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '5. User obligations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "You agree: "
               " Not to use the app for illegal activities , "
            "Not to redistribute course content, "
            "Not to impersonate another individual, "
            "To respect instructors, moderators, and fellow learners " ,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '6. Payment and airtime transfers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
             " If you access paid content via airtime transfers or other methods, you agree to: "

            "Follow instructions provided within the app or official communication channels "

            "Understand that airtime transfers are non-refundable "

              "Not dispute or reverse transactions once confirmed ",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '7. Intellectual property',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "All content, graphics, code, videos, and trademarks in the app are the property of RemoBridge Institute or its content partners. You may not copy, distribute, or use any part of the app without permission.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '8. Third-party services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "The app may integrate with services such as WhatsApp, Google Forms, Selar, or payment processors. We are not responsible for the availability or accuracy of those services.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '9. Termination',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "We reserve the right to suspend or terminate your access at any time, especially for violation of these terms, without prior notice or liability.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '10. Limitation of liability',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "RemoBridge Institute is not liable for:"

                "Loss of job opportunities"

            "Inaccuracies in third-party job platforms"

                "Technical issues beyond our control"

                "All services are provided 'as-is' without warranties of any kind.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '11. Privacy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Your data is handled in line with our Privacy Policy (linked within the app). We never sell user data. For security, we may collect usage data to improve your experience.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '12. Governing Law',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "These terms are governed by the laws of the Federal Republic of Nigeria, and any disputes shall be subject to the jurisdiction of Nigerian courts.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '13. Modification',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "We may update these Terms from time to time. Updates will be posted in-app or via email. Continued use of the app implies acceptance of the new terms.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Thanks for being part of the Remobridge community!',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
