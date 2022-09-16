import 'package:flutter/material.dart';
import 'package:monthly_expense_manage/Models/account_model.dart';
import 'package:monthly_expense_manage/DbHelper/account_database.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AccountListScreen extends StatefulWidget {
  const AccountListScreen({Key? key}) : super(key: key);

  @override
  State<AccountListScreen> createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {


  TextEditingController textController = TextEditingController();
  TextEditingController amountController = TextEditingController();



  late Future<List<AccountModel>> accountList;

  Future<List>? _users;
  DBHelper? dbHelper;


  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async{
    accountList = dbHelper!.getCartListWithUserId();

    print(accountList.toString());

    setState(() {
      _users = accountList;
    });
  }

  // Update Data
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffefd5),
       appBar: AppBar(
         title: const Text('Account List'),
           backgroundColor: Colors.redAccent.withOpacity(0.8),
       ),

      body: Column(
        children: [
          const SizedBox(height: 25,),
          Expanded(
            child: FutureBuilder(
              future: accountList,
              builder: (context, AsyncSnapshot<List<AccountModel>> snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), bottomRight: Radius.circular(35))
                            ),
                            child: ExpansionTile(
                              collapsedTextColor: Colors.black,
                              textColor: Colors.redAccent,
                              iconColor: Colors.redAccent,
                              leading: const Icon(Icons.person, color: Colors.redAccent,),
                              title: Text(snapshot.data![index].name.toString(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Amount : \t\t\t ${snapshot.data![index].amount.toString()}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text("Update Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    ),
                                    const SizedBox(width: 180,),
                                    GestureDetector(
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context){
                                                return AlertDialog(
                                                  actions: [
                                                    TextFormField(
                                                      controller: textController,
                                                      onTap: (){
                                                        setState(() {
                                                          textController.text = snapshot.data![index].name.toString();
                                                        });
                                                      },
                                                      decoration: const InputDecoration(
                                                        hintText: "Enter Name",
                                                        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                                                        labelText: "First Name",
                                                        labelStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w800),
                                                        prefixIcon: Icon(Icons.person, color: Colors.black,),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: amountController,
                                                      onTap: (){
                                                        setState(() {
                                                          amountController.text = snapshot.data![index].amount.toString();
                                                        });
                                                      },
                                                      decoration: const InputDecoration(
                                                        hintText: "Enter Amount",
                                                        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                                                        labelText: "Amount",
                                                        labelStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w800),
                                                        prefixIcon: Icon(Icons.attach_money, color: Colors.black,),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4.0,),
                                                    MaterialButton(
                                                      onPressed: (){
                                                        dbHelper?.update(
                                                            AccountModel(
                                                              id: snapshot.data![index].id!,
                                                              name: textController.text.toString(),
                                                              amount:int.parse(amountController.text.toString()),
                                                            )
                                                        ).then((value) {
                                                          debugPrint("Data Updated");
                                                          Fluttertoast.showToast(msg: "Data Updated Successfully");
                                                        }).onError((error, stackTrace) {
                                                          debugPrint(error.toString());
                                                        });
                                                        setState(() {
                                                          accountList = dbHelper!.getCartListWithUserId();
                                                          Navigator.pop(context);
                                                        });
                                                      },
                                                      color: Colors.green,
                                                      child: const Text("Update", style: TextStyle(color: Colors.white),),
                                                    ),
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        child: const Icon(Icons.edit,  color: Colors.green, size: 25,))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text("Delete Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    ),
                                    const SizedBox(width: 180,),
                                    GestureDetector(
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context){
                                                return AlertDialog(
                                                  content: const Text("Are you sure you want to delete, if yes then press delete"),
                                                  actions: [
                                                    const SizedBox(height: 4.0,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        MaterialButton(
                                                          onPressed: (){
                                                            setState(() {
                                                              dbHelper?.delete(snapshot.data![index].id!);
                                                              // For Refreshing List
                                                              accountList = dbHelper!.getCartListWithUserId();
                                                              snapshot.data!.remove(snapshot.data![index]);
                                                              Navigator.pop(context);
                                                            });
                                                          },
                                                          color: Colors.redAccent,
                                                          child: const Text("Delete", style: TextStyle(color: Colors.white),),
                                                        ),
                                                        MaterialButton(
                                                          color: Colors.green,
                                                          onPressed: (){
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text("No", style: TextStyle(color: Colors.white),),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        child: const Icon(Icons.delete,  color: Colors.red, size: 25,))
                                  ],
                                ),
                                const SizedBox(height: 20,),
                              ],
                            )
                        ),
                      );
                    },
                  );
                }else{
                  return Center(
                    child: Container(
                        child: const Text("No Data Found", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.redAccent.withOpacity(0.8),
      //   onPressed: (){
      //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AddAccountScreen()));
      //   },
      //   child: const Icon(Icons.add, size: 25,),
      // ),
    );
  }
}
