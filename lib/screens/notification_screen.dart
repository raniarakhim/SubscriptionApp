import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static final List<Map<String, dynamic>> notifications = <Map<String, dynamic>>[
    {
      'title': 'Payment Successful',
      'message': 'Your Gym Pro subscription has been renewed',
      'time': '2h ago',
      'icon': Icons.check_circle,
      'color': Color(0xFF14A39A),
    },
    {
      'title': 'Subscription Expiring',
      'message': 'Your Yoga Flow plan is expiring in 3 days',
      'time': '5h ago',
      'icon': Icons.warning_amber_rounded,
      'color': Color(0xFFFF6B35),
    },
    {
      'title': 'New Offer',
      'message': 'Get 20% off on Spa Relax annual plans!',
      'time': 'Yesterday',
      'icon': Icons.local_offer,
      'color': Color(0xFFE91E63),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Color(0xFF14A39A)),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: (notif['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  notif['icon'] as IconData,
                  color: notif['color'] as Color,
                  size: 24,
                ),
              ),
              title: Text(
                notif['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                notif['message'] as String,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF666666),
                ),
              ),
              trailing: Text(
                notif['time'] as String,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                ),
              ),
              onTap: () {
                // TODO: действие при клике
              },
            ),
          );
        },
      ),
    );
  }
}
