import 'package:flutter/material.dart';

class secondaryPage extends StatelessWidget {
  final String? title;
  final Function func;

  const secondaryPage({super.key, this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Scaffold(
            appBar: AppBar(
                title: Text(title!,
                    style: Theme.of(context).textTheme.titleLarge),
                actions:[IconButton(onPressed:func(), icon: Icon(Icons.arrow_back,color: Theme.of(context).colorScheme.secondary,))]
            ),

            )
        : const Scaffold();
  }
}
