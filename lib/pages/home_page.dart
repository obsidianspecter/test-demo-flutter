import 'package:flutter/material.dart';
import '../components/video_card.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {"title": "Video 1", "url": "https://www.youtube.com/watch?v=5lDJNFSWUD8"},
    {"title": "Video 2", "url": "https://www.youtube.com/watch?v=xWV71C2kp38"},
    {"title": "Video 3", "url": "https://www.youtube.com/watch?v=CD1Y2DmL5JM"},
    {"title": "Video 4", "url": "https://www.youtube.com/watch?v=8sAyPDLorek"},
    {"title": "Video 5", "url": "https://www.youtube.com/watch?v=BiOSCpV-lts"},
    {"title": "Video 6", "url": "https://www.youtube.com/watch?v=5lDJNFSWUD8"},
    {"title": "Video 7", "url": "https://www.youtube.com/watch?v=xWV71C2kp38"},
    {"title": "Video 8", "url": "https://www.youtube.com/watch?v=CD1Y2DmL5JM"},
    {"title": "Video 9", "url": "https://www.youtube.com/watch?v=8sAyPDLorek"},
    {"title": "Video 10", "url": "https://www.youtube.com/watch?v=BiOSCpV-lts"},
    {"title": "Video 11", "url": "https://www.youtube.com/watch?v=5lDJNFSWUD8"},
    {"title": "Video 12", "url": "https://www.youtube.com/watch?v=xWV71C2kp38"},
    {"title": "Video 13", "url": "https://www.youtube.com/watch?v=CD1Y2DmL5JM"},
    {"title": "Video 14", "url": "https://www.youtube.com/watch?v=8sAyPDLorek"},
    {"title": "Video 15", "url": "https://www.youtube.com/watch?v=BiOSCpV-lts"},
    {"title": "Video 16", "url": "https://www.youtube.com/watch?v=5lDJNFSWUD8"},
    {"title": "Video 17", "url": "https://www.youtube.com/watch?v=xWV71C2kp38"},
    {"title": "Video 18", "url": "https://www.youtube.com/watch?v=CD1Y2DmL5JM"},
    {"title": "Video 19", "url": "https://www.youtube.com/watch?v=8sAyPDLorek"},
    {"title": "Video 20", "url": "https://www.youtube.com/watch?v=BiOSCpV-lts"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Videos'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoCard(
            title: videos[index]['title']!,
            url: videos[index]['url']!,
          );
        },
      ),
    );
  }
}
