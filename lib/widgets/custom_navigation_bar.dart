import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  static const Color activeColor = Color(0xFF14A39A); // Primary green
  static const Color inactiveColor = Color(0xFF999999); // Gray
  static const Color textColor = Color(0xFF666666); // Muted text

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xFFE6E6E6).withOpacity(0.5),
            width: 0.5,
          ),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _NavigationItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            isActive: widget.currentIndex == 0,
            onTap: () => widget.onTap(0),
          ),
          _NavigationItem(
            icon: Icons.subscriptions_outlined,
            activeIcon: Icons.subscriptions,
            label: 'Subscriptions',
            isActive: widget.currentIndex == 1,
            onTap: () => widget.onTap(1),
          ),
          _NavigationItem(
            icon: Icons.notifications_outlined,
            activeIcon: Icons.notifications,
            label: 'Alerts',
            isActive: widget.currentIndex == 3,
            onTap: () => widget.onTap(3),
          ),
          _NavigationItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
            isActive: widget.currentIndex == 2,
            onTap: () => widget.onTap(2),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatefulWidget {
  const _NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<_NavigationItem>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.isActive) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_NavigationItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: widget.isActive
                    ? _CustomNavigationBarState.activeColor.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedScale(
                    scale: _scaleAnimation.value,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Icon(
                      widget.isActive ? widget.activeIcon : widget.icon,
                      color: widget.isActive
                          ? _CustomNavigationBarState.activeColor
                          : _CustomNavigationBarState.inactiveColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
                      color: widget.isActive
                          ? _CustomNavigationBarState.activeColor
                          : _CustomNavigationBarState.textColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
