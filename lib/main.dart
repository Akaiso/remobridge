import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:remobridge/view/about_us/about_us.dart';
import 'package:remobridge/view/contact_us/contact_us.dart';
import 'package:remobridge/view/faq_page.dart';
import 'package:remobridge/view/homepage/home_page.dart';
import 'package:remobridge/view/registration.dart';
import 'package:remobridge/view/termspage/terms_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'REMOBRIDGE',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/contactUs', page: () => const ContactUsPage()),
      //  GetPage(name: '/aboutUs', page: () => const AboutUsPage()),
        GetPage(name: '/terms', page: () => const TermsPage()),
        GetPage(name: '/faq', page: () => const FAQPage()),
        GetPage(name: '/learnMore', page: ()=> const LearnMorePage()),
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:
          const HomePage(), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


