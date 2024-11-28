// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, unnecessary_brace_in_string_interps, avoid_unnecessary_containers, prefer_const_constructors
import 'package:coffi_shop/customWidgets/hvSpaces.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class PaymentScreen extends StatelessWidget {
  double price;
  PaymentScreen({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Total =  ${price} \$',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            vSpace(40),
            const Text(
              'Payment Method : ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSpace(10),
            //-------------payment 1---
            Container(
              decoration:  BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 80,
              
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card_rounded,),
                    TextButton(onPressed: (){}, child: const Text('Apple Pay',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),)),
                  ],
                ),
              ),
            ),
            //------------2
            vSpace(10),
              Container(
              decoration:  BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 80,
              
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card_rounded,),
                    TextButton(onPressed: (){}, child: const Text('VISA/Master Card',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),)),
                  ],
                ),
              ),
            ),
            //-----------------------3
            vSpace(10),
              Container(
              decoration:  BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 80,
              
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(Icons.attach_money_rounded,),
                    TextButton(onPressed: (){}, child: const Text('Cash',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
