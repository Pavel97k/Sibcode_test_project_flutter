import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_project_subicode/data/models/accaunt.dart';
import 'package:test_project_subicode/domain/repositories/accaunt_rep.dart';
import 'package:test_project_subicode/presentation/screens/news_list.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  AccauntRep repository = AccauntRep();
  @override
  void initState() {
    super.initState();
    numberPhone = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    numberPhone.dispose();
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  late TextEditingController numberPhone;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Авторизироваться',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: numberPhone,
                decoration: const InputDecoration(
                  labelText: 'Номер телефона (обязательно)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                inputFormatters: [maskFormatter],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(LinearBorder()),
                      ),
                      onPressed: () async {
                        if (numberPhone.text.length == 18) {
                          bool accaunt = await repository
                              .authorizationAccaunt(numberPhone.text);
                          if (accaunt == true) {
                            // Переход на новую страницу, если аккаунт найден
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsList(
                                      accaunt: Account(
                                          numberPhone: numberPhone.text))),
                            );
                          } else {
                            // Обработка случая, когда аккаунт не найден
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Аккаунт не найден')),
                            );
                          }
                        } else {
                          setState(() {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // Пользователь должен нажать кнопку, чтобы закрыть диалог
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Заголовок диалога'),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Ошибка'),
                                        Text('Неверный номер телефона'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Закрыть'),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Закрыть диалог
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        }
                      },
                      child: const Text('Вход'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
