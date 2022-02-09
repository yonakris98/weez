import 'package:flutter/material.dart';
import 'package:weez/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:weez/widget/buttonWidget.dart';

class HistoryTransactionPage extends StatefulWidget {
  @override
  _HistoryTransactionPageState createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage> {
  DateTime selectedDate = DateTime.now();
  final List<Map> listHistory = List.generate(
      5,
      (idx) => {
            "id": idx,
            "date": "02 January 2021",
            "totalPayment": "Rp 250.000",
            "items": [
              {"name": "Ayam Geprek", "price": "Rp 10.000"},
              {"name": "Bakmi Goreng", "price": "Rp 15.000"}
            ]
          }).toList();

  Widget historyItem(index, itemsCount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[200],
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(3.0, 3.0),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  listHistory[index]["date"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Spacer(),
                Text(
                  listHistory[index]["totalPayment"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemsCount,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listHistory[index]["items"][index]["name"],
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          listHistory[index]["items"][index]["price"],
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            ButtonWidget(
              label: "Details",
              height: 20,
              fontSize: 14,
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  _showModalBottom() {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Filter Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.blue),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close))
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              'From',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      hintText: 'From Date'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              'To',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      hintText: 'To Date'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ButtonWidget(
                      height: 35,
                      fontSize: 20,
                      label: 'Apply',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.blue),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          'History Transaction',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  label: 'Filter date',
                  color: Colors.blue,
                  icon: Icons.filter_list_outlined,
                  fontSize: 18,
                  fontColor: Colors.white,
                  onTap: () {
                    _showModalBottom();
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3, //listHistory.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return historyItem(
                          index, listHistory[index]["items"].length);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
