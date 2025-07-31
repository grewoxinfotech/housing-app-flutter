import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/modules/auth/controllers/auth_controller.dart';
import 'package:housing_flutter_app/modules/auth/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
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
                        : const AssetImage('assets/images/default_profile.png')
                            as ImageProvider,
              ),
              const SizedBox(height: 16),
              Text(fullName, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Column(
                  children: [
                    _buildTile('Username', user.username ?? '-'),
                    _buildTile('Phone', user.phone ?? '-'),
                    _buildTile('Address', user.address ?? '-'),
                    _buildTile('City', user.city ?? '-'),
                    _buildTile('State', user.state ?? '-'),
                    _buildTile('ZIP Code', user.zipCode ?? '-'),
                    _buildTile(
                      'Verified',
                      user.isVerified == true ? 'Yes' : 'No',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTile(String title, String value) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
