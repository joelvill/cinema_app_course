import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = [
      'Cargando Peliculas...',
      'Cargando datos...',
      'Preparando la presentación...',
      'Preparando la aplicación...',
      'Esto esta tardando mas de lo esperado...',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (int i) {
      return messages[i];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere un momento...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data);
            },
          ),
        ],
      ),
    );
  }
}
