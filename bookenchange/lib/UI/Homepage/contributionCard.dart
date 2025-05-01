import 'package:flutter/material.dart';

enum ContributionCondition {
  newCondition,
  usedGood,
  usedAcceptable,
  damaged,
}

class Contribution extends StatelessWidget {
  const Contribution({
    super.key,
    required this.images,
    required this.name,
    required this.condition,
    required this.institution,
  });
  final List<String> images;
  final String name;
  final ContributionCondition condition; // Using the new Enum
  final String institution;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(name, style: Theme.of(context).textTheme.bodyMedium),
          Text(_getConditionDisplayName(condition), style: Theme.of(context).textTheme.bodySmall),
          Text(institution, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  // Helper function to display the enum value nicely
  String _getConditionDisplayName(ContributionCondition condition) {
    switch (condition) {
      case ContributionCondition.newCondition:
        return 'New';
      case ContributionCondition.usedGood:
        return 'Used - Good';
      case ContributionCondition.usedAcceptable:
        return 'Used - Acceptable';
      case ContributionCondition.damaged:
        return 'Damaged';
      default:
        return 'Unknown Condition';
    }
  }
}