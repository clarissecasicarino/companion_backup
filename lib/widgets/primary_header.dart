import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

final List<String> storeSelectorList = [
  'assets/icons/shopsm_wordmark.svg',
  'assets/icons/smstore_wordmark.svg',
  'assets/icons/smmarkets_wordmark.svg',
];

class PrimaryHeader extends StatefulWidget {
  const PrimaryHeader({super.key});

  @override
  State<PrimaryHeader> createState() => _PrimaryHeaderState();
}

class _PrimaryHeaderState extends State<PrimaryHeader> {
  String dropdownValue = storeSelectorList.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 4.0),
      child: Row(
        children: [
          const SizedBox(
            width: 30,
            child: HeroIcon(HeroIcons.arrowDownLeft),
          ),
          const SizedBox(width: 8),
          // AppIcons.shopSmWordmark,
          const HeroIcon(HeroIcons.arrowDownLeft),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 184,
              child: ButtonTheme(
                alignedDropdown: true,
                child: PopupMenuButton<String>(
                  splashRadius: 2.0,
                  initialValue: dropdownValue,
                  icon: Row(
                    children: [
                      const SizedBox(width: 2),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF0030FF),
                            width: 1,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: HeroIcon(HeroIcons.arrowDownLeft),
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  offset: const Offset(0, 46),
                  elevation: 16,
                  onSelected: (String value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return storeSelectorList.map((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 30,
                              child: HeroIcon(HeroIcons.arrowDownLeft),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 92,
                              child: SvgPicture.asset(value),
                            ),
                          ],
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                icon: const HeroIcon(HeroIcons.arrowDownLeft),
                onPressed: () {
                  context.push("/searchScreen");
                },
                splashRadius: 16.0,
              ),
              IconButton(
                icon: const HeroIcon(HeroIcons.arrowDownLeft),
                onPressed: () {
                  context.push("/cart");
                },
                splashRadius: 16.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
