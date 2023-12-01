import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/provider/all_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../color/color.dart';
import '../../../widget/mainButton.dart';
import '../menu/Custom_drawer.dart';

// import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool tap = false;
  String newImage = '';
  bool selectImg = false;
  int localDataId = 0;
  final ImagePicker _picker = ImagePicker();
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
                                    AppLocalizations.of(context)!.p,
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
                              onPressed: () {
                                imageSelect(context);
                              },
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
                                  AppLocalizations.of(context)!.p1,
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
                                  AppLocalizations.of(context)!.p2,
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
                                  AppLocalizations.of(context)!.p3,
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
                                  AppLocalizations.of(context)!.p4,
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
                              text: AppLocalizations.of(context)!.p5,
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

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var img = File(image!.path);

    final fileName = basename(image.path);
    final File localImage = await img.copy('${appDocPath}/$fileName');
    print(localImage);
    setState(() {
      newImage = image.path;
    });
  }

  Future getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var img = File(image!.path);

    final fileName = basename(image.path);
    final File localImage = await img.copy('${appDocPath}/$fileName');
    print(localImage);
    setState(() {
      newImage = image.path;
    });
  }

  imageSelect(BuildContext con) {
    showModalBottomSheet(
        context: con,
        builder: (context) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          return StatefulBuilder(builder: (context, setState) {
            return ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white.withOpacity(0.6),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close))),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Select image',
                          style: TextStyle(
                            color: black,
                            fontSize: 18.dp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          getImage();
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 12),
                          alignment: Alignment.centerLeft,
                          height: h / 15,
                          width: w,
                          child: Text(
                            'From gallery',
                            style: TextStyle(
                              color: black,
                              fontSize: 18.dp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          getImageFromCamera();
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 12),
                          alignment: Alignment.centerLeft,
                          height: h / 15,
                          child: Text(
                            'From Camera',
                            style: TextStyle(
                              color: black,
                              fontSize: 18.dp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
