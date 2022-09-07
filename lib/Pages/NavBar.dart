import 'package:flutter/material.dart';
import 'Account_page.dart';
import 'Categories_page.dart';
import 'Expense_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffffefd5),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text('AZIZ BHUTTA', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              accountEmail: Text('Bhutta'),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/4386433/pexels-photo'
                            '-4386433.jpeg?auto=compress&cs=tinysrgb&w=600')),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/110549783?v=4',
                ),
              )),
          ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Add Account'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) =>  Account_Page()))),
          ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Add Category'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => Categories_Page()))),
          ListTile(
              leading: const Icon(Icons.receipt_outlined),
              title: const Text('Expense Record'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => const SimpleCalculator()))),
          const Divider(),
          ListTile(
            onTap: () {},
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
          ),

          // TODO Just For Practice
          const Divider(),
          ListTile(
            onTap: () {},
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
