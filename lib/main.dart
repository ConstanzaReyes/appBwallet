import 'package:flutter/material.dart';
import 'screens/initial_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const BioWalletApp());

class BioWalletApp extends StatelessWidget {
  const BioWalletApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BioWallet',
    theme: AppTheme.dark,
    home: const InitialScreen(),
  );
}
