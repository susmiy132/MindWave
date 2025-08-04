// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // import 'package:mindwave/features/profile/presentation/view_model/profile_state.dart';
// // // // import 'package:mindwave/features/profile/presentation/view_model/profile_view_model.dart';

// // // // class ProfilePage extends StatelessWidget {
// // // //   const ProfilePage({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return BlocProvider(
// // // //       create: (_) => ProfileViewModel()..loadUserData(),
// // // //       child: Scaffold(
// // // //         appBar: AppBar(
// // // //           title: const Text('Profile'),
// // // //         ),
// // // //         body: BlocBuilder<ProfileViewModel, ProfileState>(
// // // //           builder: (context, state) {
// // // //             if (state is ProfileLoading) {
// // // //               return const Center(child: CircularProgressIndicator());
// // // //             } else if (state is ProfileLoaded) {
// // // //               final user = state.user;

// // // //               return SingleChildScrollView(
// // // //                 padding: const EdgeInsets.all(16),
// // // //                 child: Column(
// // // //                   children: [
// // // //                     CircleAvatar(
// // // //                       radius: 50,
// // // //                       backgroundImage: user.profileImage != null
// // // //                           ? NetworkImage(user.profileImage!)
// // // //                           : null,
// // // //                       child: user.profileImage == null
// // // //                           ? const Icon(Icons.person, size: 50)
// // // //                           : null,
// // // //                     ),
// // // //                     const SizedBox(height: 16),
// // // //                     Text(user.fullName, style: const TextStyle(fontSize: 20)),
// // // //                     const SizedBox(height: 8),
// // // //                     Text(user.email),
// // // //                     const SizedBox(height: 8),
// // // //                     Text(user.phone),
// // // //                     const SizedBox(height: 24),
// // // //                     ElevatedButton(
// // // //                       onPressed: () {
// // // //                         // TODO: Implement logout or edit
// // // //                       },
// // // //                       child: const Text("Logout"),
// // // //                     )
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else if (state is ProfileError) {
// // // //               return Center(child: Text(state.message));
// // // //             } else {
// // // //               return const Center(child: Text("No user data found."));
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }





// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:mindwave/features/profile/presentation/view_model/profile_view_model.dart';
// // // import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';

// // // class ProfileViewScreen extends StatelessWidget {
// // //   const ProfileViewScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("Profile"),
// // //         backgroundColor: Colors.teal,
// // //         centerTitle: true,
// // //       ),
// // //       body: Consumer<ProfileViewModel>(
// // //         builder: (context, viewModel, _) {
// // //           final profile = viewModel.profile;

// // //           if (profile == null) {
// // //             return const Center(child: Text("No profile found."));
// // //           }

// // //           return Padding(
// // //             padding: const EdgeInsets.all(16),
// // //             child: Column(
// // //               children: [
// // //                 CircleAvatar(
// // //                   radius: 50,
// // //                   backgroundImage: profile.avatarUrl != null
// // //                       ? NetworkImage(profile.avatarUrl!)
// // //                       : null,
// // //                   child: profile.avatarUrl == null
// // //                       ? const Icon(Icons.person, size: 40)
// // //                       : null,
// // //                 ),
// // //                 const SizedBox(height: 16),
// // //                 Text(profile.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
// // //                 const SizedBox(height: 8),
// // //                 Text(profile.email),
// // //                 Text(profile.phone),
// // //                 const SizedBox(height: 8),
// // //                 if (profile.bio != null)
// // //                   Text(profile.bio!, style: const TextStyle(fontStyle: FontStyle.italic)),

// // //                 const SizedBox(height: 24),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     ElevatedButton.icon(
// // //                       icon: const Icon(Icons.edit),
// // //                       label: const Text("Edit"),
// // //                       onPressed: () async {
// // //                         final updatedProfile = await showDialog<ProfileEntity>(
// // //                           context: context,
// // //                           builder: (context) { return _EditProfileDialog(profile: profile);}
// // //                         );

// // //                         if (updatedProfile != null) {
// // //                           viewModel.saveProfile(updatedProfile);
// // //                         }
// // //                       },
// // //                     ),
// // //                     const SizedBox(width: 20),
// // //                     ElevatedButton.icon(
// // //                       icon: const Icon(Icons.delete),
// // //                       label: const Text("Delete"),
// // //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
// // //                       onPressed: () {
// // //                         viewModel.deleteProfile(profile.userId);
// // //                       },
// // //                     ),
// // //                   ],
// // //                 )
// // //               ],
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }



