import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(8)),
            width: 40,
            height: 15,
          ),
          _buildAction(context, Icons.queue_rounded, "Play next in queue"),
          _buildAction(
              context, Icons.watch_later_outlined, "Save to Watch later"),
          _buildAction(context, Icons.playlist_add, "Save to playlist"),
          _buildAction(context, Icons.reply_outlined, "Share"),
          _buildAction(context, Icons.library_add_outlined, "Not interested"),
          _buildAction(
              context, Icons.person_off_outlined, "Don't recommend channel"),
          _buildAction(context, Icons.flag_outlined, "Report")
        ],
      ),
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
