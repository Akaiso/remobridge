import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction:
        MediaQuery.of(context).size.width < 600 ? 0.9 : 0.4,
        // aspectRatio: 16/9,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w300), // default style
            children: <TextSpan>[
              const TextSpan(
                  text:
                  '"Before I found this platform, I was stuck in a job with no growth. Within three months of training, I landed my first remote role as a customer support rep for a US company. The support has been incredible—even down to helping me withdraw my pay in naira!"'),
              TextSpan(
                  text: '...Ada 0. - Lagos, Nigeria',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w300), // default style
            children: <TextSpan>[
              const TextSpan(
                  text:
                  '"I didn’t think it was possible to earn in dollars from Nigeria, but here I am! Thanks to the courses and job connections, I now work as a freelance UI/UX designer for a Canadian startup. This platform changed my life."'),
              TextSpan(
                  text: '...Tolu F. -Abuja, Nigeria',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w300), // default style
            children: <TextSpan>[
              const TextSpan(
                  text:
                  ' "The training was practical, easy to follow, and aligned with what companies are actually looking for. I now work remotely as a virtual assistant and earn more than I ever did at my 9-5."'),
              TextSpan(
                  text: '...Chidera M. -Enugu, Nigeria',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w300), // default style
            children: <TextSpan>[
              const TextSpan(
                  text:
                  ' "From learning digital marketing to getting hired by a UK agency, every step of the journey was made easier. Even when I had issues receiving payments, they helped me sort it out smoothly. Highly recommended!"'),
              TextSpan(
                  text: '...Ibrahim A. -Kano, Nigeria',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w300), // default style
            children: <TextSpan>[
              const TextSpan(
                  text:
                  ' "I used to think remote jobs were only for people abroad. This platform proved me wrong. They equipped me with tech skills and connected me with platforms like Upwork and Toptal. Now, I get consistent gigs and steady income."'),
              TextSpan(
                  text: '...Peace E. -Port Harcourt, Nigeria',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ],
          ),
        ),
      ],
      // .map((imagePath) {
      //   return Builder(
      //     builder: (BuildContext context) {
      //       return Container(
      //         width: MediaQuery.of(context).size.width,
      //         margin: const EdgeInsets.symmetric(horizontal: 5.0),
      //         decoration: BoxDecoration(color: Colors.grey[200]),
      //         child: Text("Hi"), // Image.asset("assets/images/red_dot.png", fit: BoxFit.cover),
      //       );
      //     },
      //   );
      // }).toList(),
    );
  }
}
