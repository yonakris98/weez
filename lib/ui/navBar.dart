import 'package:flutter/material.dart';
import 'package:weez/ui/history_transaction.dart';
import 'package:weez/ui/manage_store/manage_store.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Yonatan'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(
                  Icons.image,
                ),
              ),
            ),
            // decoration: BoxDecoration(
            //   color: Colors.blue,
            //   image: DecorationImage(
            //       fit: BoxFit.fill,
            //       image: NetworkImage(
            //           'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            // ),
          ),
          ListTile(
            leading: Icon(
              Icons.computer_rounded,
              color: Colors.blue,
            ),
            title: Text('Cashier'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.history,
              color: Colors.blue,
            ),
            title: Text('History Transaction'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryTransactionPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.store_mall_directory_rounded,
              color: Colors.blue,
            ),
            title: Text('Manage Store'),
            onTap: () =>  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManageStorePage()),
              ),
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.description),
          //   title: Text('Policies'),
          //   onTap: () => null,
          // ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.blue,
            ),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
