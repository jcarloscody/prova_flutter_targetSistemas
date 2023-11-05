import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_target_sistemas_icons.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_theme.dart';

class ItemBoxWidget extends StatelessWidget {
  final String _texto;
  final VoidCallback _editar;
  final VoidCallback _apagar;
  const ItemBoxWidget({
    super.key,
    required String texto,
    required VoidCallback editar,
    required VoidCallback apagar,
  })  : _texto = texto,
        _editar = editar,
        _apagar = apagar;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: const BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: constraints.maxWidth * 0.1),
                  child: Text(
                    _texto,
                    style: ProvaFlutterTheme.styleTextItemBoxWidget,
                  ),
                ),
              ),
            ),
            IntrinsicWidth(
              child: IconButton(
                onPressed: _editar,
                iconSize: 40,
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  ProvaFlutterTargetSistemas.pencil_alt,
                  size: 34,
                ),
              ),
            ),
            IntrinsicWidth(
              child: IconButton(
                onPressed: _apagar,
                iconSize: 40,
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
