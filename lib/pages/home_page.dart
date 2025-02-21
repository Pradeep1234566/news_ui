import 'package:flutter/material.dart';
import 'package:news/services/news_fetch.dart';
// import 'news_page.dart'; // Import NewsPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.white),
            const Text('Pradeep News',
                style: TextStyle(fontSize: 24, color: Colors.white)),
            Icon(Icons.notifications, color: Colors.white),
          ],
        ),
      ),
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          // Categories Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Politics',
                    style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child:
                    const Text('Sports', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child:
                    const Text('Movies', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Technology',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),

          // News Page (Fetching and Displaying News)
          // Expanded(child: NewsPage()), // Add NewsPage here
        ],
      ),
    );
  }
}
