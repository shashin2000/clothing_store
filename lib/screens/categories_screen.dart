import 'package:flutter/material.dart';
import 'category_items_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

// Categories pennanna ona data tika (Only Clothing)
  final List<Map<String, dynamic>> _categories = const [
    {'title': 'Women', 'icon': Icons.woman, 'image': 'https://images.unsplash.com/photo-1617922001439-4a2e6562f328?w=500'},
    {'title': 'Men', 'icon': Icons.man, 'image': 'https://images.unsplash.com/photo-1617137968427-85924c800a22?w=500'},
    {'title': 'Kids', 'icon': Icons.child_care, 'image': 'https://images.unsplash.com/photo-1519241047957-be31d7379a5d?w=500'},
    {'title': 'Sportswear', 'icon': Icons.directions_run, 'image': 'https://images.unsplash.com/photo-1483721310020-03333e577078?w=500'},
    {'title': 'Winter', 'icon': Icons.ac_unit, 'image': 'https://images.unsplash.com/photo-1539533018447-63fcce2678e3?w=500'},
    {'title': 'Party', 'icon': Icons.celebration, 'image': 'https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?w=500'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: _categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Row ekakata items 2k
            childAspectRatio: 0.85, // Box eke size eka
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // 1. Thoragaththu category eke nama wenama aragannawa
                final String selectedCategory = _categories[index]['title'];

                // 2. E nama pass karala CategoryItemsScreen eka open karanawa
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryItemsScreen(
                      categoryName: selectedCategory,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // Background image eka lassanata danna
                  image: DecorationImage(
                    image: NetworkImage(_categories[index]['image']),
                    fit: BoxFit.cover,
                    // Text eka pehediliwa penna image eka poddak kalu karanawa
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, offset: const Offset(0, 3)),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_categories[index]['icon'], color: Colors.white, size: 40),
                      const SizedBox(height: 10),
                      Text(
                        _categories[index]['title'],
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}