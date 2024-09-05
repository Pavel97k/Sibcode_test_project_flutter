import 'package:flutter/material.dart';
import 'package:test_project_subicode/data/models/accaunt.dart';
import 'package:test_project_subicode/presentation/screens/authorization_screen.dart';

class Profile extends StatelessWidget {
  final Account account;
  const Profile({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Профиль'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Номер телефона',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: TextEditingController(text: account.numberPhone),
                readOnly: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthorizationScreen()),
                    (Route<dynamic> route) => false,
                  ),
                  child: const Text('Выход'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
