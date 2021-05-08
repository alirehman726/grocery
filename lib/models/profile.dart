class Profile {
  int id;
  String name;
  String image;

  Profile({
    this.id,
    this.name,
    this.image,
  });
}

List<Profile> profile = [
    Profile(
      id: 1,
      name: 'My Profile',
      image: 'assets/images/Menu/profile.png',
    ),
    Profile(
      id: 2,
      name: 'My Wishlist',
      image: 'assets/images/Menu/wishlist.png',
  ),
  Profile(
    id: 3,
    name: 'My Address',
    image: 'assets/images/Menu/address.png',
  ),
  Profile(
    id: 4,
    name: 'Notification',
    image: 'assets/images/Menu/notification.png',
  ),
  Profile(
    id: 5,
    name: 'Rate Us',
    image: 'assets/images/Menu/rate.png',
  ),
  Profile(
    id: 6,
    name: 'Terms & Condition',
    image: 'assets/images/Menu/condition.png',
  ),
  Profile(
    id: 7,
    name: 'Help & Support',
    image: 'assets/images/Menu/help.png',
  ),
];
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screenutil.dart';
// import 'package:grocery2/models/profile.dart';
// import 'package:grocery2/pages/BottomBar/widget/profile/widget/my_profile.dart';

// class ProfileMenu extends StatefulWidget {
//   final Profile profile;
//   final Function press;
//   const ProfileMenu({Key key, this.profile, this.press}) : super(key: key);

//   @override
//   _ProfileMenuState createState() => _ProfileMenuState();
// }

// class _ProfileMenuState extends State<ProfileMenu> {
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, width: 412, height: 870);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40.9),
//         child: AppBar(
//           backgroundColor: Theme.of(context).accentColor,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   height: 40,
//                   width: 40,
//                   child: CircleAvatar(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     backgroundImage:
//                         AssetImage('assets/images/Profile/my_profile.png'),
//                   ),
//                   padding: EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(
//                           "assets/images/Profile/profile_broder.png"),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(right: 20, left: 20),
//                   child: Image.asset('assets/images/AppBar/cart.png'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Image(
//             image: AssetImage('assets/images/Login/background.png'),
//             height: ScreenUtil().setHeight(850),
//             width: ScreenUtil().setWidth(412),
//             fit: BoxFit.fill,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.only(top: 20, left: 20, bottom: 14),
//                 child: Text(
//                   'Menu',
//                   style: TextStyle(
//                       color: Theme.of(context).backgroundColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: ScreenUtil().setSp(40)),
//                 ),
//               ),

//               //1
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: profile.length,
//                     itemBuilder: (context, index) => MenuList(
//                           profile: profile[index],
//                         )),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class MenuList extends StatelessWidget {
//   final Profile profile;
//   final Function press;
//   const MenuList({Key key, this.profile, this.press}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
// final test = ModalRoute.of(context).settings.arguments;
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => MyProfile(),
//                 settings: RouteSettings(arguments: "test")));
//       },
//       // onTap: press,
//       child: Container(
//         padding: EdgeInsets.only(left: 20, right: 20),
//         child: Container(
//           margin: EdgeInsets.only(top: 1),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 2,
//                 color: Colors.black12,
//               ),
//             ],
//           ),
//           child: ListTile(
//             // onTap: () {
//             //   Navigator.pushReplacement(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (context) => MyProfile(),
//             //       ));
//             // },
//             leading: Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
//               child: Image.asset(profile.image),
//             ),
//             title: Container(
//               child: Text(
//                 profile.name,
//                 style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontWeight: FontWeight.normal,
//                   fontSize: ScreenUtil().setSp(14),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
