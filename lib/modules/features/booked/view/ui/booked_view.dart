import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wiwikost/config/themes/colours.dart';
import 'package:wiwikost/shared/widget/primary_button.dart';

class BookedView extends StatelessWidget {
  const BookedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.w),
              bottomRight: Radius.circular(20.w),
            ),
            child: Image.network(
                'https://asset.olympicfurniture.co.id/NEWS/10-Desain-Kamar-Aesthetic-Minimalis-yang-Bikin-Betah.webp'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  "kamar 1",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colours.greenPrimary4,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "lantai 1",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colours.greenPrimary4,
                      ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colours.greenPrimary1,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Column(
              children: [
                Text("Periode Sewa",
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colours.white,
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Text(
                        "20-10-2021",
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(
                      size: 30.w,
                      Icons.arrow_forward,
                      color: Colours.white,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colours.white,
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "20-11-2021",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.w),
            alignment: Alignment.centerLeft,
            child: Text(
              "penghuni",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            padding: EdgeInsets.all(4.w),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: Colours.white,
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(
                color: Colours.greenPrimary1,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "gasool",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colours.greenPrimary5,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "NIK-145645446848",
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Text("Tanggungan"),
          Text(
            "Rp. 1.000.000",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colours.red),
          ),
          SizedBox(
            height: 20.w,
          ),
          SizedBox(
              width: 0.9.sw,
              child: PrimaryButton.noVerticalPadding(text: "Bayar")),
          Container(
            alignment: Alignment.center,
            width: 0.9.sw,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.w),
            decoration: BoxDecoration(
              color: Colours.greenPrimary1,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Text(
              "lunas",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colours.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
