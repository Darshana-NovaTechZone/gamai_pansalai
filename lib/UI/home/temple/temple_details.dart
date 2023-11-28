import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../color/color.dart';
import '../../../provider/all_provider.dart';
import '../../../widget/decaration.dart';

class TempleDetails extends StatefulWidget {
  const TempleDetails({super.key, required this.img});
  final String img;

  @override
  State<TempleDetails> createState() => _TempleDetailsState();
}

class _TempleDetailsState extends State<TempleDetails> {
  List temple = [
    'assets/1.PNG',
    'assets/2.PNG',
    'assets/3.PNG',
    'assets/4.PNG',
    'assets/6.PNG',
  ];
  List monk = [
    'assets/m.PNG',
    'assets/m1.PNG',
    'assets/m2.PNG',
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, value, child) => Scaffold(
          body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [value.pbackground, value.pbackground2], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(
                  children: [
                    Container(
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0, 0.9],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height / 3,
                        width: w,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: Image.asset(
                              widget.img,
                              fit: BoxFit.cover,
                            ))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dalada Maligawa,',
                                  style: TextStyle(fontSize: 32.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                ),
                                SizedBox(
                                  height: 35,
                                  child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Dammaviaya thero',
                                    style: TextStyle(fontSize: 12.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: value.pwhite1,
                                    ),
                                    Text(
                                      'Sri awarshana pura cotte,',
                                      style: TextStyle(
                                          fontSize: 14.dp,
                                          color: value.pwhite1,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'fontSinhala',
                                          decoration: TextDecoration.underline,
                                          decorationColor: value.pwhite1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    'assets/m4.PNG',
                                    fit: BoxFit.cover,
                                    height: h / 6,
                                    width: w / 3.5,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Details',
                        style: TextStyle(fontSize: 18.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ReadMoreText(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimLines: 4,
                        style: TextStyle(fontSize: 12.dp, color: value.pwhite2, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: lightblue),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(fontSize: 18.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: h / 6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: temple.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  temple[index],
                                  fit: BoxFit.cover,
                                  width: w / 3,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'History',
                        style: TextStyle(fontSize: 18.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ReadMoreText(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimLines: 4,
                        style: TextStyle(fontSize: 12.dp, color: value.pwhite2, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: lightblue),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Monk',
                        style: TextStyle(fontSize: 18.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: h / 6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: monk.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  monk[index],
                                  fit: BoxFit.cover,
                                  width: w / 3,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 18.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/map.PNG',
                            fit: BoxFit.cover,
                            width: w,
                          )),
                      SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 15),
              child: CircleAvatar(
                backgroundColor: value.pwhite1,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: value.pblack,
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
