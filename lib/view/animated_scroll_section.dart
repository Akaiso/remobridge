import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utility/buttons.dart';
import '../utility/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ScrollTriggeredAnimationSection extends StatefulWidget {
  const ScrollTriggeredAnimationSection({super.key});

  @override
  State<ScrollTriggeredAnimationSection> createState() =>
      _ScrollTriggeredAnimationSectionState();
}

class _ScrollTriggeredAnimationSectionState
    extends State<ScrollTriggeredAnimationSection>
    with TickerProviderStateMixin {
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

  bool _hasAnimated = false;

  late AnimationController _imageController;
  late Animation<Offset> _imageOffset;
  late Animation<double> _imageOpacity;

  late AnimationController _text1Controller;
  late Animation<double> _text1Opacity;

  late AnimationController _text2Controller;
  late Animation<Offset> _text2Offset;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _imageOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _imageController, curve: Curves.easeOut));
    _imageOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _imageController, curve: Curves.easeOut));

    _text1Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _text1Opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _text1Controller, curve: Curves.easeIn));

    _text2Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _text2Offset = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _text2Controller, curve: Curves.easeOut));
  }

  void _runAnimations() {
    if (!_hasAnimated) {
      setState(() {
        _hasAnimated = true;
      });

      _imageController.forward();
      _text1Controller.forward();
      _text2Controller.forward();
    }
  }

  @override
  void dispose() {
    _imageController.dispose();
    _text1Controller.dispose();
    _text2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('scroll-trigger-animation'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_hasAnimated) {
          _runAnimations();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 100,
            horizontal: MediaQuery.of(context).size.width < 600 ? 30 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🖼️ Image animation
            MediaQuery.of(context).size.width < 600
                ? Container()
                : Expanded(
                    flex: 1,
                    child: SlideTransition(
                      position: _imageOffset,
                      child: FadeTransition(
                        opacity: _imageOpacity,
                        child: Image.asset(
                          "assets/images/megaphone1.jpg",
                          width: 300,
                        ),
                      ),
                    ),
                  ),
             SizedBox(width: MediaQuery.of(context).size.width < 1000 ? 0 : 50),

            // 📝 Texts
            Expanded(
              flex: MediaQuery.of(context).size.width < 600 ? 1 : 4,
              child: Column(
                crossAxisAlignment: MediaQuery.of(context).size.width < 600 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  ///FADE IN TRANSITION OF TEXT
                  FadeTransition(
                    opacity: _text1Opacity,
                    child: const HeadlineText(
                      maxLines: 4,
                        text: "Become a Skilled Tech Talent \n"
                            "without Prior Knowledge.\n"
                            "Let's help you take that \n"
                            "first step - and every one after"),
                  ),
                  const SizedBox(height: 20),
                  SlideTransition(
                    position: _text2Offset,
                    child:  Text(
                      "Get the skills and experience you need to \n"
                      "become a global techtalent and \n"
                      "be a part of our thriving tech community and talent pool.",
                      textAlign: MediaQuery.of(context).size.width < 600 ? TextAlign.center : TextAlign.start,
                    ),
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
