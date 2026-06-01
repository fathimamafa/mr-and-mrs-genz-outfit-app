import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  IconData getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'men':
        return Icons.man;
      case 'women':
        return Icons.woman;
      case 'shoes':
        return Icons.shopping_bag;
      case 'jackets':
        return Icons.checkroom;
      case 'accessories':
        return Icons.watch;
      case 'couple sets':
        return Icons.favorite;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xffFF3D5A);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 12),
        width: 90,
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                getCategoryIcon(title),
                size: 28,
                color: isSelected
                    ? Colors.white
                    : Colors.black87,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}