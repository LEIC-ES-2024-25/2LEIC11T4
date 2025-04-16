import 'package:bookenchange/UI/Settings/settingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  group('SettingsPage Tests', () {
    // Helper function to pump the SettingsPage widget with necessary dependencies
    Future<void> pumpSettingsPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const SettingsPage(),
        ),
      );
    }

    testWidgets('SettingsPage shows the correct title', (
      WidgetTester tester,
    ) async {
      await pumpSettingsPage(tester);

      // Find the title text on the app bar
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('SettingsPage has a back button', (WidgetTester tester) async {
      await pumpSettingsPage(tester);

      // Find the back button (it's usually an Icon with Icons.arrow_back)
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('SettingsPage shows profile section', (
      WidgetTester tester,
    ) async {
      await pumpSettingsPage(tester);

      // Find the profile circle avatar
      expect(
        find.byType(CircleAvatar),
        findsNWidgets(2),
      ); // One for the main profile, one for the edit icon
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
    });

    testWidgets('SettingsPage shows settings options', (
      WidgetTester tester,
    ) async {
      await pumpSettingsPage(tester);

      // Check if the settings option text is present
      expect(find.text('previous'), findsOneWidget);
      expect(find.text('Change Password'), findsOneWidget);
      expect(find.text('Help'), findsOneWidget);
      expect(find.text('Log out'), findsOneWidget);

      // Check if the icons for the settings options are present
      expect(find.byIcon(Icons.chat_bubble_outline), findsOneWidget);
      expect(find.byIcon(Icons.lock_outline), findsOneWidget);
      expect(find.byIcon(Icons.help_outline), findsOneWidget);
      expect(find.byIcon(Icons.logout), findsOneWidget);
      expect(
        find.byIcon(Icons.arrow_forward_ios),
        findsNWidgets(4),
      ); // Trailing icons
    });

    testWidgets('Tapping back button navigates back', (
      WidgetTester tester,
    ) async {
      await pumpSettingsPage(tester);

      // Tap the back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle(); // Wait for navigation to complete

      // You'd need to know what the previous route was to assert correctly.
      // For now, we can just check if we are no longer on the SettingsPage.
      expect(find.byType(SettingsPage), findsNothing);
    });
  });
}
