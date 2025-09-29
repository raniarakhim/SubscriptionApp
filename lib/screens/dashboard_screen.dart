import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6FBFF),
      ),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            // TabBar
            Container(
              color: Colors.white,
              child: const TabBar(tabs: <Widget>[
                Tab(text: 'Dashboard'),
                Tab(text: 'Plans'),
                Tab(text: 'Users'),
                Tab(text: 'Reports'),
              ]),
            ),
            // TabBarView
            const Expanded(
              child: TabBarView(children: <Widget>[
                _AdminDashboardTab(),
                _PlansTab(),
                _UsersTab(),
                _ReportsTab(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminDashboardTab extends StatelessWidget {
  const _AdminDashboardTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6FBFF),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const <Widget>[
              _StatCard(title: 'Active Clients', value: '1,248'),
              _StatCard(title: 'Pending Renewals', value: '32'),
            ],
          ),
          const SizedBox(height: 16),
          const _Section(title: 'Recent Payments', child: _PaymentsList()),
          const SizedBox(height: 12),
          const _Section(title: 'Subscriptions Status', child: _StatusChips()),
          const SizedBox(height: 12),
          const _Section(title: 'User Management', child: _UsersTable()),
          const SizedBox(height: 12),
          const _Section(title: 'Groups', child: _GroupsCard()),
        ],
      ),
    );
  }
}

class _PlansTab extends StatelessWidget {
  const _PlansTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6FBFF),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          _PlanCard(name: 'Gym • Monthly', price: '19'),
          _PlanCard(name: 'Spa • Annual', price: '129'),
        ],
      ),
    );
  }
}

class _UsersTab extends StatelessWidget {
  const _UsersTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6FBFF),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          _UsersTable(),
        ],
      ),
    );
  }
}

class _ReportsTab extends StatelessWidget {
  const _ReportsTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6FBFF),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          _Section(title: 'Analytics', child: SizedBox(height: 160, child: Card())),
          SizedBox(height: 12),
          _Section(title: 'Export', child: _ExportRow()),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(title),
          ]),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      child,
    ]);
  }
}

class _PaymentsList extends StatelessWidget {
  const _PaymentsList();

  @override
  Widget build(BuildContext context) {
    return Column(children: const <Widget>[
      _PaymentTile(name: 'Alex Morgan', amount: '129'),
      _PaymentTile(name: 'Priya Singh', amount: '19'),
    ]);
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({required this.name, required this.amount});

  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text(name),
        trailing: Chip(label: Text('\$$amount')),
      ),
    );
  }
}

class _StatusChips extends StatelessWidget {
  const _StatusChips();

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8, children: const <Widget>[
      Chip(label: Text('Active • 842')),
      Chip(label: Text('Pending • 16')),
      Chip(label: Text('Expired • 54')),
    ]);
  }
}

class _UsersTable extends StatelessWidget {
  const _UsersTable();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DataTable(columns: const <DataColumn>[
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Plan')),
        DataColumn(label: Text('Expires')),
        DataColumn(label: Text('Status')),
      ], rows: const <DataRow>[
        DataRow(cells: <DataCell>[DataCell(Text('Alex Morgan')), DataCell(Text('Annual')), DataCell(Text('Oct 28')), DataCell(Text('Active'))]),
        DataRow(cells: <DataCell>[DataCell(Text('Priya Singh')), DataCell(Text('Monthly')), DataCell(Text('Oct 21')), DataCell(Text('Expiring'))]),
      ]),
    );
  }
}

class _GroupsCard extends StatelessWidget {
  const _GroupsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Groups'),
        subtitle: const Text('Gym • 420 active users\nSpa • 260 active users'),
        trailing: Wrap(spacing: 8, children: <Widget>[
          FilledButton(onPressed: () {}, child: const Text('Add Group')),
          OutlinedButton(onPressed: () {}, child: const Text('Manage')),
        ]),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.name, required this.price});

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: const Text('Tap to edit plan details'),
        trailing: Chip(label: Text('\$$price/mo')),
      ),
    );
  }
}

class _ExportRow extends StatelessWidget {
  const _ExportRow();

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.file_download_outlined), label: const Text('Export CSV')),
      const SizedBox(width: 12),
      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.picture_as_pdf_outlined), label: const Text('Export PDF')),
    ]);
  }
}


