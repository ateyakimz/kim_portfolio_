import 'package:flutter/material.dart';
import 'package:my_portfolio/capstone.dart';
import 'package:my_portfolio/certificate.dart';
import 'package:my_portfolio/ojt.dart';
import 'package:my_portfolio/home_page.dart';
import 'package:my_portfolio/recent_project.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  String selectedRoute = 'Home';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final current = ModalRoute.of(context)?.settings.name ?? 'Home';
    if (selectedRoute != current) {
      setState(() {
        selectedRoute = current;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 750;
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF212121), Color(0xFF424242)],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x1AE91E63),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: isNarrow
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: _buildNavItems(context)),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Just the name (icon removed)
                    const Text(
                      'AK Pangilinan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    // Nav items
                    Row(children: _buildNavItems(context)),
                  ],
                ),
        );
      },
    );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    final labels = ['Home', 'OJT', 'Certificates', 'Projects', 'Capstone'];
    return labels
        .map(
          (label) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _HoverableNavItem(
              label: label,
              isSelected: selectedRoute == label,
              onTap: () {
                if (selectedRoute == label) return;

                setState(() {
                  selectedRoute = label;
                });

                switch (label) {
                  case 'Home':
                    _navigateFade(context, HomePage(), 'Home');
                    break;
                  case 'OJT':
                    _navigateFade(context, const OjtPage(), 'OJT');
                    break;
                  case 'Certificates':
                    _navigateFade(context, CertificatePage(), 'Certificates');
                    break;
                  case 'Projects':
                    _navigateFade(context, RecentProjectsPage(), 'Projects');
                    break;
                  case 'Capstone':
                    _navigateFade(context, ScCareCapstonePage(), 'Capstone');
                    break;
                }
              },
            ),
          ),
        )
        .toList();
  }

  void _navigateFade(BuildContext context, Widget page, String routeName) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}

class _HoverableNavItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _HoverableNavItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_HoverableNavItem> createState() => _HoverableNavItemState();
}

class _HoverableNavItemState extends State<_HoverableNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = widget.isSelected
        ? const Color(0xFFE91E63)
        : _isHovered
        ? const Color(0xFFE91E63).withOpacity(0.1)
        : Colors.transparent;

    final Color textColor = widget.isSelected
        ? Colors.white
        : const Color(0xFFE0E0E0);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: textColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getIconForLabel(widget.label), size: 16, color: textColor),
              const SizedBox(width: 6),
              Text(widget.label),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Home':
        return Icons.home_rounded;
      case 'OJT':
        return Icons.work_rounded;
      case 'Certificates':
        return Icons.card_membership_rounded;
      case 'Projects':
        return Icons.folder_rounded;
      case 'Capstone':
        return Icons.school_rounded;
      default:
        return Icons.circle;
    }
  }
}
