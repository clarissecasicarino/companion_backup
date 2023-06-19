import 'package:ShopSM/mock/mock_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickActionStatic extends StatelessWidget {
  const QuickActionStatic({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = mockCategories;

    return Wrap(
      spacing: 14.0,
      runSpacing: 14.0,
      children: categories.map<Widget>((category) {
        final imageUrl = category['imageUrl'] as String?;
        final title = category['title'] as String?;
        final link = category['link'] as String?;
        final Uri url = Uri.parse(link!);

        Future<void> navigateToLink(String link) async {
          if (link.startsWith("https://") || link.startsWith("http://")) {
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          } else if (link.startsWith("shopsmapp://")) {
            // Handle deep linking if necessary
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          } else {
            context.go('/smStore/${Uri.encodeComponent(link)}');
          }
        }

        return StaticCircle(
          imageUrl: imageUrl ?? '',
          link: link,
          title: title ?? '',
          onTap: () {
            navigateToLink(link);
          },
        );
      }).toList(),
    );
  }
}

class StaticCircle extends StatefulWidget {
  final String imageUrl;
  final String link;
  final String title;
  final VoidCallback onTap;

  const StaticCircle({
    Key? key,
    required this.imageUrl,
    required this.link,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  State<StaticCircle> createState() => _StaticCircleState();
}

class _StaticCircleState extends State<StaticCircle> {
  Color fontColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          fontColor = Colors.black; //
        });
      },
      onTapDown: (_) {
        setState(() {
          fontColor = const Color(0xFF0030FF); //
        });
        // Handle navigation to the specified screen
        widget.onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: widget.imageUrl,
            width: 80,
            height: 80,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.title,
            style: TextStyle(
                color: fontColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'HenrySans'),
          ),
        ],
      ),
    );
  }
}
