import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/cashback_transaction.dart';

class CashbackHistoryDetailsPage extends StatelessWidget {
  final CashbackTransaction transaction;

  const CashbackHistoryDetailsPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cashback Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transaction Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildDetailRow("Booking Details", transaction.bookingDetails),
            const SizedBox(height: 16),
            _buildDetailRow("Amount Earned", "₦${transaction.amount.toStringAsFixed(2)}"),
            const SizedBox(height: 16),
            _buildDetailRow("Transaction Date",  DateFormat('yMMMd').format(transaction.date)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
