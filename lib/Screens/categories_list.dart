// import 'package:flutter/material.dart';
// import 'package:monthly_expense_manage/Models/categories_model.dart';
// import 'package:monthly_expense_manage/DbHelper/categories_database.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
//
// class CategoriesListScreen extends StatefulWidget {
//   const CategoriesListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CategoriesListScreen> createState() => _CategoriesListScreenState();
// }
//
// class _CategoriesListScreenState extends State<CategoriesListScreen> {
//
//
//   TextEditingController catController = TextEditingController();
//
//
//
//
//   late Future<List<CategoriesModel>> categoriesList;
//   CategoriesDBHelper? dbHelper;
//
//
//   @override
//   void initState() {
//     super.initState();
//     dbHelper = CategoriesDBHelper();
//     loadData();
//   }
//
//   loadData() async{
//     categoriesList = dbHelper!.getCartListWithUserId();
//   }
//
//   // Update Data
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffefd5),
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   backgroundColor: Colors.redAccent.withOpacity(0.8),
//       //   title: const Text("Categories List", style: TextStyle(fontWeight: FontWeight.bold),),
//       //   leading: IconButton(
//       //     onPressed: (){
//       //        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
//       //     },
//       //     icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
//       //   ),
//       // ),
//       appBar: AppBar(
//         title: const Text('Categories List'),
//         backgroundColor: Colors.redAccent.withOpacity(0.8),
//       ),
//
//       body: Column(
//         children: [
//           const SizedBox(height: 25,),
//           Expanded(
//             child: FutureBuilder(
//               future: categoriesList,
//               builder: (context, AsyncSnapshot<List<CategoriesModel>> snapshot){
//
//                 if(snapshot.hasData){
//                   return ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: snapshot.data?.length,
//                     itemBuilder: (context, index){
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Card(
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(35), bottomRight: Radius.circular(35))
//                             ),
//                             child: ExpansionTile(
//                               collapsedTextColor: Colors.black,
//                               textColor: Colors.redAccent,
//                               iconColor: Colors.redAccent,
//                               leading: const Icon(Icons.person, color: Colors.redAccent,),
//                               title: Text(snapshot.data![index].name.toString(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),),
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 13),
//                                   child: Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       "Categories : \t\t\t ${snapshot.data![index].name.toString()}",
//                                       style: const TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.w400
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 5.0,),
//                                 Row(
//                                   children: [
//                                     const Padding(
//                                       padding: EdgeInsets.only(left: 14),
//                                       child: Text("Update Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
//                                     ),
//                                     const SizedBox(width: 180,),
//                                     GestureDetector(
//                                         onTap: (){
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context){
//                                                 return AlertDialog(
//                                                   actions: [
//                                                     TextFormField(
//                                                       controller: catController,
//                                                       onTap: (){
//                                                         setState(() {
//                                                           catController.text = snapshot.data![index].name.toString();
//                                                         });
//                                                       },
//                                                       decoration: const InputDecoration(
//                                                         hintText: "Enter Name",
//                                                         hintStyle: TextStyle(color: Colors.black, fontSize: 15),
//                                                         labelText: "First Name",
//                                                         labelStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w800),
//                                                         prefixIcon: Icon(Icons.person, color: Colors.black,),
//                                                       ),
//                                                     ),
//
//                                                     const SizedBox(height: 4.0,),
//                                                     MaterialButton(
//                                                       onPressed: (){
//                                                         dbHelper?.update(
//                                                             CategoriesModel(
//                                                               id: snapshot.data![index].id!,
//                                                               name: catController.text.toString(),
//                                                             )
//                                                         ).then((value) {
//                                                           print("Data Updated");
//                                                           Fluttertoast.showToast(msg: "Data Updated Successfully");
//                                                         }).onError((error, stackTrace) {
//                                                           print(error.toString());
//                                                         });
//                                                         setState(() {
//                                                           categoriesList = dbHelper!.getCartListWithUserId();
//                                                           Navigator.pop(context);
//                                                         });
//                                                       },
//                                                       color: Colors.green,
//                                                       child: const Text("Update", style: TextStyle(color: Colors.white),),
//                                                     ),
//                                                   ],
//                                                 );
//                                               }
//                                           );
//                                         },
//                                         child: const Icon(Icons.edit,  color: Colors.green, size: 25,))
//                                   ],
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   children: [
//                                     const Padding(
//                                       padding: EdgeInsets.only(left: 14),
//                                       child: Text("Delete Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
//                                     ),
//                                     const SizedBox(width: 180,),
//                                     GestureDetector(
//                                         onTap: (){
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context){
//                                                 return AlertDialog(
//                                                   content: const Text("Are you sure you want to delete, if yes then press delete"),
//                                                   actions: [
//                                                     const SizedBox(height: 4.0,),
//                                                     Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                       children: [
//                                                         MaterialButton(
//                                                           onPressed: (){
//                                                             setState(() {
//                                                               dbHelper?.delete(snapshot.data![index].id!);
//                                                               // For Refreshing List
//                                                               categoriesList = dbHelper!.getCartListWithUserId();
//                                                               snapshot.data!.remove(snapshot.data![index]);
//                                                               Navigator.pop(context);
//                                                             });
//                                                           },
//                                                           color: Colors.redAccent,
//                                                           child: const Text("Delete", style: TextStyle(color: Colors.white),),
//                                                         ),
//                                                         MaterialButton(
//                                                           color: Colors.green,
//                                                           onPressed: (){
//                                                             Navigator.pop(context);
//                                                           },
//                                                           child: const Text("No", style: TextStyle(color: Colors.white),),
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 );
//                                               }
//                                           );
//                                         },
//                                         child: const Icon(Icons.delete,  color: Colors.red, size: 25,))
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20,),
//                               ],
//                             )
//                         ),
//                       );
//                     },
//                   );
//                 }else{
//                   return Center(
//                     child: Container(
//                         child: const Text("No Data Found", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
//                     ),
//                   );
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   backgroundColor: Colors.redAccent.withOpacity(0.8),
//       //   onPressed: (){
//       //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AddAccountScreen()));
//       //   },
//       //   child: const Icon(Icons.add, size: 25,),
//       // ),
//     );
//   }
// }
