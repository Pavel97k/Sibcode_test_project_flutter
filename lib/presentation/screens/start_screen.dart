import 'package:flutter/material.dart';
import 'package:test_project_subicode/presentation/screens/authorization_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Запускаем загрузку контента
    loadContent();
  }

  Future<void> loadContent() async {
    // имитация загрузки контента
    await Future.delayed(
      const Duration(seconds: 3),
    );
    // переход на следующую страницу
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthorizationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 34, 19, 39),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://avatars.mds.yandex.net/i?id=07ac11196bffda6f47803a3438a177d4_l-5291460-images-thumbs&n=13'),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
              child: Text(
                'Загрузка...',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LinearProgressIndicator(), // Анимация загрузки
          ],
        ),
      ),
    );
  }
}
