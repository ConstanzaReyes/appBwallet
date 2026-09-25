import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apprueba/main.dart';
import 'package:apprueba/dev_config.dart';
import 'package:apprueba/screens/document_scan_screen.dart';
import 'package:apprueba/screens/invitation_screen.dart';
import 'package:apprueba/screens/liveness_screen.dart';
import 'package:apprueba/screens/verification_failed_screen.dart';
import 'package:apprueba/theme/app_theme.dart';

Future<void> tapText(WidgetTester tester, String text) async {
  final target = find.text(text).last;
  await tester.ensureVisible(target);
  await tester.tap(target);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('El login simulado llega al home sin enrolar', (tester) async {
    await tester.pumpWidget(const BioWalletApp());
    await tapText(tester, 'Iniciar sesión');
    expect(find.text('Simular invitación'), findsOneWidget);
    await tapText(tester, 'Iniciar sesión');
    expect(find.textContaining('Sesión simulada iniciada'), findsOneWidget);
    await tapText(tester, 'Volver al inicio');
    expect(find.text('Tu identidad digital, contigo'), findsOneWidget);
  });

  testWidgets('Invitación, documento, éxito y creación de credencial', (
    tester,
  ) async {
    await tester.pumpWidget(const BioWalletApp());
    await tapText(tester, 'Iniciar sesión');
    await tapText(tester, 'Simular invitación');
    await tester.ensureVisible(find.text('Comenzar enrolamiento'));
    await tester.tap(find.text('Comenzar enrolamiento'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Validando tu invitación'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Escanear documento').last);
    await tester.tap(find.text('Escanear documento').last);
    await tester.pump();
    expect(find.text('Simulando escaneo…'), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Completar verificación'));
    await tester.tap(find.text('Completar verificación'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.text('Identidad Verificada'), findsOneWidget);
    await tapText(tester, 'Crear mi credencial digital');
    expect(find.text('Credencial digital creada'), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });

  testWidgets('Rechazo de prueba de vida y vuelta al inicio', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: const LivenessScreen(simulateSuccess: false),
      ),
    );
    await tester.ensureVisible(find.text('Completar verificación'));
    await tester.tap(find.text('Completar verificación'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.text('No fue posible verificar tu identidad'), findsOneWidget);
    await tapText(tester, 'Volver al inicio');
    expect(find.text('Tu identidad digital, contigo'), findsOneWidget);
  });

  for (final reason in VerificationFailure.values) {
    testWidgets('Reintento correspondiente para ${reason.name}', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.dark,
          home: VerificationFailedScreen(reason: reason),
        ),
      );
      expect(find.text(reason.message), findsOneWidget);
      await tapText(tester, 'Intentar nuevamente');
      final expected = switch (reason) {
        VerificationFailure.expiredToken ||
        VerificationFailure.invalidToken => find.byType(InvitationScreen),
        VerificationFailure.document => find.byType(DocumentScanScreen),
        VerificationFailure.identity => find.byType(LivenessScreen),
      };
      expect(expected, findsOneWidget);
    });
  }

  testWidgets('Salir durante validación no navega después de la espera', (
    tester,
  ) async {
    await tester.pumpWidget(const BioWalletApp());
    await tapText(tester, 'Iniciar sesión');
    await tapText(tester, 'Simular invitación');
    await tester.ensureVisible(find.text('Comenzar enrolamiento'));
    await tester.tap(find.text('Comenzar enrolamiento'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.tap(find.byType(BackButton).last);
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.byType(InvitationScreen), findsOneWidget);
    expect(find.byType(DocumentScanScreen), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
