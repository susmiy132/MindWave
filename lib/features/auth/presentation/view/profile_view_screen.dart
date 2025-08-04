// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_event.dart';
// // import 'package:mindwave/features/profile/presentation/view_model/profile_view_model.dart';
// // import 'package:mindwave/features/profile/presentation/view_model/profile_state.dart';
// // import 'package:mindwave/features/profile/presentation/view_model/profile_event.dart';

// // class ProfilePage extends StatelessWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => ProfileViewModel()..add(LoadUserDataEvent()),
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Profile'),
// //           backgroundColor: Colors.deepPurple,
// //         ),
// //         body: BlocBuilder<ProfileViewModel, ProfileState>(
// //           builder: (context, state) {
// //             if (state is ProfileLoading) {
// //               return const Center(child: CircularProgressIndicator());
// //             } else if (state is ProfileLoaded) {
// //               final user = state.user;

// //               return SingleChildScrollView(
// //                 padding: const EdgeInsets.all(16),
// //                 child: Column(
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 50,
// //                       backgroundImage: user.profileImage != null
// //                           ? NetworkImage(user.profileImage!)
// //                           : null,
// //                       child: user.profileImage == null
// //                           ? const Icon(Icons.person, size: 50)
// //                           : null,
// //                     ),
// //                     const SizedBox(height: 16),
// //                     Text(user.fullName, style: const TextStyle(fontSize: 20)),
// //                     const SizedBox(height: 8),
// //                     Text(user.email),
// //                     const SizedBox(height: 8),
// //                     Text(user.phone),
// //                     const SizedBox(height: 24),
// //                     ElevatedButton.icon(
// //                       icon: const Icon(Icons.logout),
// //                       onPressed: () {
// //                         context.read<ProfileViewModel>().add(LogoutUserEvent());
// //                       },
// //                       label: const Text("Logout"),
// //                     ),
// //                     const SizedBox(height: 12),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         OutlinedButton.icon(
// //                           icon: const Icon(Icons.edit),
// //                           label: const Text("Edit"),
// //                           onPressed: () {
// //                             // TODO: Add Edit functionality
// //                           },
// //                         ),
// //                         OutlinedButton.icon(
// //                           icon: const Icon(Icons.delete),
// //                           label: const Text("Delete"),
// //                           onPressed: () {
// //                             // TODO: Add Delete Account functionality
// //                           },
// //                         ),
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               );
// //             } else if (state is ProfileError) {
// //               return Center(child: Text(state.message));
// //             } else {
// //               return const Center(child: Text("No user data found."));
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_state.dart';
// import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_view_model.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ProfileViewModel()..add(LoadUserDataEvent()),
//       child: BlocConsumer<ProfileViewModel, ProfileState>(
//         listener: (context, state) {
//           if (state is ProfileLogoutSuccess) {
//             Navigator.of(context).pushReplacementNamed('/login');
//           }
//         },
//         builder: (context, state) {
//           if (state is ProfileLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is ProfileLoaded) {
//             final user = state.user;

//             return Scaffold(
//               appBar: AppBar(title: const Text('Profile')),
//               body: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: user.profileImage != null
//                           ? NetworkImage(user.profileImage!)
//                           : null,
//                       child: user.profileImage == null
//                           ? const Icon(Icons.person, size: 50)
//                           : null,
//                     ),
//                     const SizedBox(height: 16),
//                     Text(user.fullName, style: const TextStyle(fontSize: 20)),
//                     const SizedBox(height: 8),
//                     Text(user.email),
//                     const SizedBox(height: 8),
//                     Text(user.phone),
//                     const SizedBox(height: 24),
//                     ElevatedButton(
//                       onPressed: () {
//                         context.read<ProfileViewModel>().add(LogoutUserEvent());
//                       },
//                       child: const Text("Logout"),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           } else if (state is ProfileError) {
//             return Scaffold(
//               appBar: AppBar(title: const Text('Profile')),
//               body: Center(child: Text(state.message)),
//             );
//           } else {
//             return const Scaffold(
//               body: Center(child: Text("No user data found.")),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
