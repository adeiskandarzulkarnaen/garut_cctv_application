import 'package:flutter/material.dart';

import '../../models/cctv.dart';
import '../componen/live_video_player.dart';

class VideoScreen extends StatefulWidget {
  final Cctv cctv;

  const VideoScreen({super.key, required this.cctv});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.landscape
          ? null // show nothing in lanscape mode
          : AppBar(
              backgroundColor: Colors.amber,
              title: Text(widget.cctv.cctvName),
              centerTitle: true,
            ),
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? Center(child: LiveVideoPlayer(videoUrl: widget.cctv.linkRtmp))
          : Center(
            child: Column(
              children: [
                LiveVideoPlayer(videoUrl: widget.cctv.linkRtmp),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Lokasi : ${widget.cctv.cctvLocation} \nLatitute : ${widget.cctv.latitude} \nLongitude : ${widget.cctv.longitude.toString()}",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 20  
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      )
    );
  }
}
