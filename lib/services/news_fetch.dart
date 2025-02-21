import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart'; // Import for opening URLs

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  static const String apiKey = "c15a9224b232444da4c95948083c44b0"; // Secure API key
  static const String apiUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey"; // Indian News

  Future<List<dynamic>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['articles'] ?? [];
      } else {
        throw Exception("Failed to load news (${response.statusCode})");
      }
    } catch (e) {
      print("Error fetching news: $e");
      return [];
    }
  }

  void _openNews(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not open news link")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchNews(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No news available"));
        }

        final articles = snapshot.data!;

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            final imageUrl = article['urlToImage'] ?? "";
            final title = article['title'] ?? "No Title";
            final description = article['description'] ?? "No Description";
            final url = article['url'] ?? "";

            return Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  if (url.isNotEmpty) {
                    _openNews(url); // Open full article in browser
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // News Image
                    if (imageUrl.isNotEmpty)
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Image.network(
                          imageUrl,
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 120,
                            height: 100,
                            color: Colors.grey,
                            child: const Icon(Icons.image, color: Colors.white),
                          ),
                        ),
                      ),

                    // News Text
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              description,
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
