// import 'package:flutter/material.dart';

// class Notificationn extends StatefulWidget {
//   const Notificationn({super.key});

//   @override
//   State<Notificationn> createState() => _NotificationState();
// }

// class _NotificationState extends State<Notificationn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.black, // <-- SEE HERE
//         ),
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Notifications',
//           style: TextStyle(
//             fontSize: 20,
//             fontFamily: 'Raleway',
//             fontWeight: FontWeight.bold,
//             backgroundColor: Colors.white,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.grey,
//             width: 1000,
//             height: 150,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Image.network(
//                     'https://www.atprosound.com/wp-content/uploads/2020/03/BEHRINGER-FBQ-6200-1.jpg',
//                   ),
//                   const Text(
//                     'data',
//                     textAlign: TextAlign.start,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Align(
//                           alignment: Alignment.bottomRight,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             shape: const StadiumBorder(),
//                             backgroundColor: Colors.green,
//                           ),
//                           child: const Text(
//                             'Approved',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 3,
//           ),
//           Container(
//             color: Colors.grey,
//             width: 1000,
//             height: 150,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Image.network(
//                     'https://www.atprosound.com/wp-content/uploads/2020/03/BEHRINGER-FBQ-6200-1.jpg',
//                   ),
//                   const Text(
//                     'data',
//                     textAlign: TextAlign.start,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Align(
//                           alignment: Alignment.bottomRight,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             shape: const StadiumBorder(),
//                             backgroundColor: Colors.red,
//                           ),
//                           child: const Text(
//                             'Rejected',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
