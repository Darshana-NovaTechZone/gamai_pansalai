import 'package:flutter/material.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/main.dart';
import 'package:gamai_pansalai/provider/all_provider.dart';
import 'package:provider/provider.dart';

import '../../../color/color.dart';
import '../Custom_drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List book = [
    'assets/p.PNG',
    'assets/p2.PNG',
    'assets/p5.PNG',
    'assets/p6.PNG',
    'assets/p7.PNG',
    'assets/p8.PNG',
    'assets/p1.PNG',
  ];
  bool _search = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, value, child) => Scaffold(
        drawer: customDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            iconTheme: IconThemeData(color: value.pwhite),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _search = !_search;
                    });
                  },
                  icon: Icon(
                    _search ? Icons.search_off : Icons.search,
                    color: value.pwhite,
                  )),
            ],
            scrolledUnderElevation: 800,
            surfaceTintColor: Color.fromARGB(255, 2, 12, 20),
            backgroundColor: Colors.transparent,
            title: Text(
              'දැනුම්දීම්',
              style: TextStyle(fontSize: 18.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
            ),
            bottom: _search
                ? PreferredSize(
                    preferredSize: Size(w, 70),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: h / 14,
                        child: TextFormField(
                          style: TextStyle(color: value.pblack, fontSize: 13.sp),
                          validator: (value) {},
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: lightblue,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(fontSize: 13.dp, color: value.pwhite2),
                              hintText: 'Search',
                              fillColor: value.pb2),
                        ),
                      ),
                    ),
                  )
                : null),
        body: Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [value.pbackground, value.pbackground2], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: _search ? MediaQuery.of(context).padding.top + 70 + 70 : MediaQuery.of(context).padding.top + 70,
                ),
                ListView.builder(
                    padding: EdgeInsets.all(8),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: book.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: b2,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              width: w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'පිරිත්',
                                    style: TextStyle(fontSize: 18.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                  ),
                                  Text(
                                    'To invoke blessings upon all beings, an Overnight Pirith Chanting will be held at GBV on September 4th Saturday (Labour Day Weekend) from 7pm to 7am on the 5th morning with the participation of 10+ monks. You are invited to attend this event if you are fully vaccinated. You must wear a mask and maintain social distancing while indoors according to the current CDC guidelines. ',
                                    style: TextStyle(fontSize: 12.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '2023/08/10 08:53 PM',
                                      style: TextStyle(fontSize: 12.dp, color: value.pwhite2, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              ]),
            )),
      ),
    );
  }
}
