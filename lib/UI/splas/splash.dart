import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gamai_pansalai/UI/login&sign_up/login.dart';
import 'package:gamai_pansalai/color/color.dart';
import 'package:provider/provider.dart';

import '../../db/sqldb.dart';
import '../../provider/all_provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SqlDb sqlDb = SqlDb();
  @override
  void initState() {
    localData();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        )));
    // TODO: implement initState
    super.initState();
  }

  localData() async {
    List modeData = await SqlDb().readData('select * from mode');
    if (modeData.isNotEmpty) {
      if (modeData[0]['status'] == 1) {
        Provider.of<ProviderS>(context, listen: false).pwhite = black;
        Provider.of<ProviderS>(context, listen: false).pwhite1 = black1;
        Provider.of<ProviderS>(context, listen: false).pwhite2 = black2;
        Provider.of<ProviderS>(context, listen: false).pwhite3 = black3;
        Provider.of<ProviderS>(context, listen: false).pblack = white;
        Provider.of<ProviderS>(context, listen: false).pnave = white;
        Provider.of<ProviderS>(context, listen: false).pbackground = white;
        Provider.of<ProviderS>(context, listen: false).pbackground2 = white2;
        Provider.of<ProviderS>(context, listen: false).pb2 = white2;
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: black,
      body: Container(
          width: double.infinity,
          color: white,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: black.withOpacity(0.1),
              ),
              Center(
                child: Text(
                  'ගමයි පන්සලයි ',
                  style: TextStyle(
                    fontSize: 32.dp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
