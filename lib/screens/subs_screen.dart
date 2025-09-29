import 'package:flutter/material.dart';

class SubsScreen extends StatefulWidget {
  const SubsScreen({super.key});

  @override
  State<SubsScreen> createState() => _SubsScreenState();
}

class _SubsScreenState extends State<SubsScreen> {
  String _selectedFilter = 'All';

  // Demo data - в реальном приложении это будет из API/state management
  final List<Map<String, dynamic>> _subscriptions = [
    {
      'id': '1',
      'name': 'Premium Fitness Club',
      'city': 'Moscow',
      'type': 'gym',
      'color': const Color(0xFF14A39A),
      'status': 'Active',
      'price': 29,
      'duration': 'month',
      'endDate': '2024-02-15',
      'visitsLeft': 8,
      'totalVisits': 10,
      'membersPerPlan': 2,
    },
    {
      'id': '2',
      'name': 'Zen Spa & Wellness',
      'city': 'Saint Petersburg',
      'type': 'spa',
      'color': const Color(0xFF8B5CF6),
      'status': 'Expiring',
      'price': 45,
      'duration': 'month',
      'endDate': '2024-01-28',
      'visitsLeft': 2,
      'totalVisits': 5,
      'membersPerPlan': 1,
    },
    {
      'id': '3',
      'name': 'Yoga Harmony Studio',
      'city': 'Kazan',
      'type': 'yoga',
      'color': const Color(0xFFE91E63),
      'status': 'Expired',
      'price': 25,
      'duration': 'month',
      'endDate': '2024-01-10',
      'visitsLeft': 0,
      'totalVisits': 8,
      'membersPerPlan': 1,
    },
  ];

  List<Map<String, dynamic>> get _filteredSubscriptions {
    if (_selectedFilter == 'All') return _subscriptions;
    return _subscriptions.where((sub) => sub['status'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.06),
        automaticallyImplyLeading: false,
        title: const Text(
          'My Subscriptions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF666666)),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFF666666)),
            onPressed: () {
              // TODO: Implement filters
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Summary Section
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                _SummaryCard(
                  number: '3',
                  label: 'Active',
                  color: const Color(0xFF14A39A),
                ),
                const SizedBox(width: 12),
                _SummaryCard(
                  number: '1',
                  label: 'Expiring soon',
                  color: const Color(0xFFFF6B35),
                ),
                const SizedBox(width: 12),
                _SummaryCard(
                  number: '\$147',
                  label: 'Total/month',
                  color: const Color(0xFF8B5CF6),
                ),
              ],
            ),
          ),

          // Filter Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                _FilterTab(
                  label: 'All',
                  isSelected: _selectedFilter == 'All',
                  onTap: () => setState(() => _selectedFilter = 'All'),
                ),
                _FilterTab(
                  label: 'Active',
                  isSelected: _selectedFilter == 'Active',
                  onTap: () => setState(() => _selectedFilter = 'Active'),
                ),
                _FilterTab(
                  label: 'Expired',
                  isSelected: _selectedFilter == 'Expired',
                  onTap: () => setState(() => _selectedFilter = 'Expired'),
                ),
              ],
            ),
          ),

          // Subscriptions List
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: _filteredSubscriptions.isEmpty
                  ? _EmptyState()
                  : ListView.builder(
                      itemCount: _filteredSubscriptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Map<String, dynamic> subscription = _filteredSubscriptions[index];
                        return _SubscriptionCard(subscription: subscription);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.number,
    required this.label,
    required this.color,
  });

  final String number;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Text(
              number,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF14A39A) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.white : const Color(0xFF666666),
            ),
          ),
        ),
      ),
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({required this.subscription});

  final Map<String, dynamic> subscription;

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
          onTap: () => Navigator.pushNamed(context, '/club', arguments: subscription),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                // Club Icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: (subscription['color'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    _getClubIcon(subscription['type'] as String),
                    color: subscription['color'] as Color,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),

                // Main Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Club Name
                      Text(
                        subscription['name'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),

                      // City
                      Text(
                        subscription['city'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Price and Members
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: (subscription['color'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '\$${subscription['price']}/${subscription['duration']}',
                              style: TextStyle(
                                color: subscription['color'] as Color,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${subscription['membersPerPlan']} member${subscription['membersPerPlan'] > 1 ? 's' : ''}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),

                      // Progress Bar for visits
                      if (subscription['visitsLeft'] != null && subscription['totalVisits'] != null)
                        const SizedBox(height: 12),
                      if (subscription['visitsLeft'] != null && subscription['totalVisits'] != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: (subscription['visitsLeft'] as int) / (subscription['totalVisits'] as int),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                valueColor: AlwaysStoppedAnimation<Color>(subscription['color'] as Color),
                                minHeight: 6,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${subscription['visitsLeft']} of ${subscription['totalVisits']} visits remaining',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),

                      // End Date
                      const SizedBox(height: 8),
                      Text(
                        'Ends: ${subscription['endDate']}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ),

                // Status Badge and Arrow
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(subscription['status'] as String).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        subscription['status'] as String,
                        style: TextStyle(
                          color: _getStatusColor(subscription['status'] as String),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: subscription['color'] as Color,
                      size: 16,
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
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.hourglass_empty,
            size: 64,
            color: const Color(0xFFCCCCCC),
          ),
          const SizedBox(height: 16),
          const Text(
            'You don\'t have any subscriptions yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to browse clubs
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF14A39A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Browse Clubs'),
          ),
        ],
      ),
    );
  }
}

