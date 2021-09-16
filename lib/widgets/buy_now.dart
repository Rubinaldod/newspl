// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:wordpress_app/services/app_service.dart';

// class BuyNowWidget extends StatelessWidget {
//   const BuyNowWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           padding:
//               EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//           decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.onPrimary),
//           child: ListTile(
//             contentPadding: EdgeInsets.all(0),
//             isThreeLine: true,
//             leading: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               radius: 20,
//               child: Icon(
//                 Feather.shopping_cart,
//                 size: 20,
//                 color: Colors.grey[700],
//               ),
//             ),
//             title: Text(
//               'buy now',
//               style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   wordSpacing: 1,
//                   letterSpacing: -0.5,
//                   color: Theme.of(context).colorScheme.primary),
//             ).tr(),
//             subtitle: Text(
//               'buy now subtitle',
//               style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w400,
//                   color: Theme.of(context).colorScheme.secondary),
//             ).tr(),
//             trailing: Icon(Feather.chevron_right),
//             onTap: () => AppService().openLinkWithCustomTab(context, "https://codecanyon.net/user/mrblab24/portfolio"),
//           ),
//         ),
//       ],
//     );
//   }
// }