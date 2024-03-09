class Item {
  String? itemName;
  bool completed;

  Item({this.itemName, this.completed = false});

  void afficher() {
    completed = !completed;
  }
}
