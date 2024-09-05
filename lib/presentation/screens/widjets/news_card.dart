import 'package:flutter/material.dart';
import 'package:test_project_subicode/data/models/news.dart';

class NewsCard extends StatelessWidget {
  final News data;

  const NewsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${data.date?.day}.${data.date?.month}.${data.date?.year}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.network(
                data.image ?? '', // Замените на URL изображения
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8.0),
              Text(
                data.name ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
