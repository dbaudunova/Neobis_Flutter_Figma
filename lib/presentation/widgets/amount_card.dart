import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/config/color/color.dart';

class AmountCard extends StatelessWidget {
  const AmountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorSelect.searchBarColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Row(
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                elevation: 0,
              ),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 14),
                child: Icon(
                  Icons.minimize_rounded,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          const Column(
            children: [
              Text(
                '12 шт',
                style: TextStyle(
                    fontFamily: 'NunitoSansSemiBold',
                    fontSize: 16,
                    color: Colors.blueAccent),
              ),
              Text(
                '15 600 ₽',
                style: TextStyle(
                    fontFamily: 'NunitoSansSemiBold',
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              elevation: 0,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
