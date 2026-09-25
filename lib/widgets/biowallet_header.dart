import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BioWalletHeader extends StatelessWidget {
  const BioWalletHeader({super.key});

  @override
  Widget build(BuildContext context) => const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.fingerprint, color: AppTheme.orange, size: 32),
      SizedBox(width: 10),
      Text('BioWallet', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}
