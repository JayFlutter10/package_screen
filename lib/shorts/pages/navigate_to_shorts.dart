import 'package:flutter/material.dart';
import 'package:flutter_application_1/shorts/pages/shorts_screen.dart';

class NavigateToShorts extends StatefulWidget {
  const NavigateToShorts({super.key});

  @override
  State<NavigateToShorts> createState() => _NavigateToShortsState();
}

class _NavigateToShortsState extends State<NavigateToShorts> {
  final String channelId='UC-1kzHtwBY8n0TY5NhYxNaw';
  final String apiKey='AIzaSyAVIXa894w3LGWaUFFIDBPu-4mHTOt5OKY';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>YouTubeShorts(channelId: channelId, apiKey: apiKey)));
            }, child: Text('Navigate to Shorts',style: TextStyle(fontSize: 16),)),
          ),
        ],
      ),
    );
  }
}
