import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_theme.dart';
import 'package:prova_flutter/app/core/widgets/prova_flutter_text_field_form.dart';
import 'package:prova_flutter/app/repositories/auth/auth_repository.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/iu/mensagens.dart';
import '../../core/navigator/prova_flutter_navigator.dart';

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
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    final paddingRightText = width * 0.64;
    final paddingBottomText = height * 0.009;
    final paddingTextFormFieldLeft = width * 0.08;
    final paddingTextFormFieldRight = width * 0.08;
    final authService = context.read<AuthRepository>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: ProvaFlutterTheme.backGroundSystemDesign,
          child: Form(
            key: _keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: paddingRightText,
                    bottom: paddingBottomText,
                    left: 0,
                  ),
                  child: Text(
                    "Usuário",
                    style: ProvaFlutterTheme.styleText,
                    textAlign: TextAlign.start,
                  ),
                ),
                ProvaFlutterTextFieldForm(
                  limiteCaracteres: 20,
                  obscureText: false,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(
                    left: paddingTextFormFieldLeft,
                    right: paddingTextFormFieldRight,
                  ),
                  focusNode: _usuarioFocus,
                  textEditingController: _usuarioEC,
                  formFieldValidator: Validatorless.multiple([
                    Validatorless.required('Usuário obrigatório!'),
                    Validatorless.min(2, "Deve conter no mínimo 2 caracteres"),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.04,
                    right: paddingRightText,
                    bottom: paddingBottomText,
                    left: 0,
                  ),
                  child: Text(
                    "Senha",
                    style: ProvaFlutterTheme.styleText,
                    textAlign: TextAlign.start,
                  ),
                ),
                ProvaFlutterTextFieldForm(
                  limiteCaracteres: 20,
                  obscureText: true,
                  prefixIcon: const Icon(
                    Icons.lock_sharp,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(
                    left: paddingTextFormFieldLeft,
                    right: paddingTextFormFieldRight,
                  ),
                  textEditingController: _senhaEC,
                  formFieldValidator: Validatorless.multiple([
                    Validatorless.regex(RegExp(r'^[a-zA-Z0-9]+$'),
                        "Permitido apenas letras e números"),
                    Validatorless.required('Senha obrigatória!'),
                    Validatorless.min(2, "Deve conter no mínimo 2 caracteres"),
                  ]),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                ElevatedButton(
                  style: ProvaFlutterTheme.buttonStyle.copyWith(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.only(
                        left: width * 0.15,
                        right: width * 0.15,
                        top: height * 0.02,
                        bottom: height * 0.02,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_usuarioEC.text.isEmpty || _usuarioEC.text.isEmpty) {
                      _usuarioFocus.requestFocus();
                      Messages.of(context)
                          .showInfo("Os campos não podem estar vázios!");
                    } else {
                      final formVal = _keyForm.currentState?.validate();
                      if (formVal ?? false) {
                        if (await authService.auth(
                                usuario: _usuarioEC.text,
                                senha: _senhaEC.text) !=
                            null) {
                          ProvaFlutterNavigator.to.pushNamed("/home");
                        }
                      }
                    }
                  },
                  child: Text(
                    "Entrar",
                    style: ProvaFlutterTheme.styleText,
                  ),
                ),
                SizedBox(
                  height: height * 0.25,
                ),
                InkWell(
                  onTap: () async {
                    var url = Uri.parse("https://www.google.com/");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  child: Text(
                    "Política de Privacidade",
                    style: ProvaFlutterTheme.styleText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
