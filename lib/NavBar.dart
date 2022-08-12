import 'package:flutter/material.dart';
import 'package:monthly_expense_manage/Pages/Account_page.dart';

import 'Pages/Categories_page.dart';
import 'Pages/Expense_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text('aziz butt'),
              accountEmail: Text('butt'),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                ),
              )),
          ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Add Account'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => Account_Page()))),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Add Category'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) =>  Categories_Page()))
          ),
          ListTile(
            leading: const Icon(Icons.receipt_outlined),
            title: const Text('Expense Record'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const Expense_Page()))
          ),
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
