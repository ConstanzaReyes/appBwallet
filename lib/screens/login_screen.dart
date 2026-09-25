import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'home_placeholder_screen.dart';
import 'invitation_screen.dart';

class InicioSesionScreen extends StatelessWidget {
  const InicioSesionScreen({super.key});

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: 'Iniciar sesión',
    children: [
      const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'Correo electrónico'),
      ),
      const SizedBox(height: 16),
      const TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(labelText: 'Contraseña'),
      ),
      const SizedBox(height: 24),
      PrimaryButton(
        label: 'Iniciar sesión',
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const HomePlaceholderScreen(),
          ),
          (_) => false,
        ),
      ),
      const SizedBox(height: 16),
      const Text(
        'Puedes continuar sin ingresar datos. Esta sesión es simulada.',
      ),
      if (kDebugMode) ...[
        const SizedBox(height: 32),
        const Text(
          'DEBUG · Entrada temporal de pruebas. En producción, el enrolamiento comenzará desde una invitación de la organización.',
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (_) => const InvitationScreen()),
          ),
          child: const Text('Simular invitación'),
        ),
      ],
    ],
  );
}
