import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ... Tema Anda
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: Colors.pink,
        appBarTheme: const AppBarTheme(
          color: Colors.pink,
        ),
        cardColor: Colors.lightBlue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: const AppsBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            FeaturedNewsCard(),
            HotNewsCard(),
          ],
        ),
      ),
    );
  }
}

class AppsBar extends StatelessWidget {
  const AppsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Today's News",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Wed, 08 January 2020",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://picsum.photos/seed/picsum/200/300'),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(
                          color: Colors.white,
                          width: 2), // Add white border for better visibility
                    ),
                    // child: Center(
                    //   child: Text(
                    //     '3', // for example, notification count
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      elevation: 0,
    );
  }
}

class FeaturedNewsCard extends StatelessWidget {
  const FeaturedNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String title =
        'Jakarta Flood Caused by 15km-high Rain Clouds: Expert';
    const String datetime = 'Wed, 08 January 2020 | 8 hours ago';
    const String imageUrl =
        'https://picsum.photos/seed/picsum/200/300';

    final double imageWidth = MediaQuery.of(context).size.width -
        16;
    final double imageHeight =
        imageWidth * 2 / 6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Card(
        clipBehavior:
            Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 0,
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    datetime,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotNewsCard extends StatelessWidget {
  const HotNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> newsItems = [
      {
        'imageUrl': 'https://picsum.photos/seed/picsum/200/300',
        'title': 'Central Java\'s Mount Merapi spews hot ash again',
        'datetime': 'Wed, 08 January 2020 | 3 hours ago',
      },
      {
        'imageUrl': 'https://picsum.photos/seed/picsum/200/300',
        'title': 'Central Java\'s Mount Merapi spews hot ash again',
        'datetime': 'Wed, 08 January 2020 | 3 hours ago',
      },
      {
        'imageUrl': 'https://picsum.photos/seed/picsum/200/300',
        'title': 'Central Java\'s Mount Merapi spews hot ash again',
        'datetime': 'Wed, 08 January 2020 | 3 hours ago',
      },
      // {
      //   'imageUrl': 'https://picsum.photos/seed/picsum/200/300',
      //   'title': 'Central Java\'s Mount Merapi spews hot ash again',
      //   'datetime': 'Wed, 08 January 2020 | 3 hours ago',
      // },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Hot News',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 32.0),
          itemCount: newsItems.length,
          itemBuilder: (BuildContext context, int index) {
            return StaticNewsCard(
              title: newsItems[index]['title'],
              datetime: newsItems[index]['datetime'],
              imageUrl: newsItems[index]['imageUrl'],
            );
          },
        ),
      ],
    );
  }
}

class StaticNewsCard extends StatelessWidget {
  final String title;
  final String datetime;
  final String imageUrl;

  const StaticNewsCard({
    super.key,
    required this.title,
    required this.datetime,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    datetime,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

