import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories_Page extends StatefulWidget {
  @override
  State<Categories_Page> createState() => _Categories_PageState();
}

class _Categories_PageState extends State<Categories_Page> {
  final _catController = TextEditingController();
  // final _priceController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.white,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.0,
              // mainAxisSpacing: 20,
              // crossAxisSpacing: 20,
              
              children: const [
                Icon(
                  FontAwesomeIcons.bowlFood,
                  size: 80,
                  color: Colors.green,
                ),
                Icon(
                  Icons.food_bank,
                  size: 80,
                  color: Colors.green,
                ),
                Icon(
                  Icons.food_bank_outlined,
                  size: 80,
                  color: Colors.green,
                ),
                Icon(
                  Icons.food_bank_rounded,
                  size: 80,
                  color: Colors.green,
                ),
                Icon(
                  Icons.food_bank_sharp,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.local_drink,
                  size: 50,
                  color: Colors.green,
                ),
                Icon(
                  Icons.local_drink_outlined,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.local_drink_rounded,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.local_drink_sharp,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.no_drinks,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.bakery_dining,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.abc,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.abc,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.abc,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.abc,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.abc,
                  size: 100,
                  color: Colors.green,
                ),
                Icon(
                  Icons.abc,
                  size: 100,
                  color: Colors.green,
                  // splashColor: Colors.deepOrange,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Add Categories'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: IconButton(
                icon: Icon(Icons.bubble_chart),
                onPressed: () {
                  setState(() {
                    _displayDialog(context);
                  });
                },
                iconSize: 100,
                color: Colors.blue,
                splashColor: Colors.deepOrange,
              ),
            ),
            TextField(
              controller: _catController,
              decoration: InputDecoration(
                hintText: 'Category',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _catController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.cyan,
              child: const Text('Add', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ));
}
