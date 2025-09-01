import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/font_res.dart';
import 'package:housing_flutter_app/app/constants/img_res.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/modules/auth/views/login_screen.dart';
import 'package:housing_flutter_app/widgets/bar/app_bar/common_bar.dart';
import 'package:housing_flutter_app/widgets/button/button.dart';

import '../../profile/views/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: CommonNesticoPeAppBar(
        title: 'Profile',
        showBackArrow: true,
        leadingIcon: Icons.arrow_back,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(EditProfileScreen());
            },
            icon: Icon(Icons.edit_outlined),
          ),
        ],
      ),
      // appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Obx(() {
        final userModel = authController.currentUser.value;

        if (userModel?.user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = userModel!.user!;
        final fullName = "${user.firstName ?? ''} ${user.lastName ?? ''}";

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
                fullName,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontFamily: FontRes.nuNunitoSans,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
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
                    _buildTile(Icons.map_outlined, 'State', user.state ?? '-'),
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
              SizedBox(height: 26),

              SizedBox(
                width: double.infinity,
                child: NesticoPeButton(
                  onTap: () async {
                    await SecureStorage.clearAll();
                    Get.offAll(() => LoginScreen());
                  },
                  title: 'Logout',
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: NesticoPeButton(
                  onTap: () {},
                  title: 'Delete Account',
                  backgroundColor: ColorRes.error,
                ),
              ),

              SizedBox(height: 26),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: FontRes.nuNunitoSans,
          fontWeight: FontWeight.w800,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(
          fontFamily: FontRes.nuNunitoSans,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
