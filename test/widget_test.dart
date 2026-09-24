import 'package:flutter_test/flutter_test.dart';
import 'package:apprueba/main.dart';

void main() {
  testWidgets('Muestra invitación de BioWallet', (WidgetTester tester) async {
    await tester.pumpWidget(const BioWalletApp());

    expect(find.text('BioWallet'), findsOneWidget);
    expect(find.text('Comenzar enrolamiento'), findsOneWidget);
    expect(find.text('No soy yo'), findsOneWidget);
  });
}