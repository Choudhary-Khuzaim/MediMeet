import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medimeet/main.dart';
import 'package:medimeet/providers/theme_provider.dart';
import 'package:medimeet/providers/language_provider.dart';
import 'package:medimeet/providers/auth_provider.dart';
import 'package:medimeet/providers/appointment_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MedimeetApp());

    // Verify that the splash screen shows up initially
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
