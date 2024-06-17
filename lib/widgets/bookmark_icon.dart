import 'package:flutter/material.dart';

class BookmarkIcon extends StatefulWidget {
  final VoidCallback onPressed;

  const BookmarkIcon({
    super.key,
    required this.onPressed,
  });

  @override
  State<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  bool? isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Save to Bookmarks',
      isSelected: isBookmarked,
      onPressed: () {
        widget.onPressed();
        setState(() {
          isBookmarked = !isBookmarked!;
        });
      },
      icon: const Icon(Icons.bookmark_border_rounded),
      selectedIcon: const Icon(Icons.bookmark_outlined),
    );
  }
}