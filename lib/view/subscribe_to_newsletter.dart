import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/buttons.dart';
import '../utility/colors.dart';
import '../utility/text_styles.dart';

class SubscribeToNewsletter extends StatefulWidget {
  const SubscribeToNewsletter({super.key});

  @override
  State<SubscribeToNewsletter> createState() => _SubscribeToNewsletterState();
}

class _SubscribeToNewsletterState extends State<SubscribeToNewsletter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8,
          vertical: 50),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:   MyColors.fadedYellow,
            border: Border.all(width: 1, color: MyColors.red)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 20),
          child: Column(
            children: [
              HeadlineText(
                maxLines: 1,
                text: "Stay Informed.Stay Ahead",
                color: MyColors.red,
              ),
              const SizedBox(
                height: 10,
              ),
              NavText(
                text:
                "Subscribe to our newsletter to stay connected to our activities, get insights"
                    " and updates on what's happening in our community!",
                color: MyColors.lightBlack,
              ),

              ///TEXTFORM FIELDS
              MediaQuery.of(context).size.width < 1000? Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ///Name TextField
                    Container(clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                            border: InputBorder.none,
                            label: Text('Enter Full Name')),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ///Email TextField
                    Container(clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                            border: InputBorder.none,
                            label: Text('Enter Email Address')),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MainButton(title: "Subscribe", function: (){})
                  ],
                ),
              ) : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///Name TextField
                    Expanded(
                      child: Container(clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                              border: InputBorder.none,
                              label: Text('Enter Full Name')),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ///Email TextField
                    Expanded(
                      child: Container(clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                              border: InputBorder.none,
                              label: Text('Enter Email Address')),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(child: MainButton(title: "Subscribe", function: (){}))
                  ],
                ),
              ),
            ],
          )
          ,
        ),
      ),
    );
  }
}
