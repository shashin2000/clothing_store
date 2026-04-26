import 'package:flutter/material.dart';
import 'success_screen.dart';
import '../models/product.dart'; // Total price eka ganna meka import karanawa

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  // Card eke penna ona variable tika
  String cardNumber = '**** **** **** ****';
  String expiryDate = 'MM/YY';
  String cardHolderName = 'CARDHOLDER NAME';

  // Cart eken total amount eka gannawa
  double get _totalPrice {
    double total = 0;
    for (var item in globalCartItems) {
      total += (item['product'].price * item['quantity']);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Payments', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD81B60)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. VISUAL CARD UI ---
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A), // Dark blackish color
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.memory, color: Colors.amber, size: 40), // Chip Icon
                      Text('BANK NAME', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(
                    cardNumber,
                    style: const TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 2, fontFamily: 'Courier'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('CARDHOLDER NAME', style: TextStyle(color: Colors.white54, fontSize: 10)),
                          const SizedBox(height: 5),
                          Text(
                            cardHolderName.isEmpty ? 'CARDHOLDER NAME' : cardHolderName.toUpperCase(),
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('MONTH/YEAR', style: TextStyle(color: Colors.white54, fontSize: 10)),
                          const SizedBox(height: 5),
                          Text(
                            expiryDate,
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Mastercard podi logo eka (Roum deken hadala thiyenne)
                      SizedBox(
                        width: 40,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 15,
                              child: Container(width: 20, height: 20, decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.8), shape: BoxShape.circle)),
                            ),
                            Container(width: 20, height: 20, decoration: BoxDecoration(color: Colors.red.withOpacity(0.8), shape: BoxShape.circle)),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),

            // --- 2. INPUT FORMS ---
            _buildInputField(
              label: 'Card Number',
              hint: 'XXXX XXXX XXXX XXXX',
              keyboardType: TextInputType.number,
              maxLength: 19,
              onChanged: (value) {
                setState(() {
                  cardNumber = value.isEmpty ? '**** **** **** ****' : value;
                });
              },
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    label: 'Expiry Date',
                    hint: 'MM/YY',
                    keyboardType: TextInputType.datetime,
                    maxLength: 5,
                    onChanged: (value) {
                      setState(() {
                        expiryDate = value.isEmpty ? 'MM/YY' : value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildInputField(
                    label: 'CVC/CVV',
                    hint: '123',
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    onChanged: (value) {}, // CVV eka card ekata auto danna ona na
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            _buildInputField(
              label: 'Customer Name',
              hint: 'Shashin Pramodaya',
              keyboardType: TextInputType.name,
              onChanged: (value) {
                setState(() {
                  cardHolderName = value;
                });
              },
            ),
            const SizedBox(height: 40),

            // --- 3. PAY BUTTON ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Pay kalata passe success screen ekata yanawa
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SuccessScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD81B60), // Figma pink color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Pay Rs. ${_totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text fields design karanna podi widget function ekak
  Widget _buildInputField({
    required String label,
    required String hint,
    required TextInputType keyboardType,
    int? maxLength,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 5),
        TextField(
          keyboardType: keyboardType,
          maxLength: maxLength,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            counterText: "", // Max length dammahama ena counter text eka ain karanawa
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD81B60), width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          ),
        ),
      ],
    );
  }
}