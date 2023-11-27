import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/color/color.dart';

import '../../widget/mainButton.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                                  'Sign Up',
                                  style: TextStyle(fontSize: 32.dp, color: white1, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                ),
                                Text(
                                  'Please fill the details and create account',
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
                                    hintText: 'Full name',
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
                                    hintText: 'Email',
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
                                    hintText: 'Password',
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
                                            "By signing up you accept the ",
                                            style: TextStyle(fontSize: 12.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "Terms of service ",
                                              style: TextStyle(fontSize: 12.dp, color: lightblue, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                            ),
                                          ),
                                          Text(
                                            "and ",
                                            style: TextStyle(fontSize: 12.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "Privacy policy",
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
                                  text: 'Sign In',
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account ?",
                                      style: TextStyle(fontSize: 13.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Log in',
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
                      "Or connect with",
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
                  'Skip',
                  style: TextStyle(fontSize: 14.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
