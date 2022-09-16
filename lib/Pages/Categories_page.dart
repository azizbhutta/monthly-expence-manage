import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monthly_expense_manage/Models/categories_model.dart';
import '../DbHelper/categories_database.dart';
import '../Screens/categories_list.dart';
import '../widgets/custom_icons.dart';

class Categories_Page extends StatefulWidget {
  @override
  State<Categories_Page> createState() => _Categories_PageState();
}

class _Categories_PageState extends State<Categories_Page> {
  final formKey = GlobalKey<FormState>();
  TextEditingController catController = TextEditingController();

  late Future<List<CategoriesModel>> categoriesList;

  CategoriesDBHelper? dbHelper;

  validation() {
    if (formKey.currentState!.validate()) {
      dbHelper
          ?.insert(
              CategoriesModel(name: catController.text.toString(), icon: _icon))
          .then((value) {
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
    loadData();
  }

  loadData() async {
    categoriesList = dbHelper!.getCartListWithUserId();
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
        customIconPack: myCustomIcons, iconPackModes: [IconPack.custom]);

    _icon = Icon(icon);
    print(_icon);
    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xffffefd5),
      //
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        title: const Text(
          "Add Category",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(context, MaterialPageRoute(
        //         builder: (context) => const CategoriesListScreen()));
        //   },
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: IconButton(
                  icon: _icon ??
                      Container(
                        child: Icon(Icons.bubble_chart),
                      ),
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
              const SizedBox(
                height: 20,
              ),
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
                height: 30,
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
                  child: const Text('Add',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),

              // SizedBox(
              //   height: 300, // Some height
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: categoriesList,
                            builder: (context,
                                AsyncSnapshot<List<CategoriesModel>> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Card(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(35),
                                                  bottomRight:
                                                      Radius.circular(35))),
                                          child: ExpansionTile(
                                            collapsedTextColor: Colors.black,
                                            textColor: Colors.redAccent,
                                            iconColor: Colors.redAccent,
                                            leading: const Icon(
                                              Icons.category,
                                              color: Colors.redAccent,
                                            ),
                                            title: Text(
                                              snapshot.data![index].name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 17),
                                            ),
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 13),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Categories : \t\t\t ${snapshot.data![index].name.toString()}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 13),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Icon : \t\t\t ${snapshot.data![index].icon.toString()}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 14),
                                                    child: Text(
                                                      "Update Data",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 180,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                actions: [
                                                                  TextFormField(
                                                                    controller:
                                                                        catController,
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        catController.text = snapshot
                                                                            .data![index]
                                                                            .name
                                                                            .toString();
                                                                      });
                                                                    },
                                                                    decoration:
                                                                        const InputDecoration(
                                                                      hintText:
                                                                          "Enter Name",
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15),
                                                                      labelText:
                                                                          "Category Name",
                                                                      labelStyle: TextStyle(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .category,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 4.0,
                                                                  ),
                                                                  MaterialButton(
                                                                    onPressed:
                                                                        () {
                                                                      dbHelper
                                                                          ?.update(
                                                                              CategoriesModel(
                                                                        id: snapshot
                                                                            .data![index]
                                                                            .id!,
                                                                        name: catController
                                                                            .text
                                                                            .toString(),
                                                                        icon:
                                                                            _icon,
                                                                      ))
                                                                          .then(
                                                                              (value) {
                                                                        print(
                                                                            "Data Updated");
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "Data Updated Successfully");
                                                                      }).onError((error,
                                                                              stackTrace) {
                                                                        print(error
                                                                            .toString());
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        categoriesList =
                                                                            dbHelper!.getCartListWithUserId();
                                                                        Navigator.pop(
                                                                            context);
                                                                      });
                                                                    },
                                                                    color: Colors
                                                                        .green,
                                                                    child:
                                                                        const Text(
                                                                      "Update",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: const Icon(
                                                        Icons.edit,
                                                        color: Colors.green,
                                                        size: 25,
                                                      ))
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 14),
                                                    child: Text(
                                                      "Delete Data",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 180,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                content: const Text(
                                                                    "Are you sure you want to delete, if yes then press delete"),
                                                                actions: [
                                                                  const SizedBox(
                                                                    height: 4.0,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      MaterialButton(
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            dbHelper?.delete(snapshot.data![index].id!);
                                                                            // For Refreshing List
                                                                            categoriesList =
                                                                                dbHelper!.getCartListWithUserId();
                                                                            snapshot.data!.remove(snapshot.data![index]);
                                                                            Navigator.pop(context);
                                                                          });
                                                                        },
                                                                        color: Colors
                                                                            .redAccent,
                                                                        child:
                                                                            const Text(
                                                                          "Delete",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ),
                                                                      MaterialButton(
                                                                        color: Colors
                                                                            .green,
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "No",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size: 25,
                                                      ))
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          )),
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                  child: Container(
                                      child: const Text(
                                    "No Data Found",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
}
