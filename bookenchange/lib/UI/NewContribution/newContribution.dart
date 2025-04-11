import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/UI/NewContribution/normalfields.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newContribution extends StatefulWidget {

  @override
  const newContribution({super.key});
  @override
  State<newContribution> createState() => _newContributionState();
}

class _newContributionState extends State<newContribution> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();

  Future<void> photos() async{
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar:AppBar(
    title: Text(
    S.of(context).new_contribution,
    style:
    Theme.of(
    context,
    ).textTheme.titleMedium, // Using theme text styles
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    leading: IconButton(
    icon: Icon(
    Icons.arrow_back,
    color: Theme.of(context).colorScheme.onPrimary,
    ),
    onPressed: () {
    Navigator.pop(context);
    }
    ),
    centerTitle: true,
    ),
    body: Center(child: Column(children: [
      SizedBox(width:400, height: 90,
        child: DecoratedBox(decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary,
            border: Border(bottom: BorderSide(width: 1,color:Theme.of(context).colorScheme.onTertiary))),
            child: Column(children: [
              Padding(padding:EdgeInsets.all(5)  ,child:Text(S.of(context).add_photo,style:Theme.of(context).textTheme.bodyLarge)),
              TextButton.icon(
                onPressed: photos,
                icon:Icon(Icons.photo_camera,color: Theme.of(context).indicatorColor,),
                label: Text(S.of(context).photo,style:Theme.of(context).textTheme.bodyMedium),
              ),
            ],
            ),
        ),
    ),
          normalField(controller: nameController,label:S.of(context).book_tittle, hint: "e.g. Fluent Python, Introduction to Algorithms, ...",),
          normalField(controller:descController,label:S.of(context).description, hint: "e.g. Fluent Python, Introduction to Algorithms, ...",)
          //be redirected to a page where you can add the study area if no there already
          //dropdown with condition
          //be redirected to a page where you can add your college /university if it isn't there already



    ],
    ),
    ),
    ),
    );

  }


  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    isbnController.dispose();
    super.dispose();
  }





}