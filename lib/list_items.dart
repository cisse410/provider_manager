import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/model/item_data.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(builder: (context, itemData, child) {
      return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: itemData.size,
          itemBuilder: (context, index) {
            final item = itemData.items[index];
            return GestureDetector(
              onLongPress: () => itemData.removeItem(item),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade600,
                    child: Text(item.itemName![0]),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.itemName!,
                        style: TextStyle(
                          decoration:
                              item.completed ? TextDecoration.lineThrough : null,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Checkbox(
                        value: item.completed,
                        onChanged: (cons) => itemData.displayItem(item),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
