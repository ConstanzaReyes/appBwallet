import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
void main() {
  runApp(const BioWalletApp());
}

class BioWalletApp extends StatelessWidget {
  const BioWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BioWallet',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Arial'),
      home: const InvitationScreen(),
    );
  }
}

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({super.key});

  static const Color orange = Color(0xFFF56A16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header BioWallet
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              color: orange,
              child: const Row(
                children: [
                  Icon(Icons.fingerprint, color: Colors.black, size: 30),
                  SizedBox(width: 8),
                  Text(
                    'BioWallet',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.mark_email_unread_outlined,
                      size: 105,
                      color: Colors.black87,
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Tienes una invitación para\nunirte a BioWallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'Tu organización te ha invitado a crear tu identidad '
                      'digital para acceder de forma segura.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, height: 1.4),
                    ),

                    const SizedBox(height: 32),

                    const InfoBox(label: 'Empresa', value: 'Baplicada'),

                    const SizedBox(height: 10),

                    const InfoBox(label: 'Enviada por', value: 'RRHH'),

                    const SizedBox(height: 10),

                    const InfoBox(label: 'Válida hasta', value: '30 nov 2026'),

                    const SizedBox(height: 42),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ValidatingInvitationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                        child: const Text(
                          'Comenzar enrolamiento',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                        child: const Text(
                          'No soy yo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Navegación inferior del mockup
            BottomNavigationBar(
              currentIndex: 0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black54,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner),
                  label: 'Escanear',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined),
                  label: 'Lugares',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Yo',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const InfoBox({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: InvitationScreen.orange),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class DocumentScanScreen extends StatelessWidget {
  const DocumentScanScreen({super.key});

  static const Color orange = Color(0xFFF56A16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              color: orange,
              child: const Row(
                children: [
                  Icon(Icons.fingerprint, color: Colors.black, size: 30),
                  SizedBox(width: 8),
                  Text(
                    'BioWallet',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 38,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Imagen representativa del escaneo
                    Container(
                      width: 210,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFF101A28),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.badge_outlined,
                            size: 100,
                            color: Colors.white,
                          ),

                          // Línea de escaneo
                          Container(width: 150, height: 3, color: Colors.red),

                          // Esquinas
                          Positioned(top: 15, left: 15, child: _corner()),
                          Positioned(
                            top: 15,
                            right: 15,
                            child: Transform.rotate(
                              angle: 1.57,
                              child: _corner(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Escanear Documento',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Coloca tu documento de identidad o pasaporte '
                        'frente a la cámara.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),

                    const SizedBox(height: 60),

                    SizedBox(
                      width: 170,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final result = await FlutterDocScanner()
                                .getScannedDocumentAsImages(page: 2);

                            debugPrint('Resultado scanner: $result');
                          } on PlatformException catch (e) {
                            debugPrint('Error scanner: ${e.message}');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: const Text(
                          'Abrir cámara',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _corner() {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white, width: 5),
          left: BorderSide(color: Colors.white, width: 5),
        ),
      ),
    );
  }
}

class ValidatingInvitationScreen extends StatefulWidget {
  const ValidatingInvitationScreen({super.key});

  @override
  State<ValidatingInvitationScreen> createState() =>
      _ValidatingInvitationScreenState();
}

class _ValidatingInvitationScreenState
    extends State<ValidatingInvitationScreen> {
  static const Color orange = Color(0xFFF56A16);

  @override
  void initState() {
    super.initState();

    // Simula la validación de la invitación durante 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DocumentScanScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              color: orange,
              child: const Row(
                children: [
                  Icon(Icons.fingerprint, color: Colors.black, size: 30),
                  SizedBox(width: 8),
                  Text(
                    'BioWallet',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 50,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),

                    const CircularProgressIndicator(color: orange),

                    const SizedBox(height: 35),

                    const Text(
                      'Validando tu invitación',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'Estamos verificando la información '
                      'con tu organización.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),

                    const SizedBox(height: 50),

                    _validationItem(
                      Icons.verified_user_outlined,
                      'Validando invitación',
                    ),

                    const SizedBox(height: 20),

                    _validationItem(
                      Icons.business_outlined,
                      'Verificando organización',
                    ),

                    const SizedBox(height: 20),

                    _validationItem(
                      Icons.security_outlined,
                      'Comprobando permisos',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _validationItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: orange, size: 25),
        const SizedBox(width: 15),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
