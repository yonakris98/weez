import 'package:flutter/material.dart';
import 'package:weez/ui/manage_store/product/product.dart';
import 'package:weez/widget/buttonWidget.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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

  _confirmAdd(BuildContext context) {
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProductPage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text("Caution"),
      content: Text("Are you sure you add this product?"),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          'Add Product',
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
                        'Product Name',
                        nameController.text,
                      ),
                      _itemField(
                        'Selling Price',
                        nameController.text,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Text(
                                'Category',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)),

                              // dropdown below..
                              child: DropdownButton<String>(
                                value: selectedValue,
                                onChanged: (String newValue) =>
                                    setState(() => selectedValue = newValue),
                                items: items
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),

                                // add extra sugar..
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 42,
                                underline: SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Text(
                                'Photo',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ButtonWidget(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  label: 'Add Product',
                  fontSize: 18,
                  onTap: () {
                    _confirmAdd(context);
                  },
                  color: Colors.blue,
                  fontColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
