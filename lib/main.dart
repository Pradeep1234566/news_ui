import 'package:flutter/material.dart';
import 'package:news/services/news_fetch.dart';
// Import NewsPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pradeep News',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Latest News')),
        body: NewsPage(), // Show only NewsPage
      ),
    );
  }
}
