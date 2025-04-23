import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/text_styles.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: 'What is Remobridge Institue?',
      answer:
          'RemoBridge Institute is a digital training platform designed to equip you with in-demand remote skills and help you connect with real remote job opportunities. We provide training, profile setup support, and access to job platforms that pay in dollars.',
    ),
    FAQItem(
      question: 'Who can register for the training?',
      answer:
          "Anyone looking to acquire digital skills for remote work can register — whether you're a student, graduate, stay-at-home parent, freelancer, or career switcher. No prior experience is required for beginner courses.",
    ),
    FAQItem(
      question: 'How much does it cost to join?',
      answer:
          'We offer highly affordable access. Without sponsors, some webinars are paid via airtime or gift card contributions as low as ₦2,500 (or the Dollar equivalent). We also occasionally offer free sessions and resources.',
    ),
    FAQItem(
      question: 'How do I pay with airtime or gift cards?',
      answer:
          'You’ll be provided with an airtime number or gift card redemption process on our website or app. Once payment is confirmed, you will receive access details by SMS or email.',
    ),
    FAQItem(
        question: 'What kind of skills will I learn?',
        answer:
            "Our trainings cover a range of high-demand remote skills such as:"
            " Graphic design, "
            "Web/mobile app development (Flutter, React, etc.), "
            "Digital marketing, "
            "Video editing, "
            "Virtual assistance, "
            "Content writing, "
            "UI/UX design, "
            "Remote customer service"),
    FAQItem(
      question: 'Do you provide certificates?',
      answer:
          'Yes. On successful completion of each course or webinar, you’ll receive a certificate of completion which can be added to your online portfolio or LinkedIn.',
    ),
    FAQItem(
      question: 'Can Remobridge help me find jobs after training?',
      answer:
          'Yes! We guide you in creating attractive freelance/job profiles, share job platform links, and sometimes connect you directly with remote employers and companies looking to hire trained talent.',
    ),

    FAQItem(
      question: 'What devices can I use to access the app?',
      answer:
      'You can use our mobile app on Android or access the web version from any internet-enabled device including laptops, tablets, and smartphones.',
    ),

    FAQItem(
      question: 'Is my personal data safe?',
      answer:
      'Absolutely. We take your privacy seriously. Your data is stored securely and only used to enhance your experience. Please review our [Privacy Policy] for more information.',
    ),

    FAQItem(
      question: 'I have more questions , how can I contact you?',
      answer:
      "You can reach us through: "
  " WhatsApp: +2348000000000  |  "
  " Email: remobridgesupport@outlook.com  |  "
   "Website: www.remobridge.org ",
    )
  ];

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
              title: const WhiteBodyText(text: 'FAQs'),
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
              title: const HeadlineText(text: 'FAQs'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
      body: Padding(
        padding: MediaQuery.of(context).size.width < 600
            ? const EdgeInsets.all(30)
            : const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: ListView.builder(
          itemCount: _faqs.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return _buildFAQTile(_faqs[index]);
          },
        ),
      ),
    );
  }

  Widget _buildFAQTile(FAQItem item) {
    return StatefulBuilder(
      builder: (context, setTileState) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade100,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Text(
              item.question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: AnimatedRotation(
              turns: item.isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(Icons.keyboard_arrow_down),
            ),
            onExpansionChanged: (expanded) {
              setTileState(() {
                item.isExpanded = expanded;
              });
            },
            children: [
              Text(
                item.answer,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}
