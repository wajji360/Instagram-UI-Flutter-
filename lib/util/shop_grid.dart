import 'package:flutter/material.dart';

// ---------------- CHIP WIDGET ----------------
class CategoryChip extends StatelessWidget {
  final String text;
  final bool selected;

  const CategoryChip({
    super.key,
    required this.text,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ---------------- UI WIDGET FOR SHOP PAGE ----------------
class ExploreShop extends StatelessWidget {
  const ExploreShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- CATEGORY CHIPS ----------
        SizedBox(
          height: 45,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                CategoryChip(text: "Shop", selected: true),
                CategoryChip(text: "Beauty"),
                CategoryChip(text: "Clothing"),
                CategoryChip(text: "Electronics"),
                CategoryChip(text: "Home"),
                CategoryChip(text: "Sports"),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ---------- PRODUCT GRID ----------
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(2),
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey[300],
                child: Image.network(
                  "https://picsum.photos/500?random=$index",
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
