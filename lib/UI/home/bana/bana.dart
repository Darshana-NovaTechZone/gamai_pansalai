import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/UI/home/bana/details_bana.dart';
import 'package:provider/provider.dart';

import '../../../color/color.dart';
import '../../../provider/all_provider.dart';
import '../Custom_drawer.dart';

class Bana extends StatefulWidget {
  const Bana({super.key});

  @override
  State<Bana> createState() => _BanaState();
}

class _BanaState extends State<Bana> {
  bool _search = false;
  List book = [
    'assets/p.PNG',
    'assets/p2.PNG',
    'assets/p5.PNG',
    'assets/p6.PNG',
    'assets/p7.PNG',
    'assets/p8.PNG',
    'assets/p1.PNG',
  ];
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
            backgroundColor: Colors.transparent,
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
            title: Text(
              'බණ',
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
                            fillColor: value.pb2,
                          ),
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BanaDetails(),
                                  ));
                            },
                            child: Card(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        book[index],
                                        fit: BoxFit.cover,
                                        width: w + 10,
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: black.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: w,
                                    height: h,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'පුජ්‍ය බොරැල්ලේ කෝවිද හිමි,',
                                          style: TextStyle(fontSize: 12.dp, color: white, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'හරිම සංවේදී ආශ්චර්යමත් බන දේශනාවක්',
                                          style: TextStyle(fontSize: 12.dp, color: white1, fontWeight: FontWeight.bold, fontFamily: 'fontSinhala'),
                                        ),
                                      ],
                                    ),
                                  )
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
