import 'package:flutter/material.dart';
import 'package:weez/widget/buttonWidget.dart';

class SuccessTransaction extends StatefulWidget {
  @override
  _SuccessTransactionState createState() => _SuccessTransactionState();
}

class _SuccessTransactionState extends State<SuccessTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SingleChildScrollView(
          //   child:
          Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/success.png',
                    width: 200,
                    height: 200,
                  ),
                  Text(
                    'Successful Transaction!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Method Payment : Non Cash - Gojek',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Total Bill : Rp 450.000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(8), // Added this
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Email'),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ButtonWidget(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2,
                      label: 'Send Receipt',
                      fontSize: 16,
                      onTap: () {},
                      color: Colors.blue,
                      fontColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ButtonWidget(
              height: 50,
              width: MediaQuery.of(context).size.width,
              label: 'Print Receipt',
              fontSize: 24,
              onTap: () {},
              color: Colors.white,
              fontColor: Colors.blue,
            ),
            SizedBox(
              height: 15,
            ),
            ButtonWidget(
              height: 50,
              width: MediaQuery.of(context).size.width,
              label: 'Next Order',
              fontSize: 24,
              onTap: () {},
              color: Colors.white,
              fontColor: Colors.blue,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
