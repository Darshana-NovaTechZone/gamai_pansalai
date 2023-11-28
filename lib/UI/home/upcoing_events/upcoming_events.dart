import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../color/color.dart';
import '../../../provider/all_provider.dart';
import '../../../widget/decaration.dart';

class UpcomingEvent extends StatefulWidget {
  const UpcomingEvent({super.key, required this.img});
  final String img;

  @override
  State<UpcomingEvent> createState() => _UpcomingEventState();
}

class _UpcomingEventState extends State<UpcomingEvent> {
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
                              'assets/s.PNG',
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
                                  'Sarvodaya Shramadana Movement',
                                  style: TextStyle(fontSize: 32.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                ),
                              ],
                            ),
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
                        trimLines: 7,
                        style: TextStyle(fontSize: 12.dp, color: value.pwhite2, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: lightblue),
                      ),
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
