import 'dart:core';

import 'package:audioplayers/audioplayers.dart';
import 'package:fdrive/models/file_model.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';

class ViewFileScreen extends StatelessWidget {
  FileModel file;
  ViewFileScreen(this.file);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              file.name,
              style: textStyle(18, Colors.white, FontWeight.w600),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                width: 32,
                                height: 32,
                                image: NetworkImage(file.url),
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              file.name,
                              style:
                                  textStyle(16, Colors.black, FontWeight.w500),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 3,
                          ),
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.only(bottom: 0, left: 16, top: 12),
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            leading: Icon(
                              Icons.file_download,
                              color: Colors.grey,
                            ),
                            title: Text(
                              "Download",
                              style:
                                  textStyle(16, Colors.black, FontWeight.w500),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            contentPadding:
                                EdgeInsets.only(top: 8, left: 16, bottom: 12),
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            leading: Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 22,
                            ),
                            title: Text(
                              "Remove",
                              style:
                                  textStyle(16, Colors.black, FontWeight.w500),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        body: file.fileType == "image"
            ? showImage(file.url)
            : file.fileType == "application"
                ? showFile(file.url)
                : file.fileType == "video"
                    ? showVideo(file.url)
                    : file.fileType == "audio"
                        ? AudioPlayerWidget(file.url)
                        : showError());
  }
}

showImage(String url) {
  return Center(
    child: Image(
      image: NetworkImage(url),
    ),
  );
}

showFile(String url) {}

showVideo(String url) {}

class AudioPlayerWidget extends StatefulWidget {
  final String url;
  AudioPlayerWidget(this.url);
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();

  bool playing = false;

  @override
  void initState() {
    handleAudio();
    super.initState();
  }

  handleAudio() async {
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() => playing = false);
      }
    } else {
      var res = await audioPlayer.play(widget.url, isLocal: false);
      if (res == 1) {
        setState(() => playing = true);
      }
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() => duration = dd);
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() => position = dd);
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 64,
            height: 64,
            image: AssetImage("images/mp3.png"),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40,
          ),
          Slider.adaptive(
            min: 0.0,
            value: position.inSeconds.toDouble(),
            max: duration.inSeconds.toDouble(),
            onChanged: (double value) {
              setState(
                  () => audioPlayer.seek(Duration(seconds: value.toInt())));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.fast_rewind_rounded),
                  color: Colors.white,
                  iconSize: 32,
                  onPressed: () => audioPlayer
                      .seek(Duration(seconds: position.inSeconds - 15))),
              IconButton(
                icon: Icon(
                  playing == false
                      ? Icons.play_circle_fill
                      : Icons.pause_circle_filled,
                  color: Colors.white,
                ),
                iconSize: 56,
                onPressed: () => handleAudio(),
              ),
              IconButton(
                  icon: Icon(Icons.fast_forward_rounded),
                  color: Colors.white,
                  iconSize: 32,
                  onPressed: () => audioPlayer
                      .seek(Duration(seconds: position.inSeconds + 15)))
            ],
          )
        ],
      ),
    );
  }
}

showError() {}
