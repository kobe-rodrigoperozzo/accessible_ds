// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:accessible_ds/accessible_ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Widgets should be accessible', (WidgetTester tester) async {
    //
    final SemanticsHandle handle = tester.ensureSemantics();

    // Build the Widget
    final widget = DsIconButton(
      icon: Icons.shopping_cart,
      onPressed: () {},
      backgroundColor: DsColors.primary,
      iconColor: DsColors.onPrimary,
      alternativeText: 'Ir para o carrinho.',
    );

    // Trigger a frame.
    await tester.pumpWidget(widget);

    // Checks that tappable nodes have a minimum size of 48 by 48 pixels
// for Android.
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

// Checks that tappable nodes have a minimum size of 44 by 44 pixels
// for iOS.
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));

// Checks that touch targets with a tap or long press action are labeled.
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));

// Checks whether semantic nodes meet the minimum text contrast levels.
// The recommended text contrast is 3:1 for larger text
// (18 point and above regular).
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    handle.dispose();
  });
}
