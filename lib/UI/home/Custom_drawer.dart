import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/provider/all_provider.dart';
import 'package:provider/provider.dart';

import '../../color/color.dart';
import '../../db/sqldb.dart';

class customDrawer extends StatefulWidget {
  const customDrawer({super.key});

  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  bool tap = false;
  bool lite = false;
  SqlDb sqlDb = SqlDb();
  List modeData = [];
  @override
  void initState() {
    data();
    // TODO: implement initState
    super.initState();
  }

  data() async {
    modeData = await SqlDb().readData('select * from mode');
    setState(() {
      modeData;
      print(modeData);
    });
    if (modeData.isEmpty) {
      await SqlDb().insertData('insert into mode ("status") values(0)');
      setState(() {
        lite = false;
      });
    } else {
      if (modeData[0]['status'] == 0) {
        setState(() {
          lite = false;
        });
      } else {
        setState(() {
          lite = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: Drawer(
        backgroundColor: black,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Consumer<ProviderS>(
          builder: (context, value, child) => SizedBox(
            height: h,
            width: w / 1,
            child: Stack(
              children: [
                SizedBox(
                    height: h,
                    width: w,
                    child: Image.asset(
                      'assets/m.jpg',
                      color: value.pblack.withOpacity(0.8),
                      colorBlendMode: value.pblack == black ? BlendMode.darken : BlendMode.colorDodge,
                      fit: BoxFit.cover,
                    )),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 12),
                    child: Column(
                      // Important: Remove any padding from the ListView.

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: value.pwhite1,
                                )),
                          ),
                        ),
                        // Image.asset(
                        //   'assets/l.png',
                        //   height: h / 7,
                        // ),
                        SizedBox(
                          height: h / 15,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Card(
                            color: white.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.home_outlined, color: value.pwhite),
                                  SizedBox(
                                    width: w / 15,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(fontSize: 12.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Card(
                            color: white.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.ac_unit_sharp,
                                        color: value.pwhite,
                                      ),
                                      SizedBox(
                                        width: w / 15,
                                      ),
                                      Text(
                                        'Theme',
                                        style: TextStyle(fontSize: 12.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            lite ? 'Lite' : 'Dark',
                                            style:
                                                TextStyle(fontSize: 12.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
                                          ),
                                          Switch(
                                            value: lite,
                                            onChanged: (value) async {
                                              setState(() {
                                                lite = value;
                                              });

                                              // Provider.of<ProviderS>(context, listen: false).selectedPageIndex = 2;

                                              print(lite);
                                              if (lite) {
                                                Provider.of<ProviderS>(context, listen: false).pwhite = black;
                                                Provider.of<ProviderS>(context, listen: false).pwhite1 = black1;
                                                Provider.of<ProviderS>(context, listen: false).pwhite2 = black2;
                                                Provider.of<ProviderS>(context, listen: false).pwhite3 = black3;
                                                Provider.of<ProviderS>(context, listen: false).pblack = white;
                                                Provider.of<ProviderS>(context, listen: false).pnave = white;
                                                Provider.of<ProviderS>(context, listen: false).pbackground = white;
                                                Provider.of<ProviderS>(context, listen: false).pbackground2 = white2;
                                                Provider.of<ProviderS>(context, listen: false).pb2 = white2;
                                                await SqlDb().updateData('update mode set status ="1"');
                                              } else {
                                                Provider.of<ProviderS>(context, listen: false).pwhite = white;
                                                Provider.of<ProviderS>(context, listen: false).pwhite1 = white1;
                                                Provider.of<ProviderS>(context, listen: false).pwhite2 = white2;
                                                Provider.of<ProviderS>(context, listen: false).pwhite3 = white3;
                                                Provider.of<ProviderS>(context, listen: false).pblack = black;
                                                Provider.of<ProviderS>(context, listen: false).pnave = nevColor;
                                                Provider.of<ProviderS>(context, listen: false).pbackground = bacground;
                                                Provider.of<ProviderS>(context, listen: false).pbackground2 = bacground2;
                                                Provider.of<ProviderS>(context, listen: false).pb2 = b2;
                                                await SqlDb().updateData('update mode set status ="0"');
                                              }

                                              data();
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          focusColor: value.pwhite,
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => AboutUs()),
                            // );
                          },
                          child: Card(
                            color: white.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.share_outlined,
                                    color: value.pwhite,
                                  ),
                                  SizedBox(
                                    width: w / 15,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(fontSize: 12.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ContactUs()),
                            // );
                          },
                          child: Card(
                            color: white.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: value.pwhite,
                                  ),
                                  SizedBox(
                                    width: w / 15,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(fontSize: 12.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Card(
                            color: value.pwhite.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_outlined,
                                    color: value.pwhite,
                                  ),
                                  SizedBox(
                                    width: w / 15,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(fontSize: 12.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Card(
                            color: value.pwhite.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.add_call,
                                    color: value.pwhite,
                                  ),
                                  SizedBox(
                                    width: w / 15,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(fontSize: 12.dp, color: value.pwhite, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: h / 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text("Privarcy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: value.pwhite,
                            fontFamily: "Merienda",
                            fontSize: 9.sp,
                            fontWeight: FontWeight.normal,
                          )),
                      SizedBox(
                        height: h / 40,
                      ),
                      Text("Copyright 2023 by\nNovatechzone (pvt)Ltd",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: value.pwhite,
                            fontFamily: "Merienda",
                            fontSize: 9.sp,
                            fontWeight: FontWeight.normal,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
