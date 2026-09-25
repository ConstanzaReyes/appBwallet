import 'package:flutter/material.dart';
import '../dev_config.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'document_scan_screen.dart';
import 'initial_screen.dart';
import 'invitation_screen.dart';
import 'liveness_screen.dart';

class VerificationFailedScreen extends StatelessWidget {
  const VerificationFailedScreen({super.key, this.reason = simulatedFailure});
  final VerificationFailure reason;

  Widget _retryScreen() => switch (reason) {
    VerificationFailure.expiredToken ||
    VerificationFailure.invalidToken => const InvitationScreen(),
    VerificationFailure.document => const DocumentScanScreen(),
    VerificationFailure.identity => const LivenessScreen(),
  };

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: 'No fue posible verificar tu identidad',
    children: [
      const Icon(Icons.error_outline, color: Colors.orangeAccent, size: 96),
      const SizedBox(height: 24),
      const Text(
        'La verificación de identidad durante el enrolamiento no se completó.',
      ),
      const SizedBox(height: 16),
      Text(reason.message),
      if (reason == VerificationFailure.expiredToken ||
          reason == VerificationFailure.invalidToken) ...[
        const SizedBox(height: 12),
        const Text(
          'Necesitarás una nueva invitación de tu organización. En este prototipo, reintentar abre otra invitación ficticia.',
        ),
      ],
      const SizedBox(height: 24),
      PrimaryButton(
        label: 'Intentar nuevamente',
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(builder: (_) => _retryScreen()),
        ),
      ),
      TextButton(
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(builder: (_) => const InitialScreen()),
          (_) => false,
        ),
        child: const Text('Volver al inicio'),
      ),
    ],
  );
}
