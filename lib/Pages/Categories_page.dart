import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monthly_expense_manage/Models/categories_model.dart';
import '../DbHelper/categories_database.dart';
import '../Screens/categories_list.dart';
import '../widgets/custom_icons.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories_Page extends StatefulWidget {
  @override
  State<Categories_Page> createState() => _Categories_PageState();
}

class _Categories_PageState extends State<Categories_Page> {

  final formKey = GlobalKey<FormState>();
  TextEditingController catController = TextEditingController();

  CategoriesDBHelper? dbHelper;

  validation() {
    if (formKey.currentState!.validate()) {
      dbHelper?.insert(
          CategoriesModel(
              name: catController.text.toString()
          )
      ).then((value) {
        print("Data Added");
        Fluttertoast.showToast(msg: "Data Added");
        catController.clear();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    } else {
      Fluttertoast.showToast(msg: 'Please Provide the required information');
      print("Enter The Information in the Textfields");
    }
  }

  @override
  void initState() {
    super.initState();
    dbHelper = CategoriesDBHelper();
  }

  //
  // _displayDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: 100,
  //           width: 100,
  //           color: Colors.white,
  //           child: GridView.count(
  //             crossAxisCount: 4,
  //             childAspectRatio: 1.0,
  //             // mainAxisSpacing: 20,
  //             // crossAxisSpacing: 20,
  //             children: const [
  //               Icon(
  //                 size: 80,
  //                 Icons.account_circle,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.food_bank,
  //                 size: 80,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.food_bank_outlined,
  //                 size: 80,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.food_bank_rounded,
  //                 size: 80,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.food_bank_sharp,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.local_drink,
  //                 size: 50,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.local_drink_outlined,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.local_drink_rounded,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.local_drink_sharp,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.no_drinks,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.bakery_dining,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.abc,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.abc,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.abc,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.abc,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.abc,
  //                 size: 100,
  //                 color: Colors.green,
  //               ),
  //               Icon(
  //                 Icons.abc,
  //                 size: 100,
  //                 color: Colors.green,
  //                 // splashColor: Colors.deepOrange,
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }

  // TODO Pick Icons
  Icon? _icon;


  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        customIconPack: myCustomIcons,
        iconPackModes: [IconPack.custom]);

    _icon = Icon(icon);
    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          backgroundColor: const Color(0xffffefd5),
          //
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.redAccent.withOpacity(0.8),
            title: const Text("Add Category", style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => const CategoriesListScreen()));
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      icon: _icon ?? Container(child: Icon(Icons.bubble_chart),),
                      onPressed: () {
                        setState(() {
                          _pickIcon();
                        });
                      },
                      iconSize: 70,
                      color: Colors.redAccent.withOpacity(0.8),
                      splashColor: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 25,),
                  TextFormField(
                    controller: catController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Provide Category Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Category Name',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          catController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 400,
                    height: 45,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      onPressed: () {
                        validation();
                      },
                      color: Colors.redAccent.withOpacity(0.8),
                      child: const Text(
                          'Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ));
}


