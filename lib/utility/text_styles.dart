import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlineText extends StatelessWidget {
  final String text ;
    const HeadlineText({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 10,
      style: GoogleFonts.poppins(letterSpacing: 2,
        fontWeight: FontWeight.w800,
        fontSize: 35,
      ),
    );
  }
}

class SubHeadlineText extends StatelessWidget {
  final String text ;
  const SubHeadlineText({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 10,
      style: GoogleFonts.poppins(letterSpacing: 0,
        fontWeight: FontWeight.w500,
        fontSize: 25,
      ),
    );
  }
}

class WhiteSubHeadlineText extends StatelessWidget {
  final String text ;
  const WhiteSubHeadlineText({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 10,
      style: GoogleFonts.poppins(letterSpacing: 0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 25,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text ;
  const BodyText({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 10,
      style: GoogleFonts.poppins(letterSpacing: 0,
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
    );
  }
}


class WhiteBodyText extends StatelessWidget {
  final String text ;
  const WhiteBodyText({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 10,
      style: GoogleFonts.poppins(letterSpacing: 0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

class WhiteLeftJustifiedBodyText extends StatelessWidget {
  final String text ;
  const WhiteLeftJustifiedBodyText({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.left : TextAlign.left,
      text,minFontSize: 10,
      style: GoogleFonts.poppins(letterSpacing: 0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}


class NavText extends StatelessWidget {
  final String text;
  const NavText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  AutoSizeText(text, style: const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
    ),);
  }
}