// // import 'package:flutter/material.dart';
// // import 'package:mindwave/features/profile/domain/use_case/delete_profile_usecase.dart';
// // import 'package:mindwave/features/profile/domain/use_case/get_profile_usecase.dart';
// // import 'package:mindwave/features/profile/domain/use_case/save_profile_usecase.dart';
// // import 'package:provider/provider.dart';
// // import '../../domain/entity/profile_entity.dart';
// // import '../view_model/profile_view_model.dart';

// // class ProfileViewScreen extends StatelessWidget {

// //   final GetProfileUseCase getProfileUseCase;
// //   final SaveProfileUseCase saveProfileUseCase;
// //   final DeleteProfileUseCase deleteProfileUseCase;

// //   const ProfileViewScreen({
// //     Key? key,
// //     required this.getProfileUseCase,
// //     required this.saveProfileUseCase,
// //     required this.deleteProfileUseCase,
// //   }) : super(key: key);



// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (_) {
// //     final viewModel = ProfileViewModel(
// //       getProfileUseCase: getProfileUseCase,
// //       saveProfileUseCase: saveProfileUseCase,
// //       deleteProfileUseCase: deleteProfileUseCase,
// //     );

// //     // viewModel.loadProfile("userId"); // 🔁 Replace with actual userId logic
// //     // return viewModel;
    
// //   },
// //   child: Consumer<ProfileViewModel>(
// //     builder: (context, viewModel, _) {
// //       final profile = viewModel.profile;

// //       if (profile == null) {
// //         return const Center(child: CircularProgressIndicator());
// //       }

// //           return Scaffold(
// //             appBar: AppBar(
// //               title: const Text("Profile"),
// //               actions: [
// //                 IconButton(
// //                   icon: const Icon(Icons.edit),
// //                   onPressed: () async {
// //                     final updatedProfile = await showDialog<ProfileEntity>(
// //                       context: context,
// //                       builder: (context) => _EditProfileDialog(profile: profile),
// //                     );
// //                     if (updatedProfile != null) {
// //                       viewModel.saveProfile(updatedProfile);
// //                     }
// //                   },
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.delete),
// //                   onPressed: () => viewModel.deleteProfile(),
// //                 ),
// //               ],
// //             ),
// //             body: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   if (profile.avatarUrl != null)
// //                     Center(
// //                       child: CircleAvatar(
// //                         radius: 40,
// //                         backgroundImage: NetworkImage(profile.avatarUrl!),
// //                       ),
// //                     ),
// //                   const SizedBox(height: 20),
// //                   Text("Name: ${profile.name}", style: const TextStyle(fontSize: 18)),
// //                   Text("Email: ${profile.email}", style: const TextStyle(fontSize: 18)),
// //                   Text("Phone: ${profile.phone}", style: const TextStyle(fontSize: 18)),
// //                   if (profile.bio != null)
// //                     Text("Bio: ${profile.bio}", style: const TextStyle(fontSize: 18)),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // class _EditProfileDialog extends StatefulWidget {
// //   final ProfileEntity profile;

// //   const _EditProfileDialog({required this.profile});

// //   @override
// //   State<_EditProfileDialog> createState() => _EditProfileDialogState();
// // }

// // class _EditProfileDialogState extends State<_EditProfileDialog> {
// //   late TextEditingController nameController;
// //   late TextEditingController emailController;
// //   late TextEditingController phoneController;
// //   late TextEditingController bioController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     nameController = TextEditingController(text: widget.profile.name);
// //     emailController = TextEditingController(text: widget.profile.email);
// //     phoneController = TextEditingController(text: widget.profile.phone);
// //     bioController = TextEditingController(text: widget.profile.bio ?? '');
// //   }

// //   @override
// //   void dispose() {
// //     nameController.dispose();
// //     emailController.dispose();
// //     phoneController.dispose();
// //     bioController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //       title: const Text('Edit Profile'),
// //       content: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: nameController,
// //               decoration: const InputDecoration(labelText: 'Full Name'),
// //             ),
// //             TextField(
// //               controller: emailController,
// //               decoration: const InputDecoration(labelText: 'Email'),
// //             ),
// //             TextField(
// //               controller: phoneController,
// //               decoration: const InputDecoration(labelText: 'Phone'),
// //             ),
// //             TextField(
// //               controller: bioController,
// //               decoration: const InputDecoration(labelText: 'Bio'),
// //             ),
// //           ],
// //         ),
// //       ),
// //       actions: [
// //         TextButton(
// //           child: const Text("Cancel"),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         ElevatedButton(
// //           child: const Text("Save"),
// //           onPressed: () {
// //             final updatedProfile = ProfileEntity(
// //               userId: widget.profile.userId,
// //               name: nameController.text.trim(),
// //               email: emailController.text.trim(),
// //               phone: phoneController.text.trim(),
// //               bio: bioController.text.trim(),
// //               avatarUrl: widget.profile.avatarUrl,
// //             );

