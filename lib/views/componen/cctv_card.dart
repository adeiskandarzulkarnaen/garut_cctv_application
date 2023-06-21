import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/cctv.dart';

class CctvCard extends StatelessWidget {
  final Cctv objCctv;

  const CctvCard({
    super.key,
    required this.objCctv,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            color: Colors.black12,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).goNamed(
            "video",
            extra: objCctv,
          );
        },
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.30,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: AspectRatio(
                  aspectRatio: 5 / 4,
                  child: Image.asset('assets/images/garut.jpg', fit: BoxFit.cover)
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${objCctv.cctvName} \nLokasi: ${objCctv.cctvLocation}"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
