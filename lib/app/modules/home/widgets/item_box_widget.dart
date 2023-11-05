import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/iu/prova_flutter_theme.dart';

class ItemBoxWidget extends StatelessWidget {
  final String _texto;
  const ItemBoxWidget({super.key, required String texto}) : _texto = texto;

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
                onPressed: () {},
                iconSize: 40,
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.note_add,
                ),
              ),
            ),
            IntrinsicWidth(
              child: IconButton(
                onPressed: () {},
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
