import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {
  String selectedSize = "M";
  String selectedColor = "Black";

  int quantity = 1;

  bool isFavorite = false;
  bool isLoading = false;

  final List<String> sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  final List<Map<String, dynamic>> colors = [
    {
      "name": "Black",
      "color": Colors.black,
    },
    {
      "name": "Blue",
      "color": Colors.blue,
    },
    {
      "name": "Red",
      "color": Colors.red,
    },
    {
      "name": "Pink",
      "color": Colors.pink,
    },
    {
      "name": "Green",
      "color": Colors.green,
    },
  ];

  Future<void> addToCart() async {
    try {
      setState(() => isLoading = true);

      final user =
          FirebaseAuth.instance.currentUser;

      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "Please login first",
            ),
          ),
        );

        return;
      }

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("cart")
          .add({
        "productId": widget.product.id,
        "name": widget.product.name,
        "price": widget.product.price,
        "image": widget.product.image,
        "category": widget.product.category,
        "size": selectedSize,
        "color": selectedColor,
        "quantity": quantity,
        "createdAt": Timestamp.now(),
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Added to cart successfully",
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> buyNow() async {
    await addToCart();

    if (!mounted) return;

    Navigator.pushNamed(
      context,
      "/checkout",
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// TOP BAR
              Padding(
                padding:
                    const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context);
                        },
                      ),
                    ),

                    const Spacer(),

                    CircleAvatar(
                      backgroundColor:
                          Colors.white,
                      child: IconButton(
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons
                                  .favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite =
                                !isFavorite;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              /// IMAGE
              Container(
                height: 320,
                margin:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(
                    25,
                  ),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                    25,
                  ),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder:
                        (_, __, ___) =>
                            const Icon(
                      Icons.image,
                      size: 120,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// DETAILS
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(24),
                decoration:
                    const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(
                    top:
                        Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      product.category,
                      style: TextStyle(
                        color: Colors
                            .grey.shade600,
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    Text(
                      product.name,
                      style:
                          const TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                        height: 12),

                    Text(
                      product.price,
                      style:
                          const TextStyle(
                        fontSize: 26,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    Text(
                      product.description,
                      style: TextStyle(
                        color: Colors
                            .grey.shade700,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(
                        height: 30),

                    /// SIZE
                    const Text(
                      "Select Size",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    Wrap(
                      spacing: 10,
                      children:
                          sizes.map((size) {
                        return ChoiceChip(
                          label:
                              Text(size),
                          selected:
                              selectedSize ==
                                  size,
                          onSelected:
                              (_) {
                            setState(() {
                              selectedSize =
                                  size;
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(
                        height: 30),

                    /// COLORS
                    const Text(
                      "Select Color",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    Row(
                      children:
                          colors.map((c) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor =
                                  c["name"];
                            });
                          },
                          child: Container(
                            margin:
                                const EdgeInsets
                                    .only(
                              right: 10,
                            ),
                            width: 40,
                            height: 40,
                            decoration:
                                BoxDecoration(
                              color:
                                  c["color"],
                              shape: BoxShape
                                  .circle,
                              border:
                                  Border.all(
                                width: 3,
                                color: selectedColor ==
                                        c["name"]
                                    ? Colors
                                        .black
                                    : Colors
                                        .transparent,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(
                        height: 30),

                    /// QUANTITY
                    const Text(
                      "Quantity",
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons
                                .remove_circle,
                          ),
                          onPressed: () {
                            if (quantity >
                                1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                        ),

                        Text(
                          quantity
                              .toString(),
                          style:
                              const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                          ),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 40),

                    /// BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child:
                              ElevatedButton
                                  .icon(
                            onPressed:
                                isLoading
                                    ? null
                                    : addToCart,
                            icon:
                                const Icon(
                              Icons
                                  .shopping_cart,
                            ),
                            label:
                                const Text(
                              "Add To Cart",
                            ),
                          ),
                        ),

                        const SizedBox(
                            width: 12),

                        Expanded(
                          child:
                              ElevatedButton(
                            onPressed:
                                isLoading
                                    ? null
                                    : buyNow,
                            style:
                                ElevatedButton
                                    .styleFrom(
                              backgroundColor:
                                  Colors.red,
                              foregroundColor:
                                  Colors.white,
                            ),
                            child:
                                const Text(
                              "Buy Now",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}