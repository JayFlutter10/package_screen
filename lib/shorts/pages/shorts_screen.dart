import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeShorts extends StatefulWidget {
  final String channelId;
  final String apiKey;

  const YouTubeShorts({
    Key? key,
    required this.channelId,
    required this.apiKey,
  }) : super(key: key);

  @override
  _YouTubeShortsState createState() => _YouTubeShortsState();
}

class YouTubeVideo {
  final String id;
  final String title;
  final String channelTitle;
  final String description;
  final String thumbnailUrl;
  final DateTime publishedAt;
  final String? duration;
  final String? viewCount;

  YouTubeVideo({
    required this.id,
    required this.title,
    required this.channelTitle,
    required this.description,
    required this.thumbnailUrl,
    required this.publishedAt,
    this.duration,
    this.viewCount,
  });

  factory YouTubeVideo.fromJson(Map<String, dynamic> json) {
    return YouTubeVideo(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      channelTitle: json['snippet']['channelTitle'],
      description: json['snippet']['description'],
      thumbnailUrl: json['snippet']['thumbnails']['high']['url'],
      publishedAt: DateTime.parse(json['snippet']['publishedAt']),
    );
  }
}

class _YouTubeShortsState extends State<YouTubeShorts> {
  final List<YouTubeVideo> _shorts = [];
  bool _isLoading = false;
  String? _nextPageToken;
  String? _error;
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchShorts();
  }

  Future<void> _fetchShorts() async {
    if (_isLoading || (_nextPageToken == null && _shorts.isNotEmpty)) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // First API call to search for videos
      final searchParams = {
        'key': widget.apiKey,
        'channelId': widget.channelId,
        'part': 'snippet',  // Simplified part parameter
        'maxResults': '10',  // Reduced for better performance
        'order': 'date',    // Sort by date
        'type': 'video',
      };

      final searchUri = Uri.https(
        'www.googleapis.com',
        '/youtube/v3/search',
        searchParams,
      );


      final searchResponse = await http.get(searchUri);

      if (searchResponse.statusCode != 200) {
        throw Exception('Search API failed with status ${searchResponse.statusCode}: ${searchResponse.body}');
      }

      final searchData = json.decode(searchResponse.body);

      if (searchData['items'] == null || (searchData['items'] as List).isEmpty) {
        setState(() {
          _error = 'No videos found for this channel';
          _isLoading = false;
        });
        return;
      }

        // Fetch additional video details
      final videoIds = (searchData['items'] as List)
          .map((item) => item['id']['videoId'] as String)
          .join(',');

      // Second API call to get video details
      final videoParams = {
        'key': widget.apiKey,
        'part': 'snippet,contentDetails,statistics',
        'id': videoIds,
      };

      final videoUri = Uri.https(
        'www.googleapis.com',
        '/youtube/v3/videos',
        videoParams,
      );

      final videoResponse = await http.get(videoUri);

      if (videoResponse.statusCode != 200) {
        throw Exception('Video API failed with status ${videoResponse.statusCode}: ${videoResponse.body}');
      }

      final videoData = json.decode(videoResponse.body);


      // Filter for short videos (less than 60 seconds)
      final videos = (videoData['items'] as List).where((item) {
        final duration = item['contentDetails']['duration'];
        final durationInSeconds = _parseDuration(duration);
        return durationInSeconds <= 60;
      }).map((item) {
        return YouTubeVideo(
          id: item['id'],
          title: item['snippet']['title'],
          channelTitle: item['snippet']['channelTitle'],
          description: item['snippet']['description'],
          thumbnailUrl: item['snippet']['thumbnails']['high']['url'],
          publishedAt: DateTime.parse(item['snippet']['publishedAt']),
          duration: item['contentDetails']['duration'],
          viewCount: item['statistics']['viewCount'],
        );
      }).toList();

      setState(() {
        _shorts.addAll(videos);
        _nextPageToken = searchData['nextPageToken'];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Error loading shorts: $e';
      });
        // Detailed error logging
    }
  }

  // Helper method to parse ISO 8601 duration
  int _parseDuration(String duration) {
    final regexp = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?');
    final matches = regexp.firstMatch(duration);
    if (matches == null) return 0;

    final hours = int.tryParse(matches.group(1) ?? '0') ?? 0;
    final minutes = int.tryParse(matches.group(2) ?? '0') ?? 0;
    final seconds = int.tryParse(matches.group(3) ?? '0') ?? 0;

    return hours * 3600 + minutes * 60 + seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: _error != null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _error!,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _error = null;
                  _shorts.clear();
                  _nextPageToken = null;
                });
                _fetchShorts();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      )
          : Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
              if (index == _shorts.length - 3) {
                _fetchShorts();
              }
            },
            itemCount: _shorts.length,
            itemBuilder: (context, index) {
              final video = _shorts[index];
              return ShortVideoPlayer(
                key: ValueKey(video.id),
                video: video,
                isActive: index == _currentIndex,
              );
            },
          ),
          if (_isLoading && _shorts.isEmpty)
            const Center(

              child: CircularProgressIndicator(color: Colors.white),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class ShortVideoPlayer extends StatefulWidget {
  final YouTubeVideo video;
  final bool isActive;

  const ShortVideoPlayer({
    super.key,
    required this.video,
    required this.isActive,
  });

  @override
  _ShortVideoPlayerState createState() => _ShortVideoPlayerState();
}

class _ShortVideoPlayerState extends State<ShortVideoPlayer> {
  YoutubePlayerController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _safeInitializePlayer();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
    setState(() => _isInitialized = true);
  }


  Future<void> _navigateToChannel() async {
    final Uri url = Uri.parse('https://www.youtube.com/@RivaanRanawat/shorts');

    try {
      // First check if the URL can be launched
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        ).catchError((error) {
          _showError('Failed to open URL: $error');
          return false;
        });
      } else {
        _showError('Could not launch YouTube');
      }
    } catch (e) {
      _showError('Error launching URL: $e');
      print(e);
    }
  }

  void _showError(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
    );
  }

  // Add this method to handle initialization errors
  Future<void> _safeInitializePlayer() async {
    try {
      await _initializePlayer();
    } catch (e) {
      _showError('Error initializing player: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Video Player
        IndexedStack(
          sizing: StackFit.expand,
          children: [
            if (_isInitialized && _controller != null)
              YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: false,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
              )
            else
              Image.network(
                widget.video.thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error, color: Colors.white),
                  );
                },
              ),
          ],
        ),

        // Channel Info with Navigation
        Positioned(
          bottom: 20,
          left: 10,
          right: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _navigateToChannel,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white24,
                      child: Text(
                        widget.video.channelTitle[0].toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '@${widget.video.channelTitle}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.video.title,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (!_isInitialized)
          const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}