import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookenchange/UI/Settings/changePassword.dart';

void main() {
  late MockFirebaseAuth mockAuth;

  setUp(() {
    mockAuth = MockFirebaseAuth(
      mockUser: MockUser(
        isAnonymous: false,
        email: 'test@example.com',
      ),
    );
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const ChangePasswordPage(),
    );
  }

  testWidgets('renders ChangePasswordPage and validates empty fields', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Tap the submit button without entering anything
    final submitButton = find.text('Submit'); // You may want to use S.current.submit
    await tester.tap(submitButton);
    await tester.pump();

    // Ensure validators are triggered
    expect(find.text('Please enter your password'), findsNWidgets(2)); // depends on your S.of(context)
  });

  

  testWidgets('shows error if new password does not match confirmation', (WidgetTester tester) async {
  await tester.pumpWidget(createWidgetUnderTest());

  await tester.enterText(find.widgetWithText(TextFormField, 'Current Password'), 'oldPass123');
  await tester.enterText(find.widgetWithText(TextFormField, 'New Password'), 'newPass123');
  await tester.enterText(find.widgetWithText(TextFormField, 'Confirm New Password'), 'wrongPass123');

  final submitButton = find.text('Submit');
  await tester.tap(submitButton);
  await tester.pump();

  expect(find.text('Passwords do not match'), findsOneWidget);
});

  testWidgets('shows error if new password is same as current', (WidgetTester tester) async {
  await tester.pumpWidget(createWidgetUnderTest());

  await tester.enterText(find.widgetWithText(TextFormField, 'Current Password'), 'samePass');
  await tester.enterText(find.widgetWithText(TextFormField, 'New Password'), 'samePass');
  await tester.enterText(find.widgetWithText(TextFormField, 'Confirm New Password'), 'samePass');

  final submitButton = find.text('Submit');
  await tester.tap(submitButton);
  await tester.pump();

  expect(find.text('New password cannot be the same as the current password'), findsOneWidget); // Replace with localized string if needed
});


testWidgets('toggles visibility of current password field', (WidgetTester tester) async {
  await tester.pumpWidget(createWidgetUnderTest());

  // Locate the current password field
  final currentPasswordField = find.widgetWithText(TextFormField, 'Current Password');

  // Initially, obscureText should be true
  var editableText = tester.widget<EditableText>(
    find.descendant(
      of: currentPasswordField,
      matching: find.byType(EditableText),
    ),
  );
  expect(editableText.obscureText, isTrue);

  // Tap the eye icon to toggle visibility
  final eyeIconButton = find.descendant(
    of: currentPasswordField,
    matching: find.byType(IconButton),
  );
  await tester.tap(eyeIconButton);
  await tester.pump();

  // Re-evaluate after toggle
  editableText = tester.widget<EditableText>(
    find.descendant(
      of: currentPasswordField,
      matching: find.byType(EditableText),
    ),
  );
  expect(editableText.obscureText, isFalse);
});


}
