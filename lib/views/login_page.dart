import 'package:flutter/material.dart';
import 'package:mobxtest/views/home_page.dart';
import 'package:mobxtest/widgets/background_widget.dart';
import 'package:mobxtest/widgets/privacy_policy.dart';
import 'package:mobxtest/widgets/text_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  bool isUserValid = false;
  bool isPassValid = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                controller: usuarioController,
                labelText: 'Usuário',
                textInputAction: TextInputAction.next,
                onChanged: usuarioChanged,
              ),
              SizedBox(height: 48.0),
              TextInputField(
                controller: senhaController,
                labelText: 'Senha',
                textInputAction: TextInputAction.done,
                isPasswordField: true,
                onChanged: senhaChanged,
              ),
              SizedBox(height: 48.0),
              SizedBox(
                width: 150.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(12.0),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: isUserValid && isPassValid ? loginUser : null,
                  child: Text('Entrar'),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: PrivacyPolicy(),
      ),
    );
  }

  void usuarioChanged(String value) => setState(() => isUserValid =
      value.isNotEmpty && !value.endsWith(' ') && value.length <= 20);

  void senhaChanged(String value) =>
      setState(() => isPassValid = value.length >= 2 &&
          value.isNotEmpty &&
          !value.endsWith(' ') &&
          value.length <= 20 &&
          RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value));

  void loginUser() {
    if (isUserValid && isPassValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showErrorDialog(
        title: 'Campos inválidos',
        contentText:
            'Os campos não estão preenchidos corretamente. Verifique e tente novamente.',
      );
    }
  }

  void showErrorDialog({
    required String title,
    required String contentText,
  }) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(contentText),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text('Ok'),
            ),
          ],
        ),
      );
}
