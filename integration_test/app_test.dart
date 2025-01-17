// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration/home_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("E2E test", ()  {

   testWidgets("Verify login with email and password", (tester) async{
     app.main();
     await tester.pumpAndSettle();

     await tester.enterText((find.byKey(const Key("email_controller"))), "email");
     await tester.enterText((find.byKey(const Key("password_controller"))), "password");
     await tester.tap(find.byType(ElevatedButton));

     await tester.pumpAndSettle();

     expect(find.byType(HomeScreen), findsOneWidget);
 
   });
       
  });
}