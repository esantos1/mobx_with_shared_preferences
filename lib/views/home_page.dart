import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxtest/constants.dart';
import 'package:mobxtest/stores/text_store.dart';
import 'package:mobxtest/widgets/background_widget.dart';
import 'package:mobxtest/widgets/privacy_policy.dart';
import 'package:mobxtest/widgets/text_input_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textAddController = TextEditingController();
  final textEditController = TextEditingController();
  final store = TextStore();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 50, right: 50, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: Colors.white,
                ),
                child: Observer(builder: (_) => _buildList()),
              ),
              TextInputField(
                controller: textAddController,
                textAlign: TextAlign.center,
                hintText: 'Digite seu texto',
                onSubmitted: (value) {
                  store.add(value.trim());
                  textAddController.clear();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: PrivacyPolicy(),
      ),
    );
  }

  Widget _buildList() {
    if (store.texts.isNotEmpty) {
      return ListView.separated(
        itemBuilder: (context, index) =>
            _buildItem(context, index, store.texts[index]),
        separatorBuilder: (_, __) => Divider(),
        itemCount: store.texts.length,
      );
    } else {
      return Text('Não há textos a serem exibidos.');
    }
  }

  Widget _buildItem(BuildContext context, int index, String item) => ListTile(
        title: Text(item),
        trailing: Wrap(
          spacing: 8.0,
          children: [
            IconButton(
              onPressed: () => showEditDialog(context, index, item),
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () => showConfirmDialog(context, index),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      );

  void showEditDialog(BuildContext context, int index, String item) async {
    final oldValue = item;

    String? newValue = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Valor anterior: $oldValue',
          style: TextStyle(fontSize: 16.0),
        ),
        content: TextField(controller: textEditController),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, textEditController.text);
              textEditController.clear();
            },
            child: Text('Alterar'),
          ),
        ],
      ),
    );

    if (newValue != null) {
      store.edit(index, newValue);
    }
  }

  void showConfirmDialog(BuildContext context, int index) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmação'),
          content: Text('Tem certeza que quer apagar o item selecionado?'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: Navigator.of(context).pop,
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                store.delete(index);
                Navigator.of(context).pop();
              },
              child: Text('Sim'),
            )
          ],
        ),
      );
}
