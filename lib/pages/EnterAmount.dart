// ignore: file_names
import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:gp/pages/PaymentDone.dart';

class EnterAmount extends StatefulWidget {
  const EnterAmount({super.key, this.upiMap});
  final Map<String, String>? upiMap;

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  bool showSSS = false;
  bool showPay = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showPay
          ? null
          : FloatingActionButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    showPay = true;
                  });
                  FocusScope.of(context).unfocus();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.white,
                      elevation: 1,
                      content: Text(
                        'Payment must be atleast ₹1',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }
              },
              mini: true,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
            ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 49, 50, 56),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                    color: Colors.white,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showSSS = !showSSS;
                      });
                    },
                    icon: const Icon(
                      Icons.info_outline,
                      size: 30,
                    ),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      print('more');
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Avatar(
                name: widget.upiMap!['pa'] != null
                    ? widget.upiMap!['pa']!.toUpperCase()
                    : 'P ',
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Paying to ${widget.upiMap!['pn']!.replaceAll("%20", " ")}",
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              showSSS
                  ? const Text(
                      "Rahul",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  : const SizedBox(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                    "Paying to ${widget.upiMap!['pa']!.replaceAll("%20", " ")}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "₹",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 50),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      autofocus: true,
                      controller: _controller,
                      onChanged: (String value) {},
                      onTap: () {
                        setState(() {
                          showPay = false;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '0',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: const Color.fromARGB(255, 79, 80, 86),
                  child: const TextField(
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add a note',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              !showPay
                  ? const SizedBox()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 64, 65, 70),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CHOOSE ACCOUNT TO PAY WITH",
                              style: TextStyle(
                                color: Color.fromARGB(255, 206, 206, 211),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  color: Colors.white,
                                  width: 70,
                                  height: 35,
                                  child: Image.asset("assets/images/SBI.png"),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "State Bank of India ····2049",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Savings Account",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 206, 206, 211),
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // pay button blue300
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentDone(
                                          amount: "₹${_controller.text}",
                                          name: widget.upiMap!['pn']!
                                              .replaceAll("%20", " "),
                                          SSS: showSSS,
                                          pa: widget.upiMap!['pa']!
                                              .replaceAll("%20", " "),
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[400],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17.5),
                                    ),
                                  ),
                                  child: Text(
                                    "PAY ₹${_controller.text}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Powered by",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 206, 206, 211),
                                        fontSize: 12),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Image(
                                        image:
                                            AssetImage("assets/images/UPI.png"),
                                        width: 40,
                                        height: 40,
                                        color:
                                            Color.fromARGB(255, 206, 206, 211),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("|",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 206, 206, 211),
                                              fontSize: 20)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "assets/images/SBILOGO.png"),
                                        width: 40,
                                        height: 40,
                                        color:
                                            Color.fromARGB(255, 206, 206, 211),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
