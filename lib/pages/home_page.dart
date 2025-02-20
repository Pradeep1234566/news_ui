import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                const Text('Pradeep News',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child:
                const Text('Politics', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Sports', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Movies', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {},
            child:
                const Text('Technology', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
