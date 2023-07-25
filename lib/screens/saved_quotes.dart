import 'package:flutter/material.dart';
import 'package:flutter_quotes_app/quote.dart';
import 'package:flutter_quotes_app/widgets/quote_container.dart';
import '../quotes_model.dart';

class MyLibraryPage extends StatefulWidget {
  final QuoteModel listNotifier;
  const MyLibraryPage({super.key, required this.listNotifier});
  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Saved quotes"),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: widget.listNotifier,
          builder: (BuildContext context, Widget? child) {
            final List<Quote> quotes = widget.listNotifier.quotes;
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  return QuoteContainer(
                    index: index,
                    quote: quotes[index],
                    listNotifier: widget.listNotifier,
                  );
                });
          },
        ),
      ),
    );
  }

  removeItem(int index) {
    widget.listNotifier.remove(index);
  }
}
