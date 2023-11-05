import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_theme.dart';
import 'package:prova_flutter/app/core/widgets/prova_flutter_text_field.dart';
import 'package:prova_flutter/app/modules/home/widgets/item_box_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      focusNode.requestFocus();
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          focusNode.unfocus();
          focusNode.requestFocus();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: constraints,
          child: Container(
            decoration: ProvaFlutterTheme.backGroundSystemDesign,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.1,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.5,
                    width: constraints.maxWidth * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => const ItemBoxWidget(
                        texto:
                            "TextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTextoTexto",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.08,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.7,
                    child: ProvaFlutterTextField(
                        obscureText: false,
                        label: "Digite seu Texto",
                        focusNode: focusNode),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.17,
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
      ),
    );
  }
}
