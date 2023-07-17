import 'package:flutter/material.dart';

class NewsFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? PortraitNewsFeed()
                : LandscapeNewsFeed();
          },
        ),
      ),
    );
  }
}

class PortraitNewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Center(
          child: Container(
            width: 100, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            child: Image.network(
              articles[index].thumbnailUrl,
            ),
          ),
        );
      },
    );
  }
}

class LandscapeNewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 16 / 9, // Adjust the aspect ratio as needed
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Container(
              width: 400, // Adjust the width as needed
              height: 400, // Adjust the height as needed
              child: Image.network(
                articles[index].thumbnailUrl,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Article {
  final String thumbnailUrl;
  final String title;
  final String description;

  Article({required this.thumbnailUrl, required this.title, required this.description});
}

List<Article> articles = [
  Article(
    thumbnailUrl: 'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
    title: 'Article 1',
    description: 'Description of article 1',
  ),
  Article(
    thumbnailUrl: 'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
    title: 'Article 2',
    description: 'Description of article 2',
  ),
  Article(
    thumbnailUrl: 'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
    title: 'Article 3',
    description: 'Description of article 3',
  ),
  // Add more articles as needed
];

void main() {
  runApp(NewsFeedApp());
}
