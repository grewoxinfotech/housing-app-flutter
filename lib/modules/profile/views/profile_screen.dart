import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/font_res.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/modules/auth/views/login_screen.dart';
import 'package:housing_flutter_app/widgets/bar/app_bar/common_bar.dart';
import 'package:housing_flutter_app/widgets/button/button.dart';

import '../../profile/views/edit_profile_screen.dart';
import '../../saved_property/views/saved_property_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/font_res.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        // showBackArrow: true,
        // leadingIcon: Icons.arrow_back,
        actions: [
          IconButton(
            onPressed: () => Get.to(const EditProfileScreen()),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: SecureStorage.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data?.user == null) {
            return const Center(child: Text("No user data found"));
          }

          final user = snapshot.data!.user!;
          final fullName =
              "${user.firstName ?? ''} ${user.lastName ?? ''}".trim();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      user.profilePic != null
                          ? NetworkImage(user.profilePic!)
                          : const AssetImage("assets/icons/app_logo.png")
                              as ImageProvider,
                ),
                const SizedBox(height: 16),
                Text(
                  fullName.isNotEmpty ? fullName : "Guest User",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: FontRes.nuNunitoSans,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),

                // User Info Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      _buildTile(
                        Icons.person_outline,
                        'Username',
                        user.username ?? '-',
                      ),
                      _buildTile(
                        Icons.phone_outlined,
                        'Phone',
                        user.phone ?? '-',
                      ),
                      _buildTile(
                        Icons.home_outlined,
                        'Address',
                        user.address ?? '-',
                      ),
                      _buildTile(
                        Icons.location_city_outlined,
                        'City',
                        user.city ?? '-',
                      ),
                      _buildTile(
                        Icons.map_outlined,
                        'State',
                        user.state ?? '-',
                      ),
                      _buildTile(
                        Icons.numbers_outlined,
                        'ZIP Code',
                        user.zipCode ?? '-',
                      ),
                      _buildTile(
                        Icons.verified_user,
                        'Verified',
                        user.isVerified == true ? 'Yes' : 'No',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: NesticoPeButton(
                    onTap: () async {
                      await SecureStorage.clearAll();
                      Get.offAll(() => const LoginScreen());
                    },
                    title: 'Logout',
                  ),
                ),
                const SizedBox(height: 20),

                // Delete Account Button
                SizedBox(
                  width: double.infinity,
                  child: NesticoPeButton(
                    onTap: () {
                      // TODO: Implement account deletion
                    },
                    title: 'Delete Account',
                    backgroundColor: ColorRes.error,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: ColorRes.primary),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: FontRes.nuNunitoSans,
          fontWeight: FontWeight.w800,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontFamily: FontRes.nuNunitoSans,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String imageUrl;

  const ProfileScreen({super.key, required this.imageUrl});

  // Constants for better maintainability
  static const double _defaultPadding = 16.0;
  static const double _cardRadius = 16.0;
  static const double _profileRadius = 36.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(_defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 20),
              SettingsMenuTile(
                icon: Icons.monitor_heart_outlined,
                title: "My Activity",
                subTitle: "Track your interactions",
                onTap: () => Get.to(() => SavedPropertyScreen()),
              ),
              SettingsMenuTile(
                icon: Icons.diamond_outlined,
                title: "Zero Brokerage Properties",
                subTitle: "Browse properties without brokerage",
                onTap: () => _navigateToZeroBrokerage(),
              ),
              SettingsMenuTile(
                icon: Icons.save_outlined,
                title: "Saved Search",
                subTitle: "Access your saved filters",
                onTap: () => _navigateToSavedSearch(),
              ),
              _buildQuickLinksSection(),
              _buildHomeSearchSection(),
              _buildResidentialPackagesSection(),
              _buildToolsAndAdviceSection(),
              SettingsMenuTile(
                icon: Icons.art_track_outlined,
                title: "Housing News",
                subTitle: "Latest property updates",
                onTap: () => _navigateToNews(),
              ),
              SettingsMenuTile(
                icon: Icons.home_repair_service_outlined,
                title: "Housing Edge Services",
                subTitle: "Premium home services",
                onTap: () => _navigateToServices(),
              ),
              SettingsMenuTile(
                icon: Icons.star_border_rounded,
                title: "Recommended Properties (10)",
                subTitle: "Curated for you",
                onTap: () => _navigateToRecommended(),
              ),
              SettingsMenuTile(
                icon: Icons.warning_amber_rounded,
                title: "Report a fraud",
                subTitle: "Stay safe from scams",
                onTap: () => _navigateToReportFraud(),
              ),
              // _buildSettingsSection(),
              const SizedBox(height: 20),
              _buildHelpCenter(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "My Activity",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // TODO: Implement login functionality
          },
          child: const Text("Login", style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }

  Widget _buildProfileCard() {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProfileDetailScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(_defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_cardRadius),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildProfileAvatar(),
            const SizedBox(width: 16),
            const Expanded(child: _ProfileWelcomeSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return imageUrl.isNotEmpty
        ? CircleAvatar(
          radius: _profileRadius,
          backgroundImage: NetworkImage(imageUrl),
          onBackgroundImageError: (_, __) {
            // Fallback to default avatar on image error
          },
        )
        : CircleAvatar(
          radius: _profileRadius,
          backgroundColor: ColorRes.primary,
          child: const Icon(Icons.person, color: Colors.white, size: 32),
        );
  }

  Widget _buildQuickLinksSection() {
    return ExpandableTile(
      title: 'Quick Links',
      subtitle: 'Access frequently used features',
      leadingIcon: Icons.link,
      trailingIcon: Icons.keyboard_arrow_down_rounded,
      children: const [
        SubItems(title: "Smart Deals", icon: Icons.local_offer),
        SubItems(title: "Sell/Rent", icon: Icons.house),
        SubItems(title: "Pay Rent", icon: Icons.payment),
        SubItems(title: "House Protect", icon: Icons.shield, isNew: true),
      ],
    );
  }

  Widget _buildHomeSearchSection() {
    return ExpandableTile(
      title: "Home Search",
      subtitle: "Search for properties",
      leadingIcon: Icons.search_outlined,
      trailingIcon: Icons.keyboard_arrow_down_rounded,
      children: const [
        SubItems(title: "Buy", icon: Icons.home_work_outlined),
        SubItems(title: "Sell", icon: Icons.sell_outlined),
        SubItems(title: "P.G.", icon: Icons.people_outline),
      ],
    );
  }

  Widget _buildResidentialPackagesSection() {
    return ExpandableTile(
      title: "Residential Packages",
      subtitle: "Explore property types",
      leadingIcon: Icons.home_work_outlined,
      trailingIcon: Icons.keyboard_arrow_down_rounded,
      children: const [
        SubItems(title: "For Developer", icon: Icons.apartment_outlined),
        SubItems(title: "For Broker", icon: Icons.verified_user_outlined),
        SubItems(title: "For Buyer", icon: Icons.home_work_outlined),
      ],
    );
  }

  Widget _buildToolsAndAdviceSection() {
    return ExpandableTile(
      title: "Tools & Advice",
      subtitle: 'Property calculators & guides',
      leadingIcon: Icons.tips_and_updates_outlined,
      trailingIcon: Icons.keyboard_arrow_down_rounded,
      children: const [
        SubItems(title: "EMI Calculator", icon: Icons.calculate_outlined),
        SubItems(
          title: "Affordability Calculator",
          icon: Icons.calculate_outlined,
        ),
        SubItems(
          title: "Eligibility Calculator",
          icon: Icons.calculate_outlined,
        ),
        SubItems(title: "Guide", icon: Icons.help_outline_rounded, isNew: true),
      ],
    );
  }

  Widget _buildHelpCenter() {
    return Center(
      child: NesticoPeButton(
        width: double.infinity,
        onTap: () {
          // TODO: Navigate to help center
        },
        title: 'Help Center',
      ),
    );
  }

  // Navigation methods - TODO: Implement actual navigation
  void _navigateToZeroBrokerage() => print("Navigate to Zero Brokerage");
  void _navigateToSavedSearch() => print("Navigate to Saved Search");
  void _navigateToNews() => print("Navigate to News");
  void _navigateToServices() => print("Navigate to Services");
  void _navigateToRecommended() => print("Navigate to Recommended");
  void _navigateToReportFraud() => print("Navigate to Report Fraud");
}

// Separate widget for profile welcome section (better for maintainability)
class _ProfileWelcomeSection extends StatelessWidget {
  const _ProfileWelcomeSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Hello 👋",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          "✓ Easy Contact with sellers",
          style: TextStyle(color: Colors.grey),
        ),
        Text("✓ Personalized experience", style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

// Data class for settings menu items
class _SettingsMenuItem {
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  const _SettingsMenuItem({
    required this.icon,
    required this.title,
    required this.subTitle,
    this.onTap,
  });
}

/// Optimized Settings Tile with better performance
class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, size: 28, color: ColorRes.primary),
      title: Text(title, style: theme.textTheme.titleMedium),
      subtitle: Text(subTitle, style: theme.textTheme.labelMedium),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

/// Optimized ExpandableTile with better animation performance
class ExpandableTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final List<Widget> children;

  const ExpandableTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.children,
  });

  @override
  State<ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(widget.leadingIcon, color: ColorRes.primary),
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
          trailing: AnimatedRotation(
            turns: _isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 300),
            child: Icon(widget.trailingIcon, color: Colors.grey[700]),
          ),
          onTap: _toggleExpand,
        ),
        SizeTransition(
          sizeFactor: _expandAnimation,
          child: Wrap(
            spacing: 8,
            clipBehavior: Clip.none,
            runSpacing: 8,
            children: widget.children,
          ),
        ),

        // const Divider(height: 1, thickness: 0.5),
      ],
    );
  }
}

/// Optimized SubItems with better visual design and performance
class SubItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isNew;
  final VoidCallback? onTap;

  const SubItems({
    super.key,
    required this.title,
    required this.icon,
    this.isNew = false,
    this.onTap,
  });

  static const double _itemHeight = 100.0;
  static const double _iconSize = 22.0;
  static const double _badgeSize = 16.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: _itemHeight,
          width: screenWidth / 3.5,
          // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.grey.shade50],
            ),
            borderRadius: BorderRadius.circular(16),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.08),
            //     blurRadius: 8,
            //     offset: const Offset(0, 2),
            //     spreadRadius: 0,
            //   ),
            // ],
            border: Border.all(color: Colors.grey.shade200, width: 0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconWithBadge(),
              const SizedBox(height: 8),
              _buildTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithBadge() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorRes.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: ColorRes.primary, size: _iconSize),
        ),
        if (isNew) _buildNewBadge(),
      ],
    );
  }

  Widget _buildNewBadge() {
    return Positioned(
      right: -4,
      top: -4,
      child: Container(
        width: _badgeSize,
        height: _badgeSize,
        decoration: BoxDecoration(
          color: Colors.red.shade600,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Flexible(
      child: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
          // height: 1.1,
        ),
      ),
    );
  }
}
