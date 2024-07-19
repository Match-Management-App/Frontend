import 'package:flutter/material.dart';

class FindPartnerPage extends StatelessWidget {
  const FindPartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('MyWidget'),
      ),
      body: const Center(
        child: Text('MyWidget'),
      ),
    );
  }
}
