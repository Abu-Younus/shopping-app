import 'package:flutter/material.dart';

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  MyBagState createState() => MyBagState();
}

class MyBagState extends State<MyBag> {
  // Initial item data including image
  List<Map<String, dynamic>> items = [
    {
      "name": "Pullover",
      "color": "Black",
      "size": "L",
      "price": 51,
      "quantity": 1,
      "image": "assets/images/pullover.png"
      // Replace with your actual image path
    },
    {
      "name": "T-Shirt",
      "color": "Gray",
      "size": "L",
      "price": 30,
      "quantity": 1,
      "image": "assets/images/tshirt.png" // Replace with your actual image path
    },
    {
      "name": "Sport Dress",
      "color": "Black",
      "size": "M",
      "price": 43,
      "quantity": 1,
      "image": "assets/images/sport_dress.png"
      // Replace with your actual image path
    },
  ];

  // Calculate the total price
  double get _totalPrice {
    return items.fold(
        0, (total, item) => total + item['price'] * item['quantity']);
  }

  // Increase the item quantity
  void _increaseQuantity(int index) {
    setState(() {
      items[index]['quantity']++;
    });
  }

  // Decrease the item quantity
  void _decreaseQuantity(int index) {
    if (items[index]['quantity'] > 1) {
      setState(() {
        items[index]['quantity']--;
      });
    }
  }

  // Show a Snackbar on Checkout
  void _checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Congratulations! Checkout successful!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bag',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display the list of items in the bag
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Item Image
                          Expanded(
                            child: Image.asset(
                              item['image'],
                              width: 70,
                              height: 70,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Space between image and details

                          // Item Details
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['name'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Color: ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: item['color'],
                                        style: const TextStyle(
                                            color: Colors
                                                .black), // Black text for the actual color
                                      ),
                                      const TextSpan(
                                        text: '  Size: ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: item['size'],
                                        style: const TextStyle(
                                            color: Colors
                                                .black), // Black text for the actual size
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove,
                                          color: Colors.grey),
                                      onPressed: () => _decreaseQuantity(index),
                                    ),
                                    Text(item['quantity'].toString()),
                                    IconButton(
                                      icon: const Icon(Icons.add,
                                          color: Colors.grey),
                                      onPressed: () => _increaseQuantity(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Price and Options Button with space in between
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.more_vert, color: Colors.grey),
                                onPressed: () {
                                  // Add functionality for the options button if needed
                                },
                              ),
                              const SizedBox(height: 10),
                              // Space between price and options button
                              Text('${item['price'] * item['quantity']}\$',
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Display the total amount
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total amount:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  Text('${_totalPrice.toStringAsFixed(2)}\$',
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            // Checkout button
            InkWell(
              onTap: _checkout,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: double.maxFinite,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(32)),
                child: Text(
                  'Check Out'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
