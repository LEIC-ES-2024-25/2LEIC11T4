import 'dart:io';

import 'package:flutter/material.dart';

class Contribution extends StatelessWidget{
  const Contribution({super.key,required this.images,required this.name,required this.condition,required this.institution});
  final List<Url> images;
  final String name;
  final Enum condition;
  final String institution;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [ListView.builder(
          itemCount:images.length ,
          itemBuilder:(context,index) {
           return Image.network(images[index],
            fit: BoxFit.cover,
            width: 50,
            height: 50,
            );
          },
          scrollDirection: Axis.horizontal,

        ),
         Text(name,
              style: Theme.of(context).textTheme.bodySmall),
         Text(condition.name,
            style: Theme.of(context).textTheme.bodySmall),
         Text(institution,
                style: Theme.of(context).textTheme.bodySmall),

        ],
      ),
    );
  }


}
