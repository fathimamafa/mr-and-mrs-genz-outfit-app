import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final FirebaseService firebaseService =
      FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),

      body: StreamBuilder(
        stream: firebaseService.getCartItems(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final items =
              snapshot.data!.docs;

          if (items.isEmpty) {
            return const Center(
              child: Text(
                "Cart is Empty",
              ),
            );
          }

          return Column(
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder:
                      (context, index) {

                    final item =
                        items[index];

                    final data =
                        item.data()
                            as Map<String, dynamic>;

                    return Card(
                      margin:
                          const EdgeInsets.all(10),

                      child: ListTile(
                        leading:
                            Image.network(
                          data["image"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),

                        title: Text(
                          data["name"],
                        ),

                        subtitle: Text(
                          "Size: ${data["size"]}\n"
                          "Color: ${data["color"]}\n"
                          "Qty: ${data["quantity"]}",
                        ),

                        trailing: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                          children: [

                            Text(
                              "LKR ${data["price"]}",
                            ),

                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color:
                                    Colors.red,
                              ),
                              onPressed: () {
                                firebaseService
                                    .removeCartItem(
                                  item.id,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.all(16),

                child: SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  CheckoutScreen(),
                        ),
                      );
                    },

                    child: const Text(
                      "Proceed To Checkout",
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}