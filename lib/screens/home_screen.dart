import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Map<String, dynamic>> clubs = <Map<String, dynamic>>[
    <String, dynamic>{
      'name': 'Gym Pro',
      'city': 'Almaty',
      'price': 19,
      'membersPerPlan': 1,
      'duration': 'Monthly',
      'type': 'gym',
      'visitsLeft': null,
      'totalVisits': null,
      'color': const Color(0xFFFF6B35),
      'status': 'Active',
    },
    <String, dynamic>{
      'name': 'Spa Relax',
      'city': 'Astana',
      'price': 29,
      'membersPerPlan': 2,
      'duration': '10 Visits',
      'type': 'spa',
      'visitsLeft': 7,
      'totalVisits': 10,
      'color': const Color(0xFF14A39A),
      'status': 'Active',
    },
    <String, dynamic>{
      'name': 'Yoga Flow',
      'city': 'Shymkent',
      'price': 99,
      'membersPerPlan': 1,
      'duration': 'Annual',
      'type': 'yoga',
      'visitsLeft': null,
      'totalVisits': null,
      'color': const Color(0xFFE91E63),
      'status': 'Expiring',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: <Widget>[
            const Spacer(),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_none, color: Color(0xFF14A39A)),
                iconSize: 28,
                onPressed: () {
                  Navigator.pushNamed(context, '/alerts');
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFFF6FBFF),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Logo
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Image.asset(
                    'assets/Logo.png',
                    width: 240,
                    height: 40,
                  ),
                ),
              ),
              // Welcome Section
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Welcome back!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Discover and manage your subscriptions',
                            style: TextStyle(
                              fontSize: 16,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF14A39A).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.person,
                          color: Color(0xFF14A39A),
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Quick Actions
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.subscriptions,
                        title: 'My Subscriptions',
                        subtitle: 'Manage your plans',
                        onTap: () => Navigator.pushNamed(context, '/subs'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.notifications,
                        title: 'Notifications',
                        subtitle: 'Stay updated',
                        onTap: () => Navigator.pushNamed(context, '/alerts'),
                      ),
                    ),
                  ],
                ),
              ),

              // Stats Section
              Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _StatCard(
                        number: '3',
                        label: 'Active',
                        color: const Color(0xFF14A39A),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        number: '\$147',
                        label: '/month',
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        number: '1',
                        label: 'Expiring',
                        color: const Color(0xFFE91E63),
                      ),
                    ),
                  ],
                ),
              ),

              // Popular Subscriptions
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Popular Subscriptions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),

              // Subscription Cards
              Container(
                margin: const EdgeInsets.all(16),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: clubs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Map<String, dynamic> club = clubs[index];
                    return _SubscriptionCard(club: club);
                  },
                ),
              ),
              const SizedBox(height: 40), // Space for bottom padding
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF14A39A).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF14A39A),
                    size: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF14A39A),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.number,
    required this.label,
    required this.color,
  });

  final String number;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({required this.club});

  final Map<String, dynamic> club;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.pushNamed(context, '/club', arguments: club),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: (club['color'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    _getClubIcon(club['type'] as String),
                    color: club['color'] as Color,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        club['name'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        club['city'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: (club['color'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '\$${club['price']}/${club['duration']}',
                              style: TextStyle(
                                color: club['color'] as Color,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${club['membersPerPlan']} member${club['membersPerPlan'] > 1 ? 's' : ''}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                      // Progress Bar for visits
                      if (club['visitsLeft'] != null && club['totalVisits'] != null)
                        const SizedBox(height: 12),
                      if (club['visitsLeft'] != null && club['totalVisits'] != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: (club['visitsLeft'] as int) / (club['totalVisits'] as int),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                valueColor: AlwaysStoppedAnimation<Color>(club['color'] as Color),
                                minHeight: 6,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${club['visitsLeft']} of ${club['totalVisits']} visits remaining',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(club['status'] as String).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        club['status'] as String,
                        style: TextStyle(
                          color: _getStatusColor(club['status'] as String),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/club', arguments: club),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: club['color'] as Color,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getClubIcon(String type) {
    switch (type) {
      case 'gym':
        return Icons.fitness_center;
      case 'spa':
        return Icons.spa;
      case 'yoga':
        return Icons.self_improvement;
      default:
        return Icons.fitness_center;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFF14A39A);
      case 'Expiring':
        return const Color(0xFFFF6B35);
      case 'Expired':
        return const Color(0xFFE91E63);
      default:
        return const Color(0xFF666666);
    }
  }
}
