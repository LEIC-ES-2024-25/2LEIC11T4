import 'package:bookenchange/UI/NewContribution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  group('NewcontributionPage Tests', () {
    // Helper function to pump the Newcontribution widget with necessary dependencies
    Future<void> pumpNewContributionPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const Newcontribution(),
        ),
      );
    }

    testWidgets('NewcontributionPage shows the correct title', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);
      expect(find.text('New Contribution'), findsOneWidget);
    });

    testWidgets('NewcontributionPage has a back button', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('NewcontributionPage has photo upload section', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);
      expect(find.text('You can add up to 20 photos'), findsOneWidget);
      expect(find.byIcon(Icons.photo_camera), findsOneWidget);
      expect(find.text('Add Photos'), findsOneWidget);
    });

    testWidgets('NewcontributionPage has form fields', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);
      expect(find.widgetWithText(TextFormField, 'Name of the book'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Description'), findsOneWidget);
      expect(find.widgetWithText(DropdownButtonFormField<String>, 'Area of Study'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'ISBN'), findsOneWidget);
      expect(find.widgetWithText(DropdownButtonFormField<String>, 'Condition'), findsOneWidget);
      expect(find.widgetWithText(DropdownButtonFormField<String>, 'University/College'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Submit Contribution'), findsOneWidget);
    });

    testWidgets('Tapping back button navigates back', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      // You'll likely want to check if you've navigated back to the previous page.
      // For now, we'll just check if the Newcontribution page is no longer there.
      expect(find.byType(Newcontribution), findsNothing);
    });

    testWidgets('Form validation shows errors for empty required fields', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);

      // Ensure the submit button is visible (scroll if necessary)
      await tester.ensureVisible(find.text('Submit Contribution'));
      await tester.pumpAndSettle(); // Wait for any scrolling to complete

      // Tap the submit button without filling any fields
      await tester.tap(find.text('Submit Contribution'));
      await tester.pump(); // Rebuild the UI to show validation errors

      expect(find.text('This field cannot be empty'), findsNWidgets(3)); // For Name and ISBN
      expect(find.text('Please select Area of Study'), findsOneWidget);
      expect(find.text('Please select Condition'), findsOneWidget);
      expect(find.text('Please select University/College'), findsOneWidget);
    });

    testWidgets('Dropdown fields can be selected', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);

      // Open the "Area of Study" dropdown
      await tester.tap(find.widgetWithText(DropdownButtonFormField<String>, 'Area of Study'));
      await tester.pumpAndSettle();
      expect(find.text('Computer Science'), findsOneWidget);

      // Select "Mathematics"
      await tester.tap(find.text('Mathematics').last); // Use .last to be more specific if needed
      await tester.pumpAndSettle();
      expect(find.text('Mathematics'), findsOneWidget); // Check if "Mathematics" is now selected

      // Similarly for "Condition"
      await tester.tap(find.widgetWithText(DropdownButtonFormField<String>, 'Condition'));
      await tester.pumpAndSettle();
      expect(find.text('Used - Good'), findsOneWidget);
      await tester.tap(find.text('Used - Good').last);
      await tester.pumpAndSettle();
      expect(find.text('Used - Good'), findsOneWidget);

      // And for "University/College"
      await tester.tap(find.widgetWithText(DropdownButtonFormField<String>, 'University/College'));
      await tester.pumpAndSettle();
      expect(find.text('FEUP'), findsOneWidget);
      await tester.tap(find.text('FEUP').last);
      await tester.pumpAndSettle();
      expect(find.text('FEUP'), findsOneWidget);
    });

    testWidgets('Text fields can be filled', (WidgetTester tester) async {
      await pumpNewContributionPage(tester);

      // Fill the "Name of the book" field
      await tester.enterText(find.widgetWithText(TextFormField, 'Name of the book'), 'The Great Book');
      expect(find.text('The Great Book'), findsOneWidget);

      // Fill the "Description" field
      await tester.enterText(find.widgetWithText(TextFormField, 'Description'), 'A very interesting book.');
      expect(find.text('A very interesting book.'), findsOneWidget);

      // Fill the "ISBN" field
      await tester.enterText(find.widgetWithText(TextFormField, 'ISBN'), '978-1234567890');
      expect(find.text('978-1234567890'), findsOneWidget);
    });

    // You can add more tests here, for example:
    // - Testing the "Add Photos" button (though the logic is currently empty)
    // - Testing the "Submit Contribution" button (if it triggers any specific action)
  });
}