// //             Navigator.of(context).pop(updatedProfile);
// //           },
// //         ),
// //       ],
// //     );
// //   }
// // }


// // import 'package:flutter/material.dart';

// // class ProfileViewScreen extends StatelessWidget {
// //   const ProfileViewScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Sample user data – replace with your actual data
// //     final String fullName = 'Susmita Rana';
// //     final String email = 'susmitarana12@gmail.com';
// //     final String phone = '9804636264';
// //     final String password = '********'; // don't show real password

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Profile'),
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           children: [
// //             // Profile Image
// //             Center(
// //               child: CircleAvatar(
// //                 radius: 60,
// //                 // backgroundImage: NetworkImage(profileImageUrl),
// //               ),
// //             ),
// //             const SizedBox(height: 20),

// //             // Full Name
// //             Row(
// //               children: [
// //                 const Icon(Icons.person),
// //                 const SizedBox(width: 10),
// //                 Text(
// //                   fullName,
// //                   style: const TextStyle(fontSize: 18),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 10),

// //             // Email
// //             Row(
// //               children: [
// //                 const Icon(Icons.email),
// //                 const SizedBox(width: 10),
// //                 Text(
// //                   email,
// //                   style: const TextStyle(fontSize: 18),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 10),

// //             // Phone
// //             Row(
// //               children: [
// //                 const Icon(Icons.contact_emergency),
// //                 const SizedBox(width: 10),
// //                 Text(
// //                   phone,
// //                   style: const TextStyle(fontSize: 18),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 10),

// //             // Password (obscured)
// //             Row(
// //               children: [
// //                 const Icon(Icons.lock),
// //                 const SizedBox(width: 10),
// //                 Text(
// //                   password,
// //                   style: const TextStyle(fontSize: 18),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';

// class ProfileViewScreen extends StatefulWidget {
//   const ProfileViewScreen({super.key});

//   @override
//   State<ProfileViewScreen> createState() => _ProfileViewScreenState();
// }

// class _ProfileViewScreenState extends State<ProfileViewScreen> {
//   String fullName = 'Susmita Rana';
//   String email = 'susmitarana12@gmail.com';
//   String phone = '9804636264';
//   String password = '********'; // Obscured for security

//   void _showOptionsMenu(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (_) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.edit),
//                 title: const Text('Edit'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _showEditDialog(context);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.delete),
//                 title: const Text('Delete'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _confirmDelete(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showEditDialog(BuildContext context) {
//     final nameController = TextEditingController(text: fullName);
//     final emailController = TextEditingController(text: email);
//     final phoneController = TextEditingController(text: phone);
//     final passwordController = TextEditingController(text: password);

//     showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: const Text('Edit Profile'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Full Name')),
//                 TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
//                 TextField(controller: phoneController, decoration: const InputDecoration(labelText: 'Phone')),
//                 TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Save new values
//                 setState(() {
//                   fullName = nameController.text;
//                   email = emailController.text;
//                   phone = phoneController.text;
//                   password = passwordController.text;
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _confirmDelete(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Delete Profile'),
//         content: const Text('Are you sure you want to delete this profile?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // TODO: Delete user from Hive/local storage
//               // After delete, navigate to login
//               Navigator.pop(context); // close dialog
//               Navigator.pushReplacementNamed(context, '/login');
//             },
//             child: const Text('Delete', style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert),
//             onPressed: () => _showOptionsMenu(context),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.grey.shade300,
//                 child: const Icon(Icons.person, size: 60),
//               ),
//             ),
//             const SizedBox(height: 20),

//             Row(
//               children: [
//                 const Icon(Icons.person),
//                 const SizedBox(width: 10),
//                 Text(fullName, style: const TextStyle(fontSize: 18)),
//               ],
//             ),
//             const SizedBox(height: 10),

//             Row(
//               children: [
//                 const Icon(Icons.email),
//                 const SizedBox(width: 10),
//                 Text(email, style: const TextStyle(fontSize: 18)),
//               ],
//             ),
//             const SizedBox(height: 10),

//             Row(
//               children: [
//                 const Icon(Icons.phone),
//                 const SizedBox(width: 10),
//                 Text(phone, style: const TextStyle(fontSize: 18)),
//               ],
//             ),
//             const SizedBox(height: 10),

//             Row(
//               children: [
//                 const Icon(Icons.lock),
//                 const SizedBox(width: 10),
//                 Text(password, style: const TextStyle(fontSize: 18)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
