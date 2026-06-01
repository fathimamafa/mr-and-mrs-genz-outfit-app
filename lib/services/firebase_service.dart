import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  // =========================
  // AUTH
  // =========================

  User? get currentUser => _auth.currentUser;

  String get uid => _auth.currentUser!.uid;

  Future<User?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;

      if (user != null) {
        await _firestore
            .collection("users")
            .doc(user.uid)
            .set({
          "uid": user.uid,
          "name": name,
          "email": email,
          "profileImage": "",
          "createdAt":
              FieldValue.serverTimestamp(),
        });
      }

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // =========================
  // USER PROFILE
  // =========================

  Future<DocumentSnapshot> getUserProfile() async {
    return await _firestore
        .collection("users")
        .doc(uid)
        .get();
  }

  Future<void> updateProfileImageUrl(
      String imageUrl) async {
    await _firestore
        .collection("users")
        .doc(uid)
        .update({
      "profileImage": imageUrl,
    });
  }

  Future<void> updateProfile({
    required String name,
  }) async {
    await _firestore
        .collection("users")
        .doc(uid)
        .update({
      "name": name,
    });
  }

  // =========================
  // WISHLIST
  // =========================

  Stream<QuerySnapshot> getWishlistItems() {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("wishlist")
        .orderBy("createdAt",
            descending: true)
        .snapshots();
  }

  Future<void> addToWishlist({
    required Map<String, dynamic> product,
  }) async {
    await _firestore
        .collection("users")
        .doc(uid)
        .collection("wishlist")
        .doc(product["id"])
        .set({
      ...product,
      "createdAt":
          FieldValue.serverTimestamp(),
    });
  }

  Future<void> removeFromWishlist(
      String productId) async {
    await _firestore
        .collection("users")
        .doc(uid)
        .collection("wishlist")
        .doc(productId)
        .delete();
  }

  // =========================
  // CART
  // =========================

  Future<void> addToCart({
    required Map<String, dynamic> product,
  }) async {
    try {
      DocumentReference cartDoc = _firestore
          .collection("users")
          .doc(uid)
          .collection("cart")
          .doc(product["id"]);

      DocumentSnapshot snapshot =
          await cartDoc.get();

      if (snapshot.exists) {
        int currentQty =
            snapshot["quantity"] ?? 1;

        await cartDoc.update({
          "quantity": currentQty + 1,
        });
      } else {
        await cartDoc.set({
          ...product,
          "quantity": 1,
          "createdAt":
              FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> getCartItems() {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("cart")
        .orderBy(
          "createdAt",
          descending: true,
        )
        .snapshots();
  }

  Future<void> updateCartQuantity({
    required String productId,
    required int quantity,
  }) async {
    try {
      if (quantity <= 0) {
        await removeCartItem(productId);
        return;
      }

      await _firestore
          .collection("users")
          .doc(uid)
          .collection("cart")
          .doc(productId)
          .update({
        "quantity": quantity,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeCartItem(
      String productId) async {
    await _firestore
        .collection("users")
        .doc(uid)
        .collection("cart")
        .doc(productId)
        .delete();
  }

  Future<double> getCartTotal() async {
    QuerySnapshot snapshot =
        await _firestore
            .collection("users")
            .doc(uid)
            .collection("cart")
            .get();

    double total = 0;

    for (var doc in snapshot.docs) {
      Map<String, dynamic> data =
          doc.data()
              as Map<String, dynamic>;

      double price =
          (data["price"] ?? 0)
              .toDouble();

      int quantity =
          data["quantity"] ?? 1;

      total += price * quantity;
    }

    return total;
  }

  // =========================
  // ORDERS
  // =========================

  Stream<QuerySnapshot> getOrders() {
    return _firestore
        .collection("orders")
        .where("userId",
            isEqualTo: uid)
        .orderBy(
          "createdAt",
          descending: true,
        )
        .snapshots();
  }

  Future<void> placeOrder() async {
    QuerySnapshot cartSnapshot =
        await _firestore
            .collection("users")
            .doc(uid)
            .collection("cart")
            .get();

    if (cartSnapshot.docs.isEmpty) {
      return;
    }

    double total = 0;

    List<Map<String, dynamic>>
        orderItems = [];

    for (var item
        in cartSnapshot.docs) {
      Map<String, dynamic> data =
          item.data()
              as Map<String, dynamic>;

      double price =
          (data["price"] ?? 0)
              .toDouble();

      int quantity =
          data["quantity"] ?? 1;

      total += price * quantity;

      orderItems.add(data);
    }

    await _firestore
        .collection("orders")
        .add({
      "userId": uid,
      "items": orderItems,
      "total": total,
      "status": "Pending",
      "createdAt":
          FieldValue.serverTimestamp(),
    });

    // Clear Cart
    for (var item
        in cartSnapshot.docs) {
      await item.reference.delete();
    }
  }

  // =========================
  // PRODUCTS
  // =========================

  Stream<QuerySnapshot> getProducts() {
    return _firestore
        .collection("products")
        .snapshots();
  }

  Future<DocumentSnapshot> getProduct(
      String productId) async {
    return await _firestore
        .collection("products")
        .doc(productId)
        .get();
  }
}