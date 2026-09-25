import 'package:flutter/material.dart';
import '../dev_config.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'verification_failed_screen.dart';
import 'verified_identity_screen.dart';

class LivenessScreen extends StatefulWidget {
  const LivenessScreen({
    super.key,
    this.simulateSuccess = simulateVerificationSuccess,
  });
  final bool simulateSuccess;

  @override
  State<LivenessScreen> createState() => _LivenessScreenState();
}

class _LivenessScreenState extends State<LivenessScreen> {
  bool _loading = false;

  Future<void> _verify() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(milliseconds: 2500));
    if (!mounted || ModalRoute.of(context)?.isCurrent != true) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (_) => widget.simulateSuccess
            ? const VerifiedIdentityScreen()
            : const VerificationFailedScreen(reason: simulatedFailure),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: 'Prueba de vida',
    children: [
      const Center(
        child: CircleAvatar(
          radius: 90,
          child: Icon(Icons.face_outlined, size: 110),
        ),
      ),
      const SizedBox(height: 24),
      const Text(
        'Centra tu rostro y mira al frente. Esta prueba simula la futura verificación offline; no captura imágenes ni reconoce rostros.',
      ),
      const SizedBox(height: 24),
      LinearProgressIndicator(value: _loading ? null : 0),
      const SizedBox(height: 12),
      Text(_loading ? 'Verificando identidad…' : 'Listo para comenzar'),
      const SizedBox(height: 24),
      PrimaryButton(
        label: 'Completar verificación',
        onPressed: _loading ? null : _verify,
      ),
    ],
  );
}
