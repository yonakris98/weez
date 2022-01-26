import 'package:flutter/material.dart';
import 'package:weez/widget/buttonWidget.dart';

class HistoryTransactionPage extends StatefulWidget {
  @override
  _HistoryTransactionPageState createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage> {
  final List<Map> listHistory = List.generate(
      5,
      (index) => {
            "id": index,
            "date": "02 January 2021",
            "totalPayment": "Rp 250.000",
            "items": {"name": "Ayam Geprek", "price": "Rp 10.000"}
          }).toList();

  Widget historyItem(index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(listHistory[index]["date"]),
                Spacer(),
                Text(listHistory[index]["totalPayment"]),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          'History Transaction',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
        ),
      ),
      body: Padding(
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: listHistory.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return historyItem(index);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
