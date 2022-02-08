import 'package:flutter/material.dart';
import 'package:weez/ui/home.dart';
import 'package:weez/widget/buttonWidget.dart';

class SuccessTransaction extends StatefulWidget {
  @override
  _SuccessTransactionState createState() => _SuccessTransactionState();
}

class _SuccessTransactionState extends State<SuccessTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[800],
              Colors.blue[300],
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
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
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        isDense: true, // Added this
                                        contentPadding:
                                            EdgeInsets.all(8), // Added this
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        hintText: 'Email'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: ButtonWidget(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  label: 'Send Receipt',
                                  fontSize: 16,
                                  onTap: () {},
                                  color: Colors.blue,
                                  fontColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
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
                  label: 'Print Receipt',
                  fontSize: 18,
                  onTap: () {},
                  color: Colors.white,
                  fontColor: Colors.blue,
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonWidget(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  label: 'Next Order',
                  fontSize: 18,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  color: Colors.white,
                  fontColor: Colors.blue,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
