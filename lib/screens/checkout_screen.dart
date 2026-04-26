import 'package:flutter/material.dart';
import 'success_screen.dart';
import 'card_payment_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Payment methods thoraganna index eka
  int _selectedPaymentIndex = 0;

  // Lankawe pawichi wena payment methods list eka
  final List<Map<String, dynamic>> _paymentMethods = [
    {'title': 'Credit / Debit Card', 'icon': Icons.credit_card, 'color': Colors.blue},
    {'title': 'Cash on Delivery (COD)', 'icon': Icons.money, 'color': Colors.green},
    {'title': 'Koko (Pay in 3)', 'icon': Icons.shopping_bag, 'color': Colors.pinkAccent},
    {'title': 'Bank Transfer', 'icon': Icons.account_balance, 'color': Colors.indigo},
  ];

  // Address ekayi namayi default penna controllers hadagannawa
  final TextEditingController _nameController = TextEditingController(text: 'Shashin Pramodaya');
  final TextEditingController _addressController = TextEditingController(text: 'Nikaweratiya, North Western Province, Sri Lanka');
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Shipping Address Section ---
            const Text('Shipping Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _addressController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Delivery Address',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: '07X XXX XXXX',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
            const SizedBox(height: 35),

            // --- 2. Select Payment Method Section ---
            const Text('Select Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Payment Methods list eka render kireema
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _paymentMethods.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedPaymentIndex == index;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPaymentIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFFCE4EC) : Colors.white,
                      border: Border.all(
                        color: isSelected ? const Color(0xFFD81B60) : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(_paymentMethods[index]['icon'], color: _paymentMethods[index]['color'], size: 28),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            _paymentMethods[index]['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? const Color(0xFFD81B60) : Colors.black87,
                            ),
                          ),
                        ),
                        // Select wela nam check mark eka pennanawa
                        if (isSelected)
                          const Icon(Icons.check_circle, color: Color(0xFFD81B60)),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

            // --- 3. Place Order Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedPaymentIndex == 0) {
                    // Credit/Debit Card eka select kaloth Card Payment Screen ekata yanawa
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CardPaymentScreen()),
                    );
                  } else {
                    // Anith ewata (COD, Koko wage) direct Success Screen ekata yanawa
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SuccessScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD81B60),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                ),
                child: Text(
                  _selectedPaymentIndex == 0 ? 'Proceed to Pay' : 'Place Order', 
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}