import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remobridge/utility/text_styles.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback? function;
  const MainButton({super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: function,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}

class PageBackButtonAndTitle extends StatelessWidget {
  final String title;
  const PageBackButtonAndTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      title:  WhiteBodyText( text: title,),
      backgroundColor: Colors.blue,
    );
  }
}
