import 'dart:async';

import 'package:flutter/material.dart';
import 'package:remobridge/utility/colors.dart';

import '../../utility/text_styles.dart';

class FadingTestimonialSection extends StatefulWidget {
  const FadingTestimonialSection({super.key});

  @override
  State<FadingTestimonialSection> createState() => _FadingTestimonialSectionState();
}

class _FadingTestimonialSectionState extends State<FadingTestimonialSection> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<Map<String, String>> testimonials = [
    {
      'name': 'Ada from Nigeria',
      'quote': 'Remobridge changed my career. I landed a remote job in 3 months!',
    },
    {
      'name': 'John from Kenya',
      'quote': 'Their upskilling platform helped me become a full-stack developer.',
    },
    {
      'name': 'Sarah from Ghana',
      'quote': 'I went from knowing nothing about tech to earning in dollars remotely.',
    },
    {
      'name': 'Mike from South Africa',
      'quote': 'Great mentorship and hands-on projects. I recommend Remobridge to anyone.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startRotation();
  }

  void _startRotation() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % testimonials.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildTestimonial(Map<String, String> data) {
    return Container(
      key: ValueKey(data['quote']), // required for AnimatedSwitcher
      width: 600,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 8)],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Icon(Icons.format_quote, size: 40, color: MyColors.red),
          Text(
            '"${data['quote']}"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "- ${data['name']}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildTestimonial(Map<String, String> data){
    return   Container(
      key: ValueKey(data['quote']),
      color: MyColors.red,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 200,width: 5, color: Colors.white,),
            const SizedBox(width: 20,),
             Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.format_quote, size: 40, color: Colors.white),
                  Align(alignment: Alignment.centerLeft, child: SubHeadlineText(text: '"${data['quote']}"', color: Colors.white,)),
                  const SizedBox(height: 10,),
                  NavText(text:  "- ${data['name']}", color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child:  buildTestimonial(testimonials[_currentIndex])    //_buildTestimonial(testimonials[_currentIndex]),
      ),
    );
  }
}
