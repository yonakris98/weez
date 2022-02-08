import 'package:flutter/material.dart';
import 'package:weez/ui/success_transaction.dart';
import 'package:weez/widget/buttonWidget.dart';
import 'package:weez/widget/nonCashWidget.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isCash = true;
  bool grab = false;
  bool gojek = true;
  bool shopee = false;
  final List<bool> isSelected = [false, false, false];

  final List<Map> myProducts = List.generate(5,
          (index) => {"id": index, "name": "Ayam Geprek", "price": "Rp 10.000"})
      .toList();

  Widget checkoutItem(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            myProducts[index]["id"].toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Text(
            myProducts[index]["name"],
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Text(
            myProducts[index]["price"],
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget nonCashItem(
    String imagePath,
  ) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 60,
          width: 60,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: fullWidth,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Order List',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                height: 200,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: myProducts.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return checkoutItem(index);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Bill : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    'Rp 45.000',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ButtonWidget(
                            label: 'Cash',
                            color: isCash ? Colors.blue : Colors.grey[200],
                            fontColor: isCash ? Colors.white : Colors.blue,
                            onTap: () {
                              setState(() {
                                isCash = true;
                              });
                            },
                            width: (MediaQuery.of(context).size.width / 3),
                            height: 50,
                            icon: Icons.attach_money_rounded,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ButtonWidget(
                            label: 'Non Cash',
                            color: isCash ? Colors.grey[200] : Colors.blue,
                            fontColor: isCash ? Colors.blue : Colors.white,
                            onTap: () {
                              setState(() {
                                isCash = false;
                              });
                            },
                            width: (MediaQuery.of(context).size.width / 3),
                            height: 50,
                            icon: Icons.credit_card_rounded,
                          ),
                        ),
                      ],
                    ),
                    isCash
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 40, 0, 10),
                                  child: Text(
                                    'Total Cash',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blue),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      hintText: 'Enter total cash'),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 20),
                            child: ToggleButtons(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0, vertical: 20.0),
                                  child: Image.asset(
                                    'assets/grab.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0, vertical: 20.0),
                                  child: Image.asset(
                                    'assets/gojek.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0, vertical: 20.0),
                                  child: Image.asset(
                                    'assets/shopee.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                              ],
                              onPressed: (int index) {
                                setState(
                                  () {
                                    for (int buttonIndex = 0;
                                        buttonIndex < isSelected.length;
                                        buttonIndex++) {
                                      if (buttonIndex == index) {
                                        isSelected[buttonIndex] =
                                            !isSelected[buttonIndex];
                                      } else {
                                        isSelected[buttonIndex] = false;
                                      }
                                    }
                                  },
                                );
                              },
                              isSelected: isSelected,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: ButtonWidget(
                height: 40,
                label: 'Submit',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessTransaction()),
                  );
                },
                color: Colors.blue,
                fontColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
