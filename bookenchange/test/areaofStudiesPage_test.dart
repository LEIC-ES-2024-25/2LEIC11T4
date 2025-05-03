import 'package:bookenchange/UI/NewContribution/areaofStudiesPage.dart';
import 'package:bookenchange/UI/NewContribution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bookenchange/generated/l10n.dart'; // Import your localization class
import 'package:flutter_localizations/flutter_localizations.dart'; // Import localization delegates

void main() {
  group('AreaOfStudiesPage Tests', () {
    // Helper function to pump the AreaOfStudiesPage widget with necessary dependencies
    Future<void> pumpAreaOfStudiesPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            S.delegate, // Add your localization delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales:
              S.delegate.supportedLocales, // Add supported locales
          home: const AreaOfStudiesPage(),
        ),
      );
    }

    // Helper function to pump the NewContribution widget with necessary dependencies
    Future<void> pumpNewContributionPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            S.delegate, // Add your localization delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales:
              S.delegate.supportedLocales, // Add supported locales
          home: const Newcontribution(),
        ),
      );
    }

    testWidgets('AreaOfStudiesPage shows the correct title', (
      WidgetTester tester,
    ) async {
      await pumpAreaOfStudiesPage(tester);
      expect(find.text('Select Area of Study'), findsOneWidget);
    });

    testWidgets('AreaOfStudiesPage has a back button', (
      WidgetTester tester,
    ) async {
      await pumpAreaOfStudiesPage(tester);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('AreaOfStudiesPage displays list of study areas', (
      WidgetTester tester,
    ) async {
      await pumpAreaOfStudiesPage(tester);
      expect(find.text('Computer Science'), findsOneWidget);
      expect(find.text('Mathematics'), findsOneWidget);
      expect(
        find.byType(ListTile),
        findsNWidgets(7),
      ); // Assuming you have 7 initial areas
    });

    testWidgets('AreaOfStudiesPage has a search bar', (
      WidgetTester tester,
    ) async {
      await pumpAreaOfStudiesPage(tester);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.text('Search area...'), findsOneWidget);
    });

    testWidgets('Searching updates the list of areas', (
      WidgetTester tester,
    ) async {
      await pumpAreaOfStudiesPage(tester);

      await tester.enterText(find.byType(TextField), 'comp');
      await tester.pump();

      expect(find.text('Computer Science'), findsOneWidget);
      expect(find.text('Mathematics'), findsNothing);
    });

    testWidgets('Tapping a study area navigates to NewContributionPage', (
      WidgetTester tester,
    ) async {
      await pumpAreaOfStudiesPage(tester);

      await tester.tap(find.text('Computer Science'));
      await tester.pumpAndSettle();

      // Now we need to pump the Newcontribution page with the localization setup
      await pumpNewContributionPage(tester);
      expect(find.byType(Newcontribution), findsOneWidget);
      // You might want to add more specific checks on the NewContribution page title, etc.
      expect(
        find.text('Settings'),
        findsOneWidget,
      ); // Assuming 'Settings' is a localized string
    });

    testWidgets(
      'Tapping back button navigates to NewContributionPage (as per your code)',
      (WidgetTester tester) async {
        await pumpAreaOfStudiesPage(tester);

        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        // Again, pump the Newcontribution page with localization
        await pumpNewContributionPage(tester);
        expect(find.byType(Newcontribution), findsOneWidget);
        expect(
          find.text('Settings'),
          findsOneWidget,
        ); // Assuming 'Settings' is a localized string
      },
    );
  });
}
