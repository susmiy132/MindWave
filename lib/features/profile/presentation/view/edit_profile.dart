// import 'package:flutter/material.dart';
// import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';

// class _EditProfileDialog extends StatefulWidget {
//   final ProfileEntity profile;

//   const _EditProfileDialog({required this.profile});

//   @override
//   State<_EditProfileDialog> createState() => _EditProfileDialogState();
// }

// class _EditProfileDialogState extends State<_EditProfileDialog> {
//   late TextEditingController nameController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;
//   late TextEditingController avatarController;
//   late TextEditingController bioController;

//   @override
//   void initState() {
//     nameController = TextEditingController(text: widget.profile.name);
//     emailController = TextEditingController(text: widget.profile.email);
//     phoneController = TextEditingController(text: widget.profile.phone);
//     avatarController = TextEditingController(text: widget.profile.avatarUrl ?? '');
//     bioController = TextEditingController(text: widget.profile.bio ?? '');
//     super.initState();
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     avatarController.dispose();
//     bioController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Edit Profile"),
//       content: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")),
//             TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
//             TextField(controller: phoneController, decoration: const InputDecoration(labelText: "Phone")),
//             TextField(controller: avatarController, decoration: const InputDecoration(labelText: "Avatar URL")),
//             TextField(controller: bioController, decoration: const InputDecoration(labelText: "Bio")),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context), 
//           child: const Text("Cancel"),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             final updatedProfile = ProfileEntity(
//               userId: widget.profile.userId,
//               name: nameController.text.trim(),
//               email: emailController.text.trim(),
//               phone: phoneController.text.trim(),
//               avatarUrl: avatarController.text.trim().isEmpty ? null : avatarController.text.trim(),
//               bio: bioController.text.trim().isEmpty ? null : bioController.text.trim(), id: '',
//             );

//             Navigator.pop(context, updatedProfile);
//           },
//           child: const Text("Save"),
//         ),
//       ],
//     );
//   }
// }
