import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const VideoListPage(),
    );
  }
}

class VideoListPage extends StatelessWidget {
  const VideoListPage({super.key});

  // Updated list of videos with more entries
  final List<Map<String, String>> videos = const [
    {
      'title': 'Flutter Tutorial for Beginners',
      'url': 'https://www.youtube.com/watch?v=1gDhl4leEzA',
      'thumbnail': 'https://img.youtube.com/vi/1gDhl4leEzA/hqdefault.jpg',
    },
    {
      'title': 'Building a Chat App with Flutter',
      'url': 'https://www.youtube.com/watch?v=QnD5d2k8L4g',
      'thumbnail': 'https://img.youtube.com/vi/QnD5d2k8L4g/hqdefault.jpg',
    },
    {
      'title': 'Understanding Dart Language',
      'url': 'https://www.youtube.com/watch?v=ejb2QWc9w7Y',
      'thumbnail': 'https://img.youtube.com/vi/ejb2QWc9w7Y/hqdefault.jpg',
    },
    {
      'title': 'State Management in Flutter',
      'url': 'https://www.youtube.com/watch?v=1gDhl4leEzA', // Example URL
      'thumbnail': 'https://img.youtube.com/vi/1gDhl4leEzA/hqdefault.jpg', // Example thumbnail
    },
    {
      'title': 'Flutter vs React Native - Which is Better?',
      'url': 'https://www.youtube.com/watch?v=QnD5d2k8L4g', // Example URL
      'thumbnail': 'https://img.youtube.com/vi/QnD5d2k8L4g/hqdefault.jpg', // Example thumbnail
    },
    {
      'title': 'Creating Responsive Layouts in Flutter',
      'url': 'https://www.youtube.com/watch?v=ejb2QWc9w7Y', // Example URL
      'thumbnail': 'https://img.youtube.com/vi/ejb2QWc9w7Y/hqdefault.jpg', // Example thumbnail
    },
    {
      'title': 'Flutter Animation Tutorial',
      'url': 'https://www.youtube.com/watch?v=1gDhl4leEzA', // Example URL
      'thumbnail': 'https://img.youtube.com/vi/1gDhl4leEzA/hqdefault.jpg', // Example thumbnail
    },
    {
      'title': 'Building RESTful APIs with Dart',
      'url': 'https://www.youtube.com/watch?v=QnD5d2k8L4g', // Example URL
      'thumbnail': 'https://img.youtube.com/vi/QnD5d2k8L4g/hqdefault.jpg', // Example thumbnail
    },
    // Add more videos here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Clone'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerPage(url: videos[index]['url']!),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(videos[index]['thumbnail']!),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      videos[index]['title']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String url;

  const VideoPlayerPage({super.key, required this.url});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with the video URL
    _controller = VideoPlayerController.network(widget.url);
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}