import 'package:flutter/material.dart';
import '../widgets/prototype_scaffold.dart';
import 'document_scan_screen.dart';

class ValidateInvitationScreen extends StatefulWidget {
  const ValidateInvitationScreen({super.key});

  @override
  State<ValidateInvitationScreen> createState() =>
      _ValidateInvitationScreenState();
}

class _ValidateInvitationScreenState extends State<ValidateInvitationScreen> {
  @override
  void initState() {
    super.initState();
    _validate();
  }

  Future<void> _validate() async {
    await Future<void>.delayed(const Duration(milliseconds: 2500));
    if (!mounted || ModalRoute.of(context)?.isCurrent != true) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (_) => const DocumentScanScreen()),
    );
  }

  @override
  Widget build(BuildContext context) => const PrototypeScaffold(
    title: 'Validando tu invitación',
    children: [
      Center(child: CircularProgressIndicator()),
      SizedBox(height: 24),
      Text(
        'Simulando la validación de la invitación y los permisos de tu organización.',
      ),
    ],
  );
}
