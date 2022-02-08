import 'package:flutter/material.dart';
import 'package:weez/ui/manage_store/branch_employee/branch/branch.dart';
import 'package:weez/ui/manage_store/product/product.dart';
import 'package:weez/widget/buttonWidget.dart';

class EditBranchPage extends StatefulWidget {
  @override
  _EditBranchPageState createState() => _EditBranchPageState();
}

class _EditBranchPageState extends State<EditBranchPage> {
  @override
  initState() {
    nameController.text = 'Ayam Goreng';
    super.initState();
  }

  TextEditingController nameController = new TextEditingController();
  final items = ['Makanan', 'Snack', 'Minuman', 'Lain lain'];
  String selectedValue = 'Makanan';

  Widget _itemField(label, hint) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ],
      ),
    );
  }

  _confirmEdit(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text("Caution"),
      content: Text(
          "Are you sure you edit this branch?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    ;
  }

  _confirmDelete(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BranchPage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text("Caution"),
      content: Text(
          "Are you sure you delete this branch?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          'Edit Branch',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       _itemField(
                        'Branch',
                        nameController.text,
                      ),
                      _itemField(
                        'City',
                        nameController.text,
                      ),
                      _itemField(
                        'Address',
                        nameController.text,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonWidget(
                height: 40,
                width: MediaQuery.of(context).size.width,
                label: 'Edit Branch',
                fontSize: 18,
                onTap: () {
                  _confirmEdit(context);
                },
                color: Colors.blue,
                fontColor: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              ButtonWidget(
                height: 40,
                width: MediaQuery.of(context).size.width,
                label: 'Delete Branch',
                fontSize: 18,
                onTap: () {
                  _confirmDelete(context);
                },
                color: Colors.red,
                fontColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
