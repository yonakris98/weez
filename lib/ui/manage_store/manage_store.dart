import 'package:flutter/material.dart';
import 'package:weez/ui/home.dart';
import 'package:weez/ui/manage_store/branch_employee/branch/branch.dart';
import 'package:weez/ui/manage_store/branch_employee/employee/employee.dart';
import 'package:weez/ui/manage_store/product/product.dart';
import 'package:weez/ui/manage_store/storage/storage.dart';

class ManageStorePage extends StatefulWidget {
  @override
  _ManageStorePageState createState() => _ManageStorePageState();
}

class _ManageStorePageState extends State<ManageStorePage> {
  Widget _itemMenu(label, page) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.blue),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()))),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Manage Store',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal :20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Set Product',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                _itemMenu('Product', ProductPage()),
                SizedBox(height: 20),
                Text(
                  'Set Branch & Employee',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                _itemMenu('Branch List', BranchPage()),
                _itemMenu('Employee List', EmployeePage()),
                SizedBox(height: 20),
                Text(
                  'Set Storage',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                _itemMenu('Storage List', StoragePage()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
