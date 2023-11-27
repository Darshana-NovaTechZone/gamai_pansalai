import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/provider/all_provider.dart';
import 'package:provider/provider.dart';

import '../../../color/color.dart';
import '../../../widget/mainButton.dart';
import '../Custom_drawer.dart';

// import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool tap = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, value, child) => Scaffold(
          key: _key,
          drawer: customDrawer(),
          body: Stack(
            children: [
              Container(
                height: h,
                width: w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [value.pbackground, value.pbackground2], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                              child: Stack(
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
                                  width: double.infinity,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 0),
                                      child: Image.asset(
                                        'assets/m.jpg',
                                        fit: BoxFit.cover,
                                      )))
                            ],
                          )),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My Profile',
                                    style: TextStyle(fontSize: 32.dp, color: white, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 15),
                            child: CircleAvatar(
                              backgroundColor: value.pwhite1,
                              child: IconButton(
                                  onPressed: () {
                                    _key.currentState!.openDrawer();
                                  },
                                  icon: Icon(
                                    Icons.menu,
                                    color: value.pblack,
                                  )),
                            ),
                          ),
                          Positioned(
                            right: 12,
                            bottom: 12,
                            child: TextButton(
                              onPressed: () {},
                              child: CircleAvatar(
                                radius: 25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.camera_enhance_rounded,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: h / 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                Spacer(),
                                Text(
                                  'Seya',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                SizedBox(
                                  width: w / 5,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Mobile Number',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                Spacer(),
                                Text(
                                  '07116302438',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                SizedBox(
                                  width: w / 5,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Gender',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                Spacer(),
                                Text(
                                  'male',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                SizedBox(
                                  width: w / 5,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Birthday',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                Spacer(),
                                Text(
                                  '2022/02//1',
                                  style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.bold, fontFamily: 'fontEnglish'),
                                ),
                                SizedBox(
                                  width: w / 5,
                                )
                              ],
                            ),
                            Spacer(),
                            MainButton(
                              buttonHeight: h / 13,
                              width: w,
                              onTap: () {},
                              text: 'Update',
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
