class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String category; // Meka aluthen add kale

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.category, // Meka add kala
  });
}

// Dummy data list eka - Pure Clothing Items
List<Product> dummyProducts = [
  // --- MEN CATEGORY ---
  Product(
    id: 'p1',
    title: 'Premium Cotton T-Shirt',
    price: 1800.00,
    imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
    category: 'Men',
  ),
  Product(
    id: 'p2',
    title: 'Classic Denim Jeans',
    price: 4500.00,
    imageUrl: 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500',
    category: 'Men',
  ),
  Product(
    id: 'p3',
    title: 'Formal Long Sleeve Shirt',
    price: 3500.00,
    imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2020/10/XC/DL/SO/92086267/men-formal-shirts-1000x1000.jpg',
    category: 'Men',
  ),

  // --- WOMEN CATEGORY ---
  Product(
    id: 'p4',
    title: 'Floral Summer Dress',
    price: 3200.00,
    imageUrl: 'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=500',
    category: 'Women',
  ),
  Product(
    id: 'p5',
    title: 'Casual Office Blouse',
    price: 2800.00,
    imageUrl: 'https://images.unsplash.com/photo-1604695573706-53170668f6a6?w=500',
    category: 'Women',
  ),
  Product(
    id: 'p6',
    title: 'Denim Midi Skirt',
    price: 3000.00,
    imageUrl: 'https://images.unsplash.com/photo-1582142407894-ec85a1260a46?w=500',
    category: 'Women',
  ),

  // --- KIDS CATEGORY ---
  Product(
    id: 'p7',
    title: 'Kids Cute Hoodie',
    price: 2500.00,
    imageUrl: 'https://tse1.mm.bing.net/th/id/OIP.V4MYNvggVEZ_GW8azXOq6wHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
    category: 'Kids',
  ),
  Product(
    id: 'p8',
    title: 'Boy\'s Cotton T-Shirt',
    price: 1500.00,
    imageUrl: 'https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=500',
    category: 'Kids',
  ),

  // --- SPORTSWEAR CATEGORY ---
  Product(
    id: 'p9',
    title: 'Men\'s Gym T-Shirt',
    price: 2200.00,
    imageUrl: 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=500',
    category: 'Sportswear',
  ),
  Product(
    id: 'p10',
    title: 'Women\'s Yoga Pants',
    price: 3500.00,
    imageUrl: 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=500',
    category: 'Sportswear',
  ),

  // --- WINTER CATEGORY ---
  Product(
    id: 'p11',
    title: 'Men\'s Leather Jacket',
    price: 12500.00,
    imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500',
    category: 'Winter',
  ),
  Product(
    id: 'p12',
    title: 'Women\'s Winter Coat',
    price: 14000.00,
    imageUrl: 'https://images.unsplash.com/photo-1539533018447-63fcce2678e3?w=500',
    category: 'Winter',
  ),

  // --- PARTY CATEGORY ---
  Product(
    id: 'p13',
    title: 'Elegant Evening Gown',
    price: 18500.00,
    imageUrl: 'https://www.1oaksl.com/cdn/shop/products/J1A5662_540x.jpg?v=1654938265',
    category: 'Party',
  ),
  Product(
    id: 'p14',
    title: 'Men\'s Party Blazer',
    price: 15000.00,
    imageUrl: 'https://images.unsplash.com/photo-1592878904946-b3cd8ae243d0?w=500',
    category: 'Party',
  ),
];

// Oya kalin hadapu globalCartItems eka methana thiyenna arinna...
List<Map<String, dynamic>> globalCartItems = [];