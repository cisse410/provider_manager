import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/list_items.dart';
import 'package:provider_manager/model/item_data.dart';
import 'package:provider_manager/model/items.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final TextEditingController _controller = TextEditingController();

  void ajouterItem() {
    String textItem = _controller.text;
    Item item = Item(itemName: textItem);
    ItemData itemData = Provider.of<ItemData>(context, listen: false);
    itemData.addItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cours Provider",
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Nouveau article",
            ),
          ),
          ElevatedButton(onPressed: ajouterItem, child: const Text('Ajouter')),
          const ItemList(),
        ],
      ),
    );
  }
}
