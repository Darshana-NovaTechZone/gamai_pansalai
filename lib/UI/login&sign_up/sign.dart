import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widget/mainButton.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                  height: h,
                  width: w,
                  child: Image.asset(
                    'assets/m.jpg',
                    color: black.withOpacity(0.8),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                top: 0,
                bottom: 0,
                child: SizedBox(
                  height: h,
                  width: w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(
                        flex: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 0),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              color: white.withOpacity(0.2),
                              width: w,
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.l6,
                                    style: TextStyle(fontSize: 32.dp, color: white1, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.l10,
                                    style: TextStyle(fontSize: 14.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: black, fontSize: 13.sp),
                                    validator: (value) {},
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            // color: pink.withOpacity(0.1),
                                            ),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(fontSize: 13.dp),
                                      hintText: AppLocalizations.of(context)!.l11,
                                      fillColor: white2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: black, fontSize: 13.sp),
                                    validator: (value) {},
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            // color: pink.withOpacity(0.1),
                                            ),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(fontSize: 13.dp),
                                      hintText: AppLocalizations.of(context)!.l3,
                                      fillColor: white2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: black, fontSize: 13.sp),
                                    validator: (value) {},
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility_off)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            // color: pink.withOpacity(0.1),
                                            ),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(fontSize: 13.dp),
                                      hintText: AppLocalizations.of(context)!.l4,
                                      fillColor: white2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      Expanded(
                                        child: Wrap(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.l12,
                                              style: TextStyle(fontSize: 12.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                AppLocalizations.of(context)!.l13,
                                                style: TextStyle(fontSize: 12.dp, color: lightblue, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!.l14,
                                              style: TextStyle(fontSize: 12.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                AppLocalizations.of(context)!.l15,
                                                style: TextStyle(fontSize: 12.dp, color: lightblue, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MainButton(
                                    buttonHeight: h / 13,
                                    width: w,
                                    onTap: () {},
                                    text: AppLocalizations.of(context)!.l16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.l7,
                                        style: TextStyle(fontSize: 13.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          AppLocalizations.of(context)!.l8,
                                          style: TextStyle(fontSize: 13.dp, color: lightblue, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        AppLocalizations.of(context)!.l8,
                        style: TextStyle(fontSize: 13.dp, color: white3, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                      ),
                      Spacer(),
                      SizedBox(
                        width: w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: white2)),
                                child: Image.asset('assets/icons8-facebook-48.png')),
                            Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: white2)),
                                child: Image.asset('assets/icons8-google-48.png')),
                            Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: white2)),
                                child: Image.asset('assets/icons8-twitter-48.png')),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.l9,
                    style: TextStyle(fontSize: 14.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
