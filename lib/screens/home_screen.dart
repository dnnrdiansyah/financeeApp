import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Finance Mate',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/onepiece.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.25, 
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF7426FC),
                    Color(0xFF0A0A0A),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome Back 👋',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Your Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Rp 77.850.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            
            const Text(
              'My Cards',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank BRI',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color(0xFF7426FC),
                    color2: Color(0xFF1A1A1A),
                    backgroundImage: 'assets/images/luffy.jpg',
                  ),
                  AtmCard(
                    bankName: 'Bank BNI',
                    cardNumber: '**** 9899',
                    balance: 'Rp5.350.000',
                    color1: Color(0xFF7426FC),
                    color2: Color(0xFF1A1A1A),
                    backgroundImage: 'assets/images/gear5.png',
                  ),
                  AtmCard(
                    bankName: 'Bank Mandiri',
                    cardNumber: '**** 8975',
                    balance: 'Rp50.000.000',
                    color1: Color(0xFF7426FC),
                    color2: Color(0xFF1A1A1A),
                    backgroundImage: 'assets/images/zoro.jpg',
                  ),
                  AtmCard(
                    bankName: 'Bank BJB',
                    cardNumber: '**** 1182',
                    balance: 'Rp10.000.000',
                    color1: Color(0xFF7426FC),
                    color2: Color(0xFF1A1A1A),
                    backgroundImage: 'assets/images/sanji.jpeg',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

          
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(icon: Icons.health_and_safety, label: 'Health'),
                GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                GridMenuItem(icon: Icons.event, label: 'Event'),
              ],
            ),

            const SizedBox(height: 24),

          
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
