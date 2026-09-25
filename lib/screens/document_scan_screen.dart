import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/prototype_scaffold.dart';
import 'liveness_screen.dart';

class DocumentScanScreen extends StatefulWidget {
  const DocumentScanScreen({super.key});

  @override
  State<DocumentScanScreen> createState() => _DocumentScanScreenState();
}

class _DocumentScanScreenState extends State<DocumentScanScreen> {
  bool _loading = false;

  Future<void> _scan() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted || ModalRoute.of(context)?.isCurrent != true) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (_) => const LivenessScreen()),
    );
  }

  @override
  Widget build(BuildContext context) => PrototypeScaffold(
    title: 'Escanear documento',
    children: [
      const Card(
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.badge_outlined, size: 90),
              SizedBox(height: 12),
              Text('Espacio para la cámara · Simulación'),
            ],
          ),
        ),
      ),
      const SizedBox(height: 24),
      const Text(
        'Coloca tu documento dentro del marco y procura que todos los datos sean legibles. En este prototipo no se utiliza la cámara.',
      ),
      const SizedBox(height: 24),
      if (_loading) ...[
        const Center(child: CircularProgressIndicator()),
        const SizedBox(height: 16),
      ],
      PrimaryButton(
        label: _loading ? 'Simulando escaneo…' : 'Escanear documento',
        onPressed: _loading ? null : _scan,
      ),
    ],
  );
}
