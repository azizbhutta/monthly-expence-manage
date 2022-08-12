import 'package:flutter/material.dart';


class Account_Page extends StatelessWidget {
  Account_Page({Key? key}) : super(key: key);
  final _textController = TextEditingController();
  final _amountController = TextEditingController();


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Add Account'),
      backgroundColor: Colors.green,
    ),
    body: Padding(
      padding : const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Name',
          border: const OutlineInputBorder(),
          suffixIcon : IconButton(
              onPressed: (){
            _textController.clear();
        },
          icon: const Icon(Icons.clear),
          ),
          ) ,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: _amountController,
          decoration: InputDecoration(
            hintText: 'Amount',
            border: const OutlineInputBorder(),
            suffixIcon : IconButton(
              onPressed: (){
                _amountController.clear();
              },
              icon: const Icon(Icons.clear),
            ),
          ) ,
        ),
        const SizedBox(
          height: 30,
        ),
          MaterialButton(
            onPressed: (){},
          color: Colors.cyan,
          child: const Text('Add',style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  ),
  );

 }