import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:gamai_pansalai/UI/login&sign_up/login.dart';
import 'package:gamai_pansalai/provider/all_provider.dart';
import 'package:provider/provider.dart';

import '../../color/color.dart';
import '../../widget/mainButton.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String t = '';
  String t2 = '';
  String t3 = '';
  String t4 = '';
  String t5 = '';
  String t6 = '';
  String t7 = '';
  String t8 = '';

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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: OnBoard(
              imageHeight: h / 4, imageWidth: w / 1.3,
              pageController: _pageController,
              // Either Provide onSkip Callback or skipButton Widget to handle skip state
              onSkip: () {
                // print('skipped');
              },
              // Either Provide onDone Callback or nextButton Widget to handle done state
              onDone: () {
                // print('done tapped');
              },
              onBoardData: [
                OnBoardModel(
                  title: 'How to generate available booking times ',
                  description:
                      ' You can get the difference between time and then add half duration on startDateTime. You can use TimeOfDay.fromDateTime for converting.',
                  imgUrl: 'assets/m.jpg',
                ),
                OnBoardModel(
                  title: 'nnnnnnnnnnnnnnnnnnnnnnnnnn',
                  description:
                      ' You can get the difference between time and then add half duration on startDateTime. You can use TimeOfDay.fromDateTime for converting.',
                  imgUrl: 'assets/m.jpg',
                ),
                OnBoardModel(
                  title: ' nnnnnnhn',
                  description:
                      ' You can get the difference between time and then add half duration on startDateTime. You can use TimeOfDay.fromDateTime for converting.',
                  imgUrl: 'assets/m.jpg',
                ),
              ],
              titleStyles: TextStyle(color: value.pwhite, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0.15, fontFamily: 'Exo2'),
              descriptionStyles: TextStyle(
                fontSize: 16,
                color: value.pwhite2,
              ),
              pageIndicatorStyle: PageIndicatorStyle(
                width: 100,
                inactiveColor: value.pwhite3,
                activeColor: value.pwhite1,
                inactiveSize: Size(8, 8),
                activeSize: Size(12, 12),
              ),
              // Either Provide onSkip Callback or skipButton Widget to handle skip state
              skipButton: TextButton(
                onPressed: () {
                  // print('skipButton pressed');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: value.pwhite1,
                  ),
                ),
              ),
              // Either Provide onDone Callback or nextButton Widget to handle done state
              nextButton: OnBoardConsumer(
                builder: (context, ref, child) {
                  final state = ref.watch(onBoardStateProvider);
                  return SizedBox(
                    width: w / 1.3,
                    child: MainButton(
                      buttonHeight: h / 13,
                      width: w,
                      onTap: () {
                        _onNextTap(state);
                        if (state.isLastPage) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        }
                      },
                      text: state.isLastPage ? 'Start' : "Next",
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }
}
