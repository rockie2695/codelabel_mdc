import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 💡 提示：當你用 Navigator.push 點過來時，
        // Flutter 預設會自動在 AppBar 左側幫你加上「返回箭頭」。
        // 如果你寫了下面的 leading，它會把預設的返回箭頭覆蓋掉。
        leading: IconButton(
          icon: const Icon(Icons.menu, semanticLabel: 'menu'),
          tooltip: 'Navigation menu',
          onPressed: () {
            print('Menu button');
          },
        ),
        title: const Text('Example title'),
        actions: [
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'search'),
            tooltip: 'Search',
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune, semanticLabel: 'filter'),
            tooltip: 'Filter',
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(10),
      ),
      // Center(child: Text('Welcome, $username!')),
    );
  }

  List<Card> _buildGridCards(int count) {
    return List.generate(count, (index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Container(
                color: Colors.blue.withValues(alpha: 0.1),
                child: Icon(Icons.diamond_outlined, size: 40.0),
              ), //icon would not follow the aspect ratio, so it will be centered in the box
              // Image.asset('assets/diamond.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Title'),
                  const SizedBox(height: 8.0),
                  Text('Secondary Text'),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
