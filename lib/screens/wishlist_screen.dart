import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String userId =
        FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Wishlist"),
      ),

      body: StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("wishlist")
            .snapshots(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final wishlistItems =
              snapshot.data!.docs;

          if (wishlistItems.isEmpty) {

            return const Center(
              child: Text(
                "No Wishlist Items",
              ),
            );
          }

          return ListView.builder(

            itemCount: wishlistItems.length,

            itemBuilder: (context, index) {

              final item =
                  wishlistItems[index];

              return ListTile(

                leading: Image.network(
                  item["image"],
                  width: 60,
                  fit: BoxFit.cover,
                ),

                title: Text(item["name"]),

                subtitle: Text(item["price"]),

                trailing: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}