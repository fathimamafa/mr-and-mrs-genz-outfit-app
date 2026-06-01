import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
  });

  @override
  State<CheckoutScreen> createState() =>
      _CheckoutScreenState();
}

class _CheckoutScreenState
    extends State<CheckoutScreen> {

  final FirebaseService firebaseService =
      FirebaseService();

  double total = 0;

  bool loading = true;

  final nameController =
      TextEditingController();

  final phoneController =
      TextEditingController();

  final addressController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTotal();
  }

  Future<void> loadTotal() async {
    total =
        await firebaseService
            .getCartTotal();

    setState(() {
      loading = false;
    });
  }

  Future<void> placeOrder() async {

    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content:
              Text("Fill all fields"),
        ),
      );
      return;
    }

    await firebaseService.placeOrder();

    if (!mounted) return;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
        title: const Text(
          "Order Successful",
        ),
        content: const Text(
          "Thank you for shopping with Mr & Mrs Gen Z Outfit",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {
      return const Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller:
                  nameController,
              decoration:
                  const InputDecoration(
                labelText: "Full Name",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  phoneController,
              decoration:
                  const InputDecoration(
                labelText: "Phone",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  addressController,
              maxLines: 3,
              decoration:
                  const InputDecoration(
                labelText: "Address",
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                title:
                    const Text(
                  "Total Amount",
                ),
                trailing: Text(
                  "LKR ${total.toStringAsFixed(0)}",
                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width:
                  double.infinity,
              height: 55,

              child:
                  ElevatedButton(
                onPressed:
                    placeOrder,

                child:
                    const Text(
                  "Place Order",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}