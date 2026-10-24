import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import '../../../../controllers/rider_controllers/profile_screen_controller.dart';
import '../../../../models/rider_model.dart';

class MyRiderProfileScreen extends StatefulWidget {
  final String riderId;

  const MyRiderProfileScreen({Key? key, required this.riderId}) : super(key: key);

  @override
  State<MyRiderProfileScreen> createState() => _MyRiderProfileScreenState();
}

class _MyRiderProfileScreenState extends State<MyRiderProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  late TextEditingController _riderNameController;
  late TextEditingController _phoneNoController;
  late TextEditingController _emailController;
  late TextEditingController _vehicleTypeController;
  late TextEditingController _licenseNoController;

  bool isEditing = false;

  Future<RiderModel>? riderModelFuture;

  @override
  void initState() {
    super.initState();
    riderModelFuture = _fetchRiderDetails();
  }

  Future<RiderModel> _fetchRiderDetails() async {
    return await profileController.fetchRiderDetails(widget.riderId);
  }

  void _saveChanges() async {
    await profileController.updateRiderDetails(widget.riderId, {
      'riderName': _riderNameController.text,
      'phoneNo': _phoneNoController.text,
      'email': _emailController.text,
      'vehicleType': _vehicleTypeController.text,
      'licenseNo': _licenseNoController.text,
    });

    setState(() {
      isEditing = false;
    });

    Get.snackbar(
      "Profile Updated",
      "Your changes have been saved.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rider Profile"),
        backgroundColor: CustomColors.primaryColor,
        actions: [
          if (!isEditing)
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
            ),
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.save, color: Colors.white),
              onPressed: _saveChanges,
            ),
        ],
      ),
      body: FutureBuilder<RiderModel>(
        future: riderModelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Rider Data Available'));
          }

          final riderModel = snapshot.data!;
          _riderNameController = TextEditingController(text: riderModel.riderName);
          _phoneNoController = TextEditingController(text: riderModel.phoneNo);
          _emailController = TextEditingController(text: riderModel.email);
          _vehicleTypeController = TextEditingController(text: riderModel.vehicleDetails);
          _licenseNoController = TextEditingController(text: riderModel.licenseNo);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: isEditing
                          ? TextField(
                        controller: _riderNameController,
                        decoration: const InputDecoration(labelText: "Name"),
                      )
                          : Text("Name: ${riderModel.riderName}"),
                      leading: const Icon(Icons.person),
                    ),
                    ListTile(
                      title: isEditing
                          ? TextField(
                        controller: _phoneNoController,
                        decoration: const InputDecoration(labelText: "Phone"),
                        keyboardType: TextInputType.phone,
                      )
                          : Text("Phone: ${riderModel.phoneNo}"),
                      leading: const Icon(Icons.phone),
                    ),
                    ListTile(
                      title: isEditing
                          ? TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                      )
                          : Text("Email: ${riderModel.email}"),
                      leading: const Icon(Icons.email),
                    ),
                    ListTile(
                      title: isEditing
                          ? TextField(
                        controller: _vehicleTypeController,
                        decoration: const InputDecoration(labelText: "Vehicle Type"),
                      )
                          : Text("Vehicle: ${riderModel.vehicleDetails}"),
                      leading: const Icon(Icons.directions_bike),
                    ),
                    ListTile(
                      title: isEditing
                          ? TextField(
                        controller: _licenseNoController,
                        decoration: const InputDecoration(labelText: "License No"),
                      )
                          : Text("License: ${riderModel.licenseNo}"),
                      leading: const Icon(Icons.confirmation_number),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

