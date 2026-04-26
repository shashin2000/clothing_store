import 'package:flutter/material.dart';
import '../models/product.dart';
import 'details_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Categories list eka (Images ekka)
  final List<Map<String, dynamic>> _categories = const [
    {'title': 'All', 'image': 'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?w=500'},
    {'title': 'Women', 'image': 'https://images.unsplash.com/photo-1617922001439-4a2e6562f328?w=500'},
    {'title': 'Men', 'image': 'https://images.unsplash.com/photo-1617137968427-85924c800a22?w=500'},
    {'title': 'Kids', 'image': 'https://img.kwcdn.com/product/fancy/961fc1c0-16d4-41d4-b7b8-04af125a4bfb.jpg?imageView2/2/w/500/q/60/format/webp'},
    {'title': 'Sportswear', 'image': 'https://images.unsplash.com/photo-1483721310020-03333e577078?w=500'},
    {'title': 'Winter', 'image': 'https://images.unsplash.com/photo-1539533018447-63fcce2678e3?w=500'},
    {'title': 'Party', 'image': 'https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?w=500'},
  ];

  int _selectedCategoryIndex = 0; 
  int _bottomNavIndex = 0; 

  // --- Search weda karawanna ona Variables ---
  List<Product> _foundProducts = [];

  @override
  void initState() {
    super.initState();
    // Mulinma app eka load weddi okkoma items pennanna ona nisa
    _foundProducts = dummyProducts;
  }

  // --- Search Filter Function Eka ---
  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      // Type karala nethnam okkoma pennanawa
      results = dummyProducts;
    } else {
      // Type karana akuru walata match wena ewa witharak gannawa
      results = dummyProducts
          .where((item) => item.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Screen eka update karanna setState karanawa
    setState(() {
      _foundProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // --- TOP APP BAR ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.grid_view_rounded, color: Colors.black),
          onPressed: () {},
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back', style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text('Shashin Pramodaya', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=100&q=80'),
            ),
          )
        ],
      ),

      // --- MAIN BODY ---
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // 1. SEARCH BAR
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) => _runFilter(value), // Methana thamay filter function eka call wenne
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search for clothes...',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. CATEGORIES ROW (Roum Images)
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = _selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected ? const Color(0xFFD81B60) : Colors.transparent, 
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: const Color(0xFFEEEEEE),
                                backgroundImage: NetworkImage(_categories[index]['image']),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _categories[index]['title'],
                              style: TextStyle(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected ? const Color(0xFFD81B60) : Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),

              // 3. PROMO BANNER EKA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFCE4EC), 
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('New Collection', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFD81B60))),
                          const SizedBox(height: 5),
                          const Text('Discount 50% for\nthe first transaction', style: TextStyle(fontSize: 12, color: Colors.black87)),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD81B60),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                            child: const Text('Shop Now', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3225/3225209.png', 
                      height: 100,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // 4. PRODUCT GRID EKA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All', style: TextStyle(color: Color(0xFFD81B60))),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              
              // Den methana Grid eke pennanne Search wechcha Items tika (_foundProducts)
              _foundProducts.isEmpty 
              ? const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(child: Text('No clothes found!', style: TextStyle(color: Colors.grey, fontSize: 16))),
                )
              : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _foundProducts.length, // Meka wenas wela thiyenne
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final product = _foundProducts[index]; // Meka wenas wela thiyenne
                  
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: product),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(
                                  product.imageUrl,
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.favorite_border, size: 18, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rs. ${product.price.toStringAsFixed(0)}',
                                      style: const TextStyle(color: Color(0xFFD81B60), fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                                      child: const Icon(Icons.add, color: Colors.white, size: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: const Color(0xFFD81B60),
        unselectedItemColor: const Color(0xFF9E9E9E),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
          
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriesScreen()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}