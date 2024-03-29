import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wiwikost/config/themes/colours.dart';

class RoomCard extends StatelessWidget {
  final String roomNumber;
  final String floor;
  final String type;
  final String price;
  const RoomCard(
      {super.key,
      required this.roomNumber,
      required this.floor,
      required this.type,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colours.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.w),
              child: Image.network(
                  'https://asset.olympicfurniture.co.id/NEWS/10-Desain-Kamar-Aesthetic-Minimalis-yang-Bikin-Betah.webp'),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kamar $roomNumber",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.only(right: 20.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lantai $floor",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20.w),
            alignment: Alignment.centerLeft,
            child: Text(
              "Tipe:  $type",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.w),
            alignment: Alignment.centerLeft,
            child: Text(
              "Rp.$price",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colours.greenPrimary1,
                  ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
        ],
      ),
    );
  }
}
