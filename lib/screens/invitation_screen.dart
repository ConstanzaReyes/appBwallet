import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'initial_screen.dart';
import 'validate_invitation_screen.dart';

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: 'Tienes una invitación',
    children: [
      const Text('Tu organización te invita a crear tu identidad digital.'),
      const SizedBox(height: 20),
      const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Empresa: Biometría Aplicada\n\nEnviada por: RRHH\n\nRol: Contratista\n\nÁrea de acceso: Planta C, Bodega A, Casino\n\nVálida hasta: 30 nov 2026',
          ),
        ),
      ),
      const SizedBox(height: 24),
      PrimaryButton(
        label: 'Comenzar enrolamiento',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const ValidateInvitationScreen(),
          ),
        ),
      ),
      TextButton(
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(builder: (_) => const InitialScreen()),
          (_) => false,
        ),
        child: const Text('No soy yo'),
      ),
    ],
  );
}
