import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../color/color.dart';

class PirithDetails extends StatefulWidget {
  const PirithDetails({super.key});

  @override
  State<PirithDetails> createState() => _PirithDetailsState();
}

class _PirithDetailsState extends State<PirithDetails> {
  YoutubePlayerController? _controller;
  final player = AudioPlayer();
  @override
  void initState() {
    data();
    // TODO: implement initState
    super.initState();
  }

  data() async {
    await player.play(UrlSource('https://example.com/my-audio.wav'));
    String videoId = '';
    videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=URReYLe40hw").toString();
    print(videoId);

    _controller = YoutubePlayerController(initialVideoId: videoId, flags: YoutubePlayerFlags());

    YoutubePlayer(
      controller: _controller!,
      liveUIColor: Colors.amber,
    ); // BBAyRBTfsOU
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        actions: [],
        scrolledUnderElevation: 800,
        surfaceTintColor: Color.fromARGB(255, 2, 12, 20),
        backgroundColor: Colors.transparent,
        title: Text(
          'බණ',
          style: TextStyle(fontSize: 18.dp, color: white, fontWeight: FontWeight.bold, fontFamily: 'sinhala'),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(248, 123, 218, 196), Color.fromARGB(248, 42, 72, 65)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        // child:

        //  YoutubePlayer(
        //   controller: _controller!,
        //   showVideoProgressIndicator: true,
        // ),
      ),
    );
  }
}
