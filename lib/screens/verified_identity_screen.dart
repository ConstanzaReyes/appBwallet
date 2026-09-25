import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'home_placeholder_screen.dart';

class VerifiedIdentityScreen extends StatelessWidget {
  const VerifiedIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: 'Identidad Verificada',
    children: [
      const Icon(Icons.check_circle, color: Colors.greenAccent, size: 100),
      const SizedBox(height: 24),
      const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Credencial de ejemplo\n\nNombre: Alex Demo\nEmpresa: Biometría Aplicada\nRol: Contratista\nÁreas: Planta C, Bodega A, Casino',
          ),
        ),
      ),
      const SizedBox(height: 24),
      PrimaryButton(
        label: 'Crear mi credencial digital',
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
            builder: (_) =>
                const HomePlaceholderScreen(credentialCreated: true),
          ),
          (_) => false,
        ),
      ),
    ],
  );
}
