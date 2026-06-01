import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mr_and_mrs_genz_outfit/main.dart';

void main() {

  testWidgets(
    'App loads successfully',
    (WidgetTester tester) async {

      /// LOAD APP
      await tester.pumpWidget(
        const GenZOutfitApp(),
      );

      /// CHECK APP TITLE
      expect(
        find.text('Mr & Mrs Gen Z Outfit'),
        findsWidgets,
      );

      /// CHECK MATERIAL APP
      expect(
        find.byType(MaterialApp),
        findsOneWidget,
      );
    },
  );
}