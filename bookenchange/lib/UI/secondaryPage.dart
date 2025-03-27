import 'package:flutter/material.dart';

class secondaryPage extends StatelessWidget {
  final String? title;

  const secondaryPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Scaffold(
            appBar: AppBar(
                title: Text(title!,
                    style: Theme.of(context).textTheme.titleLarge)),
            body: const Center(
              child: Text('Hello World'),
            ))
        : const Scaffold(
            body: const Center(
            child: Text('Hello World'),
          ));
  }
}
