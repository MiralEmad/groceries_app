import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static final List<_MenuItemData> _menuItems = [
    _MenuItemData(Icons.receipt_long_outlined, 'Orders'),
    _MenuItemData(Icons.person_outline, 'My Details'),
    _MenuItemData(Icons.location_on_outlined, 'Delivery Address'),
    _MenuItemData(Icons.credit_card, 'Payment Methods'),
    _MenuItemData(Icons.local_offer_outlined, 'Promo Card'),
    _MenuItemData(Icons.notifications_none, 'Notifications'),
    _MenuItemData(Icons.help_outline, 'Help'),
    _MenuItemData(Icons.info_outline, 'About'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    _buildProfileHeader(),

                    const SizedBox(height: 30),

                    // Menu Items
                    ..._menuItems.map(
                      (item) => _buildMenuRow(item),
                    ),
                    
                    SizedBox(
                     height: 52.23,
                    ),

                    // Log Out
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/onboarding',
                        );
                      },
                      child: SizedBox(
                        height: 67,
                        width: 364,
                        child: Material(
                          color: const Color(0xffF2F3F2),
                          borderRadius: BorderRadius.circular(19),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.green,
                                ),  

                                 Text(
                                    'Log Out',
                                    style: TextStyle(
                                      color: Color(0xff53B175),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            const _BottomNavBar(currentIndex: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundColor: Color(0xFFE0F5E0),
          child: Icon(
            Icons.person,
            color: Colors.green,
            size: 32,
          ),
        ),

        const SizedBox(width: 14),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alison Herman',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'alison@email.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        const Icon(
          Icons.edit_outlined,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildMenuRow(_MenuItemData item) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  color: Colors.black87,
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    item.label,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),

                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),

        const Divider(
          height: 1,
          color: Color(0xFFE5E5E5),
        ),
      ],
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String label;

  _MenuItemData(this.icon, this.label);
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const _BottomNavBar({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItemData(Icons.storefront, 'Shop'),
      _NavItemData(Icons.explore_outlined, 'Explore'),
      _NavItemData(Icons.shopping_cart_outlined, 'Cart'),
      _NavItemData(Icons.favorite_border, 'Favourite'),
      _NavItemData(Icons.person_outline, 'Account'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            final selected = index == currentIndex;

            final color =
                selected ? Colors.green : Colors.grey;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  items[index].icon,
                  color: color,
                  size: 22,
                ),

                const SizedBox(height: 2),

                Text(
                  items[index].label,
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;

  _NavItemData(this.icon, this.label);
}