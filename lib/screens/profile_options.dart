import 'package:flutter/material.dart';

// ==========================================
// 1. My Orders Screen
// ==========================================
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Orders', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: 3, // Dummy orders 3k pennanawa
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFFE8F5E9), shape: BoxShape.circle),
                child: const Icon(Icons.local_shipping, color: Colors.green),
              ),
              title: Text('Order #AD${1000 + index}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Status: Delivered\nTotal: Rs. 4500'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 2. Shipping Addresses Screen
// ==========================================
class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Shipping Addresses', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD81B60)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Icon(Icons.home, color: Color(0xFFD81B60), size: 30),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Home Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 5),
                        Text('Nikaweratiya, North Western Province, Sri Lanka'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD81B60),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Add New Address', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. Payment Methods Screen (Sri Lanka Update)
// ==========================================
class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment Methods', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Saved Cards', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          
          // 1. Credit/Debit Card
          ListTile(
            leading: const Icon(Icons.credit_card, color: Colors.blue, size: 30),
            title: const Text('Credit / Debit Card (PayHere)'),
            subtitle: const Text('Visa, Mastercard accepted'),
            trailing: const Icon(Icons.check_circle, color: Color(0xFFD81B60)), // Active kiyala pennanna
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: const Color(0xFFD81B60).withOpacity(0.5))),
            tileColor: const Color(0xFFFCE4EC).withOpacity(0.3),
          ),
          const SizedBox(height: 25),

          const Text('Other Methods', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          // 2. Cash on Delivery
          ListTile(
            leading: const Icon(Icons.money, color: Colors.green, size: 30),
            title: const Text('Cash on Delivery (COD)'),
            subtitle: const Text('Pay when you receive the package'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
            onTap: () {},
          ),
          const SizedBox(height: 15),

          // 3. Koko (Buy Now Pay Later)
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.pinkAccent, borderRadius: BorderRadius.circular(5)),
              child: const Text('Koko', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: const Text('Koko - Buy Now Pay Later'),
            subtitle: const Text('Pay in 3 interest-free installments'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
            onTap: () {},
          ),
          const SizedBox(height: 15),

          // 4. Bank Transfer
          ListTile(
            leading: const Icon(Icons.account_balance, color: Colors.indigo, size: 30),
            title: const Text('Direct Bank Transfer'),
            subtitle: const Text('BOC, Commercial, Sampath, etc.'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
            onTap: () {},
          ),
          const SizedBox(height: 15),

          // 5. Mobile Wallets
          ListTile(
            leading: const Icon(Icons.phone_android, color: Colors.orange, size: 30),
            title: const Text('Mobile Wallets'),
            subtitle: const Text('eZ Cash, mCash, FriMi'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. Settings Screen
// ==========================================
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Push Notifications'),
            value: true,
            onChanged: (val) {},
            activeColor: const Color(0xFFD81B60),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: false,
            onChanged: (val) {},
            activeColor: const Color(0xFFD81B60),
          ),
          const ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 5. Privacy Policy Screen
// ==========================================
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Privacy Policy', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Shashin Clothing Store Privacy Policy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Text(
              'Welcome to our Privacy Policy page. When you use our store services, you trust us with your information. This Privacy Policy is meant to help you understand what data we collect, why we collect it, and what we do with it. \n\nWe build a range of services that help millions of people daily to explore and interact with the world in new ways. Our services include: \n\n- Clothing store mobile applications \n- Digital services and platforms \n\nWe ensure that your data is safe and secure. \n\n\n contact number : 0750901189',
              style: TextStyle(height: 1.5, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}