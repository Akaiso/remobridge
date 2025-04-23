import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utility/text_styles.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
              title: const WhiteBodyText(text: 'About Us'),
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
        title: const HeadlineText(text: 'About Us'),centerTitle: true,
        backgroundColor: Colors.transparent, elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: MediaQuery.of(context).size.width < 600
            ? const EdgeInsets.symmetric(horizontal: 30)
            : const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Welcome to RemoBridge  💻🌐',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
            ),
            const SizedBox(height: 16),
            const Text(
              "At Remobridge, we believe Millions of capable individuals in Nigeria"
              " remain unemployed or underpaid due to lack of access"
              " to global opportunities."
              " hence, our vision is to empower Nigerians with"
              " digital skills that open doors to remote jobs paying"
              " in dollars - right from the comfort of their homes.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '🚀 Our Mission',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 8),
            const Text(
              'Empower Nigerians with digital skills that open doors to remote jobs paying in dollars - right from the comfort of their homes.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '🎯 Our Solution',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 8),
            const Text(
              "We are organizing a high-impact webinar where participants will: \n"
              "- Learn valuable digital skills\n"
              "- Get guidance to build a strong online profile\n"
              "- Connect directly to global freelance/job platforms\n"
              "- Start earning in USD\n",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              '📞 Contact Us',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 8),
            const Text(
              //   'Email: support@remobridge.app\nInstagram: @remobridge\nTwitter: @remobridge_io',
              'Email: remobridgesupport@outlook.com\n',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Building bridges to remote opportunities 💜',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue),
              ),
            ),
            MediaQuery.of(context).size.width < 600? const SizedBox(height: 30,): const SizedBox(height: 0,),
          ],
        ),
      ),
    );
  }
}
