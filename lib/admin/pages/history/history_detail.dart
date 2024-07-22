import 'package:app_shop_dien_tu/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetailAdmin extends StatelessWidget {
  final List<BillDetailModel> bill;
  const HistoryDetailAdmin({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chi tiết hóa đơn',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF21222D),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bill.length,
              separatorBuilder: (context, index) => const Divider(thickness: 1.0),
              itemBuilder: (context, index) {
                var data = bill[index];
                return _buildBillItem(data);
              },
            ),
            if (bill.isNotEmpty)
              Column(
                children: [
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng tiền:',
                        style: TextStyle(
                          fontSize: 20.0, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          NumberFormat('#,##0₫').format(
                            bill.fold(0, (sum, item) => sum + item.price * item.count),
                          ),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillItem(BillDetailModel data) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              height: 80.0, 
              width: 80.0, 
              child: data.imageUrl.isNotEmpty
                  ? Image.network(data.imageUrl, fit: BoxFit.cover)
                  : const Center(
                      child: Text('No Image'),
                    ),
            ),
          ),
          const SizedBox(width: 24.0), 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.productName,
                  style: const TextStyle(
                    fontSize: 18.0, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0), 
                Text(
                  'Số lượng: ${data.count}',
                  style: const TextStyle(fontSize: 18.0, color: Colors.grey), 
                ),
                const SizedBox(height: 8.0), 
                Text(
                  'Giá: ${NumberFormat('#,##0₫').format(data.price)}',
                  style: const TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 243, 55, 55)), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}