import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quotes_app/quote.dart';
import 'package:flutter_quotes_app/screens/saved_quotes.dart';
import 'package:http/http.dart' as http;
import '../quotes_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _start = true;
  Quote _quote = Quote(
      quote: "default quote", author: "default author", htmlFormattedQuote: "");

  final QuoteModel _listNotifier = QuoteModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes app"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmarks),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return MyLibraryPage(listNotifier: _listNotifier);
              }));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 219, 179, 255),
              ),
              height: 200,
              child: Center(
                child: _start
                    ? const Text("Start Generating")
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _quote.quote,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "~ ${_quote.author}",
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              ),
              // )
            ),
            ElevatedButton(
              onPressed: fetchNextQuote,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                foregroundColor: Colors.white,
              ),
              child: !_start ? const Text("Next") : const Text("Generate"),
            ),
            SizedBox(
              height: 10,
            ),
            _start
                ? const Text("")
                : ElevatedButton(
                    onPressed: saveQuote,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Save"),
                  ),
          ],
        ),
      ),
    );
  }

  void fetchNextQuote() async {
    Quote qq = Quote(quote: "", author: "", htmlFormattedQuote: "");
    const url = 'https://zenquotes.io/api/random';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body)[0];
      qq.quote = json['q'];
      qq.author = json['a'];
      setState(() {
        _start = false;
        _quote = qq;
      });
    } else {
      throw Exception(
          "Failed to query the model. Status code: ${response.statusCode}");
    }
  }

  void fetchNextQuote2() async {
    Quote qq = Quote(quote: "", author: "", htmlFormattedQuote: "");
    const url = 'http://localhost:3000/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;

      final json = jsonDecode(body);
      qq.quote = json['quote'];
      qq.author = json['author'];

      setState(() {
        _start = false;
        _quote = qq;
      });
    } else {
      throw Exception(
          "Failed to query the model. Status code: ${response.statusCode}");
    }
  }

  void saveQuote() {
    _listNotifier.add(_quote);
  }
}
