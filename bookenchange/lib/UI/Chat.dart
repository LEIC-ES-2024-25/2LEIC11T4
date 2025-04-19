import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class chatPage extends StatelessWidget {
  const chatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).chat,
          style:
              Theme.of(
                context,
              ).textTheme.titleMedium, // Using theme text styles
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context); // Goes back to HomePage
          },
        ),
      ),
      body: Center(),
    );
  }
}

class multiplechats extends StatefulWidget {
  const multiplechats({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
