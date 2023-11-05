import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/core/iu/mensagens.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_theme.dart';
import 'package:prova_flutter/app/core/widgets/prova_flutter_text_field.dart';
import 'package:prova_flutter/app/modules/home/home_controller.dart';
import 'package:prova_flutter/app/modules/home/widgets/item_box_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode focusNode = FocusNode();
  final _textoEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      focusNode.requestFocus();
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          focusNode.unfocus();
          focusNode.requestFocus();
        }
      });
      await Provider.of<HomeController>(context, listen: false).getAll();
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    var controller = Provider.of<HomeController>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: ProvaFlutterTheme.backGroundSystemDesign,
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  height: height * 0.5,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Observer(
                    builder: (context) {
                      return ListView.builder(
                        itemCount: controller.listView.length,
                        itemBuilder: (context, index) => ItemBoxWidget(
                          texto: controller.listView[index],
                          apagar: () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 10,
                                child: Container(
                                  decoration: ProvaFlutterTheme
                                      .backGroundSystemDesign
                                      .copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: height * 0.2,
                                  width: width * 0.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Deseja excluir o Item:",
                                        style: ProvaFlutterTheme.styleText,
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: width * 0.1,
                                          right: width * 0.1,
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: width * 0.1,
                                              right: width * 0.1,
                                            ),
                                            child: Text(
                                              controller.listView[index],
                                              style: ProvaFlutterTheme
                                                  .styleTextItemBoxWidget,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: width * 0.1,
                                          right: width * 0.1,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                controller.excluir(
                                                    index: index);
                                                controller.unEditeItemStatus();
                                                controller.limparInput(
                                                    editingController:
                                                        _textoEC);
                                                Navigator.of(context).pop();
                                              },
                                              style:
                                                  ProvaFlutterTheme.buttonStyle,
                                              child: const Text("Confirmar"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style:
                                                  ProvaFlutterTheme.buttonStyle,
                                              child: const Text("Cancelar"),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          editar: () {
                            _textoEC.text = controller.listView[index];
                            controller.editeItemStatus(index: index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                SizedBox(
                  width: width * 0.7,
                  child: ProvaFlutterTextField(
                    obscureText: false,
                    label: "Digite seu Texto",
                    focusNode: focusNode,
                    textEditingController: _textoEC,
                    onCompleted: () async {
                      if (controller.index != -1) {
                        if (_textoEC.text.isNotEmpty || _textoEC.text != "") {
                          await controller.editeItem(
                              item: _textoEC.text, index: controller.index);
                          controller.unEditeItemStatus();
                          controller.limparInput(editingController: _textoEC);
                        } else {
                          Messages.of(context)
                              .showInfo("Você deve preencher o campo!");
                        }
                      } else {
                        if (_textoEC.text.isNotEmpty || _textoEC.text != "") {
                          await controller.inserir(item: _textoEC.text);
                          controller.limparInput(editingController: _textoEC);
                        } else {
                          Messages.of(context)
                              .showInfo("Você deve preencher o campo!");
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.17,
                ),
                InkWell(
                  onTap: () async {
                    await controller.abrirAplicativo(
                        urlParam: "https://www.google.com/");
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
