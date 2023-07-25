import 'package:flutter/material.dart';
import '../quote.dart';
import '../quotes_model.dart';

class QuoteContainer extends StatefulWidget {
  final int index;
  final Quote quote;
  final QuoteModel listNotifier;
  const QuoteContainer({
    super.key,
    required this.index,
    required this.quote,
    required this.listNotifier,
  });

  @override
  State<QuoteContainer> createState() => _QuoteContainerState();
}

class _QuoteContainerState extends State<QuoteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.minPositive,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
        minHeight: 200,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 219, 179, 255),
      ),
      // height: 300,

      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.quote.quote,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "~ ${widget.quote.author}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            iconSize: 25,
            icon: const Icon(Icons.delete),
            color: Colors.deepPurple,
            onPressed: () {
              removeItem(widget.index);
            },
          )
        ],
      ),
    );
  }

  removeItem(int index) {
    widget.listNotifier.remove(index);
  }
}
