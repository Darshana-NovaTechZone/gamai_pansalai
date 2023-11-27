import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/UI/home/Custom_drawer.dart';
import 'package:gamai_pansalai/provider/all_provider.dart';
import 'package:provider/provider.dart';

import '../../color/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List img = [
    'assets/Virtual_Background_1.jpg',
    'assets/Virtual_Background_4.jpg',
    'assets/aa4d0804-a2ac-43ea-a7ae-e6b39d0a5d91 (1).jpg',
    'assets/Virtual_Background_4.jpg',
  ];
  List temple = [
    'assets/1.PNG',
    'assets/2.PNG',
    'assets/3.PNG',
    'assets/4.PNG',
    'assets/6.PNG',
  ];
  List s = [
    'assets/a.PNG',
    'assets/a3.PNG',
    'assets/a4.PNG',
    'assets/a1.PNG',
  ];
  List book = [
    'assets/p.PNG',
    'assets/p2.PNG',
    'assets/p5.PNG',
    'assets/p6.PNG',
  ];
  int _current = 0;
  var key1 = GlobalKey();
  var key2 = GlobalKey();
  var key3 = GlobalKey();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final CarouselController _controller = CarouselController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      drawer: customDrawer(),
      body: Consumer<ProviderS>(
        builder: (context, value, child) => Stack(
          children: [
            Container(
              height: h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                value.pbackground, value.pbackground2
                // [Color.fromARGB(248, 123, 218, 196), Color.fromARGB(248, 42, 72, 65)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Stack(children: [
                // SizedBox(
                //     height: h,
                //     width: w,
                //     child: Image.asset(
                //       'assets/m.jpg',
                //       color: white.withOpacity(0.8),
                //       colorBlendMode: BlendMode.colorDodge,
                //       fit: BoxFit.cover,
                //     )),
                Container(
                  height: h,
                  width: w,
                  color: black.withOpacity(0.2),
                ),
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top + 12,
                      ),
                      CarouselSlider.builder(
                        key: key1,
                        itemBuilder: (context, index, realIndex) {
                          return Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    s[index],
                                    fit: BoxFit.cover,
                                    width: w + 10,
                                    height: h / 3,
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: h / 3,
                                width: w,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'බණ දේශණා',
                                        style: TextStyle(fontSize: 32.dp, color: white1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                      ),
                                      Text(
                                        'සිත ගැන දැනගන්න මේ බණ \nදේශණාව අහන්න ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14.dp, color: white2, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: s.length,
                        options: CarouselOptions(
                            height: h / 2.9,
                            padEnds: true,
                            aspectRatio: 2.0,
                            autoPlay: true,
                            disableCenter: true,
                            viewportFraction: 0.94,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: s.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark ? value.pwhite2 : value.pwhite)
                                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'පන්සල්',
                              style: TextStyle(fontSize: 18.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'see more',
                                style: TextStyle(
                                  fontSize: 15.dp,
                                  color: value.pwhite2,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'fontSinhala',
                                  decoration: TextDecoration.underline,
                                  decorationColor: value.pwhite2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CarouselSlider.builder(
                        key: key2,
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  temple[index],
                                  fit: BoxFit.cover,
                                  width: w,
                                )),
                          );
                        },
                        itemCount: temple.length,
                        options: CarouselOptions(
                            height: h / 5,
                            padEnds: true,
                            aspectRatio: 2.0,
                            autoPlay: true,
                            disableCenter: true,
                            viewportFraction: 0.5,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ධර්ම දේශනා ග්‍රන්ථ',
                              style: TextStyle(fontSize: 17.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'see more',
                                style: TextStyle(
                                  fontSize: 15.dp,
                                  color: value.pwhite2,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'fontSinhala',
                                  decoration: TextDecoration.underline,
                                  decorationColor: value.pwhite2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GridView.builder(
                          padding: EdgeInsets.all(8),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: book.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    book[index],
                                    fit: BoxFit.cover,
                                    width: w + 10,
                                  ),
                                ),
                              )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'ඉදිරියට එන දහම් වැඩසටහන්',
                                style: TextStyle(fontSize: 17.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'see more',
                                style: TextStyle(
                                  fontSize: 15.dp,
                                  color: value.pwhite2,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'fontSinhala',
                                  decoration: TextDecoration.underline,
                                  decorationColor: value.pwhite2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GridView.builder(
                          padding: EdgeInsets.all(8),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: book.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      book[index],
                                      fit: BoxFit.cover,
                                      width: w + 10,
                                    )),
                              )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'වත් පිලිවෙත්',
                                style: TextStyle(fontSize: 17.dp, color: value.pwhite1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'see more',
                                style: TextStyle(
                                  fontSize: 15.dp,
                                  color: value.pwhite2,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'fontSinhala',
                                  decoration: TextDecoration.underline,
                                  decorationColor: value.pwhite2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CarouselSlider.builder(
                        key: key3,
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  temple[index],
                                  fit: BoxFit.cover,
                                  width: w,
                                )),
                          );
                        },
                        itemCount: temple.length,
                        options: CarouselOptions(
                            height: h / 5,
                            padEnds: true,
                            aspectRatio: 2.0,
                            autoPlay: true,
                            disableCenter: true,
                            viewportFraction: 0.5,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {}),
                      ),
                    ],
                  ),
                ),
              ]),
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
            )
          ],
        ),
      ),
    );
  }
}
