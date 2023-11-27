import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gamai_pansalai/color/color.dart';

class AudioPlay extends StatefulWidget {
  const AudioPlay({super.key});

  @override
  State<AudioPlay> createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {
  final player = AudioPlayer();
  bool isPlaying = false;
  bool isploading = false;
  Duration duration = Duration.zero;
  Duration Position = Duration.zero;
  bool loop = false;
  void initState() {
    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
        print(isPlaying);
        isploading = false;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        isPlaying = true;
        duration = newDuration;
        print(duration);
      });
    });
    player.onPlayerStateChanged.listen((event) {
      print('sssssssss$event');
    });

    player.onPositionChanged.listen((event) {
      setState(() {
        Position = event;
        print(Position);
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        Position = Duration(seconds: 0);
        isPlaying = false;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  changeToSecond(int second) {
    Duration newDuration = Duration();
    setState(() {
      player.seek(newDuration);
    });
  }

  // final List<Color> colors = [
  //   Colors.red[900]!,
  //   const Color.fromARGB(255, 149, 28, 183)!,
  //   brown,
  //   Colors.green[900]!,
  //   Color.fromARGB(255, 242, 154, 232)!,
  //   Colors.blue[900]!,
  //   red,
  //   Colors.brown[900]!
  // ];
  @protected
  void dispose() {
    player.dispose();
    super.dispose();
  }

  final List<int> duration1 = [1000, 700, 600, 800, 500, 10, 100];
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Container(
          height: h,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () async {
                      await player.stop();

                      Navigator.pop(context);
                    },
                    onTapDown: (_) {
                      setState(() {
                        tap = true;
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        tap = false;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        tap = false;
                      });
                    },
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 50),
                      opacity: tap ? 0.3 : 1,
                      child: CircleAvatar(
                          backgroundColor: white.withOpacity(0.3),
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: white,
                          )),
                    )),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: h / 5,
                      backgroundImage: ExactAssetImage(
                        'assets/m.jpg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h / 30,
                  ),

                  SizedBox(
                    height: h / 15,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: w / 13),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     height: 50,
                  //     child: Center(
                  //       child: WaveformProgressbar(
                  //         color: Colors.grey,
                  //         progressColor: white,
                  //         progress: Position.inSeconds.toDouble() / 60,
                  //         onTap: (progress) {
                  //           setState(() {
                  //             var tt = progress;
                  //             changeToSecond(tt.toInt());
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 50,
                  //   child: MusicVisualizer(
                  //     curve: Curves.bounceIn,
                  //     barCount: 50,
                  //     colors: colors,
                  //     duration: duration1,
                  //   ),
                  // ),
                  Slider(
                    value: Position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    activeColor: white,
                    inactiveColor: Colors.red,
                    min: 0.0,
                    onChanged: (value) {
                      log(value.toString());
                      setState(() {
                        changeToSecond(value.toInt());
                        value = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                player.release();
                              },
                              child: Icon(
                                Icons.restart_alt_outlined,
                                color: white,
                                size: 30,
                              )),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: IconButton(
                                onPressed: () {
                                  player.setPlaybackRate(0.5);
                                },
                                icon: Icon(
                                  Icons.fast_rewind,
                                  color: white,
                                  size: 30,
                                )),
                          ),
                          isploading
                              ? Center(
                                  child: SizedBox(
                                  height: h / 9,
                                  width: h / 9,
                                  child: CircularProgressIndicator(
                                    color: white,
                                  ),
                                ))
                              : TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      if (player.onPlayerStateChanged == PlayerState.paused || player.onPlayerStateChanged == PlayerState.playing) {
                                      } else {
                                        isploading = true;
                                      }
                                    });
                                    log('ddddssssdddddd');
                                    // await player.play(UrlSource('https://example.com/my-audio.wav'));
                                    if (isPlaying) {
                                      print('dddddddddd');
                                      await player.pause();
                                    } else {
                                      print('ddddssssdddddd');
                                      await player.play(UrlSource(
                                          'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3'));
                                      // await player.play(
                                      //   'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3',
                                      // );
                                    }
                                  },
                                  child: Icon(
                                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                                    color: white,
                                    size: h / 9,
                                  )),
                          TextButton(
                              onPressed: () {
                                player.setPlaybackRate(1.5);
                              },
                              child: Icon(
                                Icons.fast_forward_rounded,
                                color: white,
                                size: 30,
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  loop = !loop;
                                  print(loop.toString());
                                });
                                if (loop == true) {
                                  print(loop.toString());
                                  player.setReleaseMode(ReleaseMode.loop);
                                } else {
                                  print(loop.toString());
                                  player.setReleaseMode(ReleaseMode.stop);
                                }
                              },
                              child: Icon(
                                Icons.repeat_rounded,
                                color: loop ? Colors.red : white,
                                size: 30,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
