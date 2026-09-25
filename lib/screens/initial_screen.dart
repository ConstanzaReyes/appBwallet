import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'login_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: 'Tu identidad digital, contigo',
    children: [
      const Icon(Icons.account_balance_wallet_outlined, size: 110),
      const SizedBox(height: 24),
      const Text(
        'Bienvenido a BioWallet. Un lugar para tu credencial digital y las invitaciones de tu organización.',
      ),
      const SizedBox(height: 32),
      PrimaryButton(
        label: 'Iniciar sesión',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const InicioSesionScreen()),
        ),
      ),
    ],
  );
}
