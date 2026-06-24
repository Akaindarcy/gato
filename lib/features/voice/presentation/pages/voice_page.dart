import 'package:flutter/material.dart';

class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(title: Text('Voice Assistant')),
      body: Center(child: Text('Tap to speak in Kirundi, French, Swahili or English.')),
    );
  }
}
