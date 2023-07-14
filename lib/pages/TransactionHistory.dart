import 'package:flutter/material.dart';
import 'package:gp/pages/TransactionDeatils.dart';
import 'package:gp/services/customservices.dart';
import 'package:intl/intl.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key, required this.name});
  final String name;

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  List<Map> Transactions = [
    {
      "name": "Rahul",
      "amount": "100",
      "date": 1670970581918,
      "id": "123456789012",
      "pa": "paytmqr281005050101fgncoc9c8pwx@paytm"
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 58, 59, 65),
        ),
        body: FutureBuilder(
          future: getListFromSharedPref(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              Transactions = [];
              for (var i = 0; i < snapshot.data!.length; i++) {
                Transactions.add(snapshot.data![i]);
              }
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 49, 50, 56),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.builder(
                          itemCount: Transactions.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.32),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TransactionDetails(
                                        data: Transactions[index],
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                    height: 180,
                                    child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 58, 59, 65),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, top: 20),
                                                child: Text(
                                                  "Payment to ${Transactions[index]["name"]}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.8),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text(
                                                  "₹${Transactions[index]["amount"]}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 14, right: 20),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Colors.green[300],
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Paid · ${DateFormat('MMM dd').format(DateTime.fromMillisecondsSinceEpoch(Transactions[index]["date"]))}",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    const Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ))),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
        bottomSheet: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 49, 50, 56),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Pay button
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 37,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[400],
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const EnterAmount(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
