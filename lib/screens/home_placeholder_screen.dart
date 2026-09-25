import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'initial_screen.dart';

class HomePlaceholderScreen extends StatelessWidget {
  const HomePlaceholderScreen({super.key, this.credentialCreated = false});
  final bool credentialCreated;

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: credentialCreated ? 'Credencial digital creada' : 'Inicio',
    children: [
      Icon(
        credentialCreated ? Icons.badge_outlined : Icons.home_outlined,
        size: 96,
      ),
      const SizedBox(height: 24),
      Text(
        credentialCreated
            ? 'Tu credencial de ejemplo está lista.\n\nAlex Demo · Contratista\nBiometría Aplicada\nPlanta C, Bodega A, Casino'
            : 'Sesión simulada iniciada. Aquí estará tu billetera digital.',
      ),
      const SizedBox(height: 16),
      const Text(
        'Los datos solo existen durante esta navegación y no se guardan.',
      ),
      const SizedBox(height: 32),
      PrimaryButton(
        label: 'Volver al inicio',
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(builder: (_) => const InitialScreen()),
          (_) => false,
        ),
      ),
    ],
  );
}
