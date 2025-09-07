import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: 17,

                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    iconSize: 20,
                    color: Colors.purple,
                    onPressed: () {
                      final snackbar= SnackBar(content: Text('"Item added to the cart', style: TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontStyle: FontStyle.normal
                        ),), 
                        backgroundColor: Colors.purple,
                      duration: Duration(seconds: 1),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Suwannaphum',
                fontStyle: FontStyle.normal
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            price.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontFamily: 'Suwannaphum',
              fontStyle: FontStyle.normal
            ),
          ),
        ],
      ),
    );
  }
}
