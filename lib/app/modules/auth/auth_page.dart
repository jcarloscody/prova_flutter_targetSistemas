import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_theme.dart';
import 'package:prova_flutter/app/core/widgets/prova_flutter_text_field.dart';
import 'package:validatorless/validatorless.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usuarioEC = TextEditingController();
  final _senhaEC = TextEditingController();
  final _usuarioFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      _usuarioFocus.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final right = mediaQuery.width * 0.64;
    final bottom = mediaQuery.height * 0.009;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.height,
          decoration: ProvaFlutterTheme.backGroundSystemDesign,
          child: Form(
            key: _keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaQuery.height * 0.28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: right,
                    bottom: bottom,
                    left: 0,
                  ),
                  child: Text(
                    "Usuário",
                    style: ProvaFlutterTheme.styleText,
                    textAlign: TextAlign.start,
                  ),
                ),
                ProvaFlutterTextField(
                  obscureText: false,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(
                    left: mediaQuery.width * 0.08,
                    right: mediaQuery.width * 0.08,
                  ),
                  focusNode: _usuarioFocus,
                  textEditingController: _usuarioEC,
                  formFieldValidator: Validatorless.multiple([
                    Validatorless.required('Usuário obrigatório!'),
                    Validatorless.max(20, "Permitido apenas 20 caracteres!")
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.height * 0.04,
                    right: right,
                    bottom: bottom,
                    left: 0,
                  ),
                  child: Text(
                    "Senha",
                    style: ProvaFlutterTheme.styleText,
                    textAlign: TextAlign.start,
                  ),
                ),
                ProvaFlutterTextField(
                  obscureText: false,
                  prefixIcon: const Icon(
                    Icons.lock_sharp,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(
                    left: mediaQuery.width * 0.08,
                    right: mediaQuery.width * 0.08,
                  ),
                  textEditingController: _senhaEC,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.05,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    padding: EdgeInsets.only(
                      left: mediaQuery.width * 0.15,
                      right: mediaQuery.width * 0.15,
                      top: mediaQuery.height * 0.02,
                      bottom: mediaQuery.height * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Entrar",
                    style: ProvaFlutterTheme.styleText,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.25,
                ),
                Text(
                  "Política de Privacidade",
                  style: ProvaFlutterTheme.styleText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
