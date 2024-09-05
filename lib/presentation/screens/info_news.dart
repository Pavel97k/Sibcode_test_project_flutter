import 'package:flutter/material.dart';
import 'package:test_project_subicode/data/models/news.dart';

class InfoNews extends StatelessWidget {
  final News data;
  const InfoNews({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: Text(data.name ?? ''),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '${data.date?.day}.${data.date?.month}.${data.date?.year}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
              child: Image.network(
                data.image ?? '', // Замените на URL изображения
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                data.name ?? '',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                data.description ?? '',
                style: const TextStyle(fontSize: 16),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
