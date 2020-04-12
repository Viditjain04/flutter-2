import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //stateless immutable
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "homepage",
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  //this is a statful-> mitable
  @override
  State<StatefulWidget> createState() =>
      RandomWordsState(); // create a state -> state is function

}

class RandomWordsState extends State<RandomWords> {
  // a state always need a build widget
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion Text'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int index) {
        if (index.isOdd) return Divider();

        final currentIndex = index ~/ 2;
        if (currentIndex >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[currentIndex]);
      },
    ); 
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
