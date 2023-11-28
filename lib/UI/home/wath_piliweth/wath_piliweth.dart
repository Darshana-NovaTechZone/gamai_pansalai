import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../color/color.dart';
import '../../../provider/all_provider.dart';

class WathPiliweth extends StatefulWidget {
  const WathPiliweth({super.key, required this.img});
  final String img;

  @override
  State<WathPiliweth> createState() => _WathPiliwethState();
}

class _WathPiliwethState extends State<WathPiliweth> {
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
                              'assets/w.PNG',
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
                                  'වත් පිළිවෙත් ඉගෙන ගනිමු',
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
                        'වත්ත යන පදය පාලි ශබ්ද කෝෂය අර්ථ දක්වන්නේ, “පිළිපැදිය යුතු, ක්‍රියාවට නැංවිය යුතු” යනුවෙනි. ඒ අනුව භික්‍ෂූ වතාවත් ලෙස හැඳින්වෙන්නේ භික්‍ෂූන් වහන්සේ පිළිපැදිය යුතු හා ක්‍රියාවට නැංවිය යුතු කරුණු වේ. සූත්‍ර දේශනා තුළ භික්‍ෂූ වතාවත් පිළිබඳ අඩු වැඩි වශයෙන් කරුණු සඳහන් වෙතත්, මෙහිදී බලාපොරොත්තු වන්නේ චුල්ල වග්ග පාලියේ වත්තක්කන්ධකයෙහි ඇතුළත් භික්‍ෂූන් වහන්සේගේ ආරාමික වත් පිළිබඳ විමසීමක් කිරීමය.භික්‍ෂු ශාසනයේ ආරම්භයේ සිටම භික්‍ෂූන් වහන්සේගේ බ්‍රහ්මචාරි ජීවිතයේ ක්‍රියාත්මක වුයේ, පෞද්ගලික අරමුණු මෙන්ම සමාජයීය අපේක්‍ෂාවන්ද ඇතිවයි. ප්‍රථම ධර්ම දූත සේවයේ යෙදුණූ මහ රහතන් වහන්සේ වෙත බුදු රජාණන් වහන්සේ දෙන ලද උපදේශය තුළින් ඒ බැව් සනාථ වේ. “ චරථ භික්ඛවේ චාරිකං බහුජන හිතාය, බහුජන සුඛාය, සදේව මනුස්සානං “ ස්ව විමුක්තිය උදෙසා මෙන්ම,දෙවියන් සහිත ලෝකයාගේ විමුක්තිය උදෙසා හැසිරිය යුතුය. සංචාරක ජීවිතයක් ගත කළ භික්‍ෂූන් වහන්සේට වස් සමාදන් වීම පිළිබඳව විනය ප්‍රඥප්තියක් ලැබීමෙන්, දිගු කාලයක් එක් තැනක රැඳීමට ඉඩ ලැබුණි. මුල්ම අවධියේදී භික්‍ෂූන් වහන්සේ සංචාරක ජීවිතයක් ගත කිරීමට බල පෑ හේතු කීපයකි. බුද්ධ කාලීන භාරතයේ සිටි සමකාලීන ශ්‍රමණ සම්ප්‍රදායන්ගේ ආභාෂයට, අනුව සංඝ සමාජය ගොඩනැඟීම එක් හේතුවකි. ශාසනය ආරම්භයේදී භික්‍ෂූන් වහන්සේ උදෙසා ස්ථීර වාසස්ථාන නොතිබීම තවත් හේතුවකි.බුදුරජාණන් වහන්සේ විෂයෙහි පූජා කරන ලද ප්‍රථම ආරාම පූජාව ලෙස සැලකෙන්නේ වේළුවනාරාමයයි. ග්‍රන්ථාගත තොරතුරුව ලට අනුව එහි වැඩි භික්‍ෂු පිරිසකට නේවාසිකව වැඩ සිටීමට පහසුකම් තිබුණු බවත්, දීර්ඝ කාලයක් භාවිතයට ගත හැකි ස්ථිර ගොඩනැගිලි වලින් සමන්විත වු බවත් පැහැදිලිවේ. බුදුරජාණන් වහන්සේ අවස්ථා කිහිපයකදීම වැසි සමයේ එහි වැඩ විසූ බවද සඳහන් වේ. රජගහනුවර සිටුවරයා විසින් භික්‍ෂූන් වහන්සේලා සඳහා සාදවා පූජා කරන ලද ආරාමය, කුටි හෙවත් විහාර හැටකින් සමන්විත විය.වර්තමානයේ ශේෂව පවතින අනේපිඬු සිටුතුමා විසින් පූජා කරන ලද ජේතවනාරාමය වුවද, කුටි රාශියකින් සමන්විතව පැවති බැව් පැහැදිලි වේ. ග්‍රාමීය හෝ නාගරික හෝ භික්‍ෂූන් සඳහා ඉදිකළ ආරාම, පෞද්ගලිකව පරිහරණය කළ හැකි කුටි රාශියකින් හා පොදුවේ භාවිතා කළ හැකි විශාල ගොඩනැගිලි වලින්ද, සමන්විතව තිබුණි. භික්‍ෂූන් වහන්සේ ආරම්භයේ සිටම සාමූහිකව වැඩ විසූ බවට මේ කදිම සාක්ෂියකි. පිරිසක් එක් තැනක එක්ව කටයුතු කිරීමේ දී සාමූහික ජීවිතය පහසුකර ගැනීමෙහිලා සැකසුණු වත් පිළිවෙත් සමූහයක්, උන්වහන්සේලා තුළ පැවතිය යුතු විය. බුදු රජාණන් වහන්සේ විවිධ අවස්ථාවන්හිදී, සාමූහිකව වසන භික්‍ෂූන්ගේ පහසුව පරිදි දේශනා කරන ලද වත් පිළිවෙත් සමූහයක් පිළිබඳ වත්තක්කන්ධකයෙහි සඳහන් වේ.සමූහයෙන් වෙන්ව හුදකලාව ජීවත්වීමේ දී, කෙනෙකුට තමාට ආවේණික වූ පෞද්ගලික චර්යා පද්ධතියක් ක්‍රියාවට නැංවිය හැකි වුවත්, සාමුහික ජීවිතයේදි එසේ ක්‍රියා කළ නොහැක. සමූහයෙන් තමා අපේක්‍ෂා කරන දෑ හා තමාගෙන් සමූහයාට ඉටුවිය යුතු දෑ පිළිබඳ අපේක්‍ෂාවන්හි, පුද්ගල විසමතා පවතින බැවින්, පිළිගත හැකි, සාමූහිකව ක්‍රියා කිරීමටය යෝග්‍ය , ප්‍රතිපත්ති අත්‍යවශ්‍ය වේ. එකිනෙකාගේ ආරක්‍ෂාව , පිරිසුදු බව, විශ්වාසය, සහයෝගීතාවය, කාය¸ක්‍ෂමතාවය, ආගන්තුක සත්කාරය, එකිනෙකා ඇගයීම හා ඔවුනොවුන් තුළ ගෞරවය ඇතිව කටයුතු කිරීම, සමූහයක් තුළ ප්‍රකට විය යුතු ගුණාංග කීපයකි. වත්තක්ඛන්ධකයේ අන්තර්ගත කරුණු වලින් ප්‍රකට කරණුයේ සාමූහිකව වැඩ විසීමේදි, ගැටලු ආරවුල් වලින් තොරව භික්‍ෂූන් වහන්සේලාට වැඩ විසීම පිණිස, පිළිපැදිය යුතු උපදෙස් හා අනුගමනය කළ යුතු ක්‍රමෝපායන් පැහැදිලි කිරීමයි.',
                        trimLines: 20,
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
