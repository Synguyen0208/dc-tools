import 'package:flutter/material.dart';
import 'package:store/app.dart';
import 'package:store/models/entities/category.dart';
import 'package:store/screens/product/product_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => App.navigatorKey.currentState?.pushNamed(
        "product",
        arguments: ProductArgument(
          categoryId: category.id,
          sortBy: "ctime",
          title: category.name,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 200,
            width: double.infinity,
            child: Image.network(
              category.image,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const Image(
                          image: AssetImage('assets/logo.jpg'),
                          fit: BoxFit.cover,
                        ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5),
            ),
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
