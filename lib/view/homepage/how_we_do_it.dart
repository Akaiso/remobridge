import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/text_styles.dart';

class HowWeDoIt extends StatefulWidget {
  const HowWeDoIt({super.key});

  @override
  State<HowWeDoIt> createState() => _HowWeDoItState();
}

class _HowWeDoItState extends State<HowWeDoIt> {
  List<Widget> howWeDoItBriefs = <Widget>[
    Container(
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Technology Training",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white),
            ),
            const Flexible(
              child: Text(
                "Become a sought-after tech talent. \n"
                "Learn from expert facilitators, work on real projects, \n"
                "receive mentorship, and become a part of a thriving tech community. \n",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text("Learn More",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Talent Placement",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white)),
            const Flexible(
              child: Text(
                "Accelerate your growth and innovation with the \n"
                "right talent. Hire from our pool of software engineers, \n"
                "product managers, product designers, and other tech professionals.\n",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text("Learn More",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Project Implementation",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white)),
            const Flexible(
              child: Text(
                "Get expert advice and support to help you digitally \n"
                "adapt and compete globally. Turn your big idea into a reality. \n",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const InkWell(
              child: Text("Learn More",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Venture Building",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white)),
            const Flexible(
              child: Text(
                "We co-build with and nurture ambitious \n"
                "entrepreneurs who solve local and global problems.\n",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const InkWell(
              child: Text(
                "Learn More",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    )
  ];

  Color ttColor = Colors.black45;
  Color tpColor = Colors.black45;
  Color piColor = Colors.black45;
  Color vbColor = Colors.black45;

  String howWeDoItImage = "";
  String howWeDoItBrief = "";
  Widget brief = Container();
  bool isTtVisible = false;
  bool isTpVisible = false;
  bool isPiVisible = false;
  bool isVbVisible = false;

  void ttColorChange() {
    setState(() {
      ttColor = Colors.redAccent;
      tpColor = Colors.black45;
      piColor = Colors.black45;
      vbColor = Colors.black45;
      howWeDoItImage = "assets/images/tt_image.jpg";
      brief = howWeDoItBriefs[0];
    });
  }

  void tpColorChange() {
    setState(() {
      ttColor = Colors.black45;
      tpColor = Colors.blue;
      piColor = Colors.black45;
      vbColor = Colors.black45;
      howWeDoItImage = "assets/images/tp_image.jpg";
      brief = howWeDoItBriefs[1];
    });
  }

  void piColorChange() {
    setState(() {
      ttColor = Colors.black45;
      tpColor = Colors.black45;
      piColor = Colors.black;
      vbColor = Colors.black45;
      howWeDoItImage = "assets/images/pi_image.png";
      brief = howWeDoItBriefs[2];
    });
  }

  void vbColorChange() {
    setState(() {
      ttColor = Colors.black45;
      tpColor = Colors.black45;
      piColor = Colors.black45;
      vbColor = Colors.redAccent;
      howWeDoItImage = "assets/images/vb_image.png";
      brief = howWeDoItBriefs[3];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    howWeDoItImage = "assets/images/tt_image.jpg";
    brief = howWeDoItBriefs[0];
    ttColor = Colors.red;
    tpColor = Colors.black45;
    piColor = Colors.black45;
    vbColor = Colors.black45;
    isTtVisible = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose

    howWeDoItImage;
    brief;
    ttColor;
    tpColor;
    piColor;
    vbColor;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width < 600
              ? 0
              : MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width < 600
              ? 0
              : MediaQuery.of(context).size.width * 0.07),
      child: Container(
          child: MediaQuery.of(context).size.width < 600
              ?

              ///HOW WE DO IT MOBILE VIEW

              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      children: [
                        SubHeadlineText(text: "How"),
                        SubHeadlineText(
                          text: "We",
                          color: Colors.redAccent,
                        ),
                        SubHeadlineText(text: "Do It")
                      ],
                    ),
                    howWeDoItMobile(
                        onPressed: () {
                          setState(() {
                            isTtVisible = !isTtVisible;
                          });
                        },
                        visible: isTtVisible,
                        brief: howWeDoItBriefs[0],
                        title: "Technology Training",
                        image: "assets/images/tt_image.jpg"),
                    howWeDoItMobile(
                        onPressed: () {
                          setState(() {
                            isTpVisible = !isTpVisible;
                          });
                        },
                        visible: isTpVisible,
                        brief: howWeDoItBriefs[1],
                        title: 'Talent Placement',
                        image: 'assets/images/tp_image.jpg'),
                    howWeDoItMobile(
                        title: "Project Implementation",
                        onPressed: () {
                          setState(() {
                            isPiVisible = !isPiVisible;
                          });
                        },
                        visible: isPiVisible,
                        image: "assets/images/pi_image.png",
                        brief: howWeDoItBriefs[2]),
                    howWeDoItMobile(
                        title: "Venture Building",
                        onPressed: () {
                          setState(() {
                            isVbVisible = !isVbVisible;
                          });
                        },
                        visible: isVbVisible,
                        image: "assets/images/vb_image.png",
                        brief: howWeDoItBriefs[3]),
                    const Divider()
                  ],
                )

              ///HOW WE DO IT WEB VIEW
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///HOW WE DO IT TEXT
                          const SizedBox(
                            width: 200,
                            child: Row(
                              children: [
                                SubHeadlineText(text: "How"),
                                SubHeadlineText(
                                  text: "We",
                                  color: Colors.redAccent,
                                ),
                                SubHeadlineText(text: "Do It")
                              ],
                            ),
                          ),

                          ///LIST OF HOW WE DO IT CATEGORIES
                          const SizedBox(height: 60),
                          howWeDoItText("Technology Training", ttColor, () {
                            ttColorChange();
                          }),
                          const SizedBox(height: 30),
                          howWeDoItText("Talent Placement", tpColor, () {
                            tpColorChange();
                          }),
                          const SizedBox(height: 30),
                          howWeDoItText("Project Implementation", piColor, () {
                            piColorChange();
                          }),
                          const SizedBox(height: 30),
                          howWeDoItText("Venture Building", vbColor, () {
                            vbColorChange();
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              height: 300,
                              child: Image.asset(
                                  "assets/images/red_dot_design.png"))
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Expanded(
                        child: Container(
                      clipBehavior: Clip.hardEdge,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 550,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              howWeDoItImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(child: brief),
                        ],
                      ),
                    ))
                  ],
                )),
    );
  }
}

///HOW WE DO IT TEXT WIDGET
InkWell howWeDoItText(String text, Color color, onTap) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: 20, color: color, fontWeight: FontWeight.w500),
    ),
  );
}

///HOW WE DO IT MOBILE VIEW WIDGET
Widget howWeDoItMobile(
    {required String title,
    required VoidCallback onPressed,
    required bool visible,
    required String image,
    required Widget brief}) {
  return Column(
    children: [
      Divider(),
      Row(
        children: [
          Text(title),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.keyboard_arrow_down,
            ),
          ),
        ],
      ),
      Visibility(
        visible: visible,
        child: SizedBox(
          // width: MediaQuery.of(context).size.width * 0.3,
          height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(child: brief),
            ],
          ),
        ),
      ),
    ],
  );
}
