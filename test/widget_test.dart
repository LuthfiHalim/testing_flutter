// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:flutter_statefulwidget_loginpage_luthfi/main.dart';
import 'package:flutter_statefulwidget_loginpage_luthfi/box_widget.dart';
Icon iconbaru = Icon(Icons.calendar_today);

class Mine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Box(status: 'test',jumlah: 10,icon: iconbaru,warna: Colors.black));
  }
  
}

void main() {
  testWidgets('test all widget', (WidgetTester tester) async {
    await tester.pumpWidget(Mine());

    final titleFinder = find.text('test');
    expect(titleFinder, findsOneWidget);
    expect(find.byIcon(Icons.calendar_today), findsOneWidget);




    // Build our app and trigger a frame.


    // Verify that our counter starts at 0.
   // expect(find.byIcon(Icons.calendar_today), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();

    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
  });
}
