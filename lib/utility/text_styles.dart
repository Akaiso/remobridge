import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class HeadlineText extends StatelessWidget {
  final String text ;
  final Color? color;
  final int? maxLines;
    const HeadlineText({super.key, required this.text, this.color , this.maxLines});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 20,maxLines: maxLines,
     // maxFontSize: 100,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: color ??  MyColors.teal ,
        fontSize: MediaQuery.of(context).size.width < 600 ? 25 :40,
      ),
    );
  }
}

class SubHeadlineText extends StatelessWidget {
  final String text ;
  final Color? color;
  final int? maxLines;
  const SubHeadlineText({super.key, required this.text, this.color, this.maxLines });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 18,
      maxLines: maxLines,
      style: GoogleFonts.poppins(letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: color ?? MyColors.teal,
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
  final Color? color;
  final TextAlign? align;
  const BodyText({super.key, required this.text, this.color, this.align });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : align,
      text,minFontSize: 8,
      maxFontSize: 15,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: color,

      ),
    );
  }
}

class BodyTextAboutUsTop extends StatelessWidget {
  final String text ;
  final Color? color;
  const BodyTextAboutUsTop({super.key, required this.text, this.color });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.center,
      text,minFontSize: 8,
      maxFontSize: 15,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: color,

      ),
    );
  }
}

class BodyTextMedium extends StatelessWidget {
  final String text ;
  final Color? color;
  const BodyTextMedium({super.key, required this.text , this.color});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(textAlign: MediaQuery.of(context).size.width < 600? TextAlign.center : TextAlign.left,
      text,minFontSize: 18,
      maxFontSize: 18,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
         color: color,

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
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}


class NavText extends StatelessWidget {
  final String text;
  final Color color;
  const NavText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return  AutoSizeText(text, style: TextStyle(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 15,
    ),);
  }
}

