import 'package:flutter/material.dart';
import '../../models/grocery.dart';
import '../../data/mock_grocery_repository.dart';
import './grocery_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<Grocery> _registeredItem = dummyGroceryItems;
  
  void _openAddItemForm() async{
    
    //use showModalBottomSheet
    // final Grocery? newItem = await showModalBottomSheet<Grocery>(
    //   context: context,
    //   isScrollControlled: true, 
    //   builder: (ctx) => NewItem(), 
    // );

    //use navigator pushfor a full screen page
    final Grocery? newItem = await Navigator.push<Grocery>(
      context,
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
      if (newItem != null) {
          setState(() {
              _registeredItem.add(newItem);
          });
      }  
  }
  

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));
    // TODO-1 - Display groceries with an Item builder and  LIst Tile
    if (_registeredItem.isNotEmpty) {
       content =   ListView.builder(
        itemCount: _registeredItem.length,
        itemBuilder:  (context, index) => GroceryTile(grocery:_registeredItem[index],),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _openAddItemForm,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
      // TODO-2 - Display groceries with an Item builder and  LIst Tile

    return ListTile(
      leading: Container(color: grocery.category.color, width: 15, height: 15,),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
      );
  }
}


