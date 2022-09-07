import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monthly_expense_manage/Models/account_model.dart';
import 'package:monthly_expense_manage/DbHelper/account_database.dart';
import '../Screens/account_list.dart';
// import 'package:monthly_expense_manage/Screens/account_list.dart';


class Account_Page extends StatefulWidget {
  Account_Page({Key? key}) : super(key: key);

  @override
  State<Account_Page> createState() => _Account_PageState();
}

class _Account_PageState extends State<Account_Page> {

  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final amountController = TextEditingController();



  DBHelper? dbHelper;


   // validation(){
   //  if(formKey.currentState!.validate()){
   //    dbHelper?.insert(
  //         AccountModel(
  //           name: textController.text.toString(),
  //           amount: int.parse(amountController.text.toString()),
  //
  //         )
  //     ).then((value) {
  //       print("Data Added");
  //       Fluttertoast.showToast(msg: "Data Added");
  //     }).onError((error, stackTrace) {
  //       print(error.toString());
  //     });
  //   }else{
  //     Fluttertoast.showToast(msg: 'Please Provide the required information');
  //     print("Enter The Information in the Textfield");
  //   }
  // }

  // TODO Add Account Data
  validation(){
    if(formKey.currentState!.validate()){
      dbHelper?.insert(
          AccountModel(
              amount: int.parse(amountController.text.toString()),
              name: textController.text.toString(),
          )
      ).then((value) {
        print("Data Added");
        Fluttertoast.showToast(msg: "Data Added");
        amountController.clear();
        textController.clear();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }else{
      Fluttertoast.showToast(msg: 'Please Provide the required information');
      print("Enter The Information in the Textfields");
    }
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xffffefd5),
    // appBar: AppBar(
    //   title: const Text('Add Account'),
    //   backgroundColor: Colors.green,
    // ),
  appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        title: const Text("Add Amount", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AccountListScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),
    body: Padding(
      padding : const EdgeInsets.all(20.0),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: textController,
            validator: (value){
              if(value!.isEmpty){
                return "Please Provide Your FirstName";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Name',
            border: const OutlineInputBorder(),
            suffixIcon : IconButton(
                onPressed: (){
              textController.clear();
          },
            icon: const Icon(Icons.clear),
            ),
            ) ,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: amountController,
            validator: (value){
              if(value!.isEmpty){
                return "Please Provide Your amount";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Amount',
              border: const OutlineInputBorder(),
              suffixIcon : IconButton(
                onPressed: (){
                  amountController.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ) ,
          ),
          const SizedBox(
            height: 30,
          ),
            MaterialButton(
              onPressed: (){
                validation();
              },
            color: Colors.cyan,
            child: const Text('Add',style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ),
  ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:monthly_expense_manage/Models/account_model.dart';
// import 'package:monthly_expense_manage/Screens/account_list.dart';
// import '../DbHelper/account_database.dart';
//
//
//
// class AccountPage extends StatefulWidget {
//   const AccountPage({Key? key}) : super(key: key);
//
//   @override
//   State<AccountPage> createState() => _AccountPageState();
// }
//
// class _AccountPageState extends State<AccountPage> {
//
//
//
//   final formKey = GlobalKey<FormState>();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//
//   DBHelper? dbHelper;
//
//
//   validation(){
//     if(formKey.currentState!.validate()){
//       Fluttertoast.showToast(msg: "You can Add Name");
//       print("You can add Name");
//       dbHelper?.insert(
//         AccountModel(
//             name: nameController.text.toString(),
//             amount: int.parse(amountController.text.toString())
//         )
//       ).then((value) {
//         print("Data Added");
//         Fluttertoast.showToast(msg: "Data Added");
//       }).onError((error, stackTrace) {
//         print(error.toString());
//       });
//     }else{
//       Fluttertoast.showToast(msg: 'Please Provide the required information');
//       print("Enter The Information in the Textfields");
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     dbHelper = DBHelper();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffefd5),
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.redAccent.withOpacity(0.8),
//         title: const Text("Add Amount", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AccountListScreen()));
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
//         ),
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: [
//             const SizedBox(height: 50,),
//             const SizedBox(height: 40,),
//             Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       controller: nameController,
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return "Please Provide Your Name";
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                           hintText: "Enter Name",
//                           hintStyle: TextStyle(color: Colors.black,),
//                           labelText: " Name",
//                           labelStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
//                           border: UnderlineInputBorder(),
//                           prefixIcon: Icon(Icons.person, color: Colors.black,)
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20.0),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       controller: amountController,
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return "Please Add Amount";
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                           hintText: "Enter Amount",
//                           hintStyle: TextStyle(color: Colors.black,),
//                           labelText: "Amount",
//                           labelStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
//                           border: UnderlineInputBorder(),
//                           prefixIcon: Icon(Icons.accessibility, color: Colors.black,)
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40.0),
//               child: MaterialButton(
//                 color: Colors.redAccent,
//                 onPressed: () {
//                   validation();
//                 },
//                 shape: const StadiumBorder(),
//                 child: const Text("Add Amount", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//               ),
//             ),
//             const SizedBox(height: 30,),
//           ],
//         ),
//       ),
//     );
//   }
// }