import 'package:flutter/material.dart';


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
              )
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.account_circle),
            title: Text('Add Account'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.category),
            title: Text('Add Categary'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.receipt_outlined),
            title: Text('Expense Record'),
          ),
          Divider(),
          ListTile(
            onTap: (){},
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      ),

    );
  }
}
