import 'package:agriser/screens/users/all_user_page.dart';
import 'package:agriser/screens/users/user_editprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agriser/bloc/user/drawer_bloc.dart';
import 'package:agriser/pages/user/notification_screen.dart';
import 'package:agriser/pages/user/user_profile_screen.dart';
import 'package:agriser/widgets/user/custom_app_bar.dart';

class DrawerLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          key: _scaffoldKey,
          body: Column(
            children: <Widget>[
              BlocBuilder<DrawerBloc, DrawerStates>(
                builder: (context, DrawerStates state) {
                  return CustomAppBar(
                    isBig: (state is UserProfileScreen),
                    height: (state is UserProfileScreen) ? 250 : 150,
                    leading: IconButton(
                      onPressed: () {
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                            builder: (BuildContext context) => All_user_page());
                        Navigator.of(context).pushAndRemoveUntil(
                            materialPageRoute, (Route<dynamic> route) => false);
                      },
                      icon: Container(
                        child: Center(child: Icon(Icons.arrow_back_ios)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                    title: findSelectedTitle(state),
                    trailing: IconButton(
                      onPressed: () {
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                EditProfileUser());
                        Navigator.of(context).pushAndRemoveUntil(
                            materialPageRoute, (Route<dynamic> route) => false);
                      },
                      icon: Container(
                        child: Center(child: Icon(Icons.edit)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                    childHeight: 100,
                    child: (state is UserProfileScreen)
                        ? ClipOval(
                            child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              height: 100,
                              width: 100,
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/250?image=9",
                                      ),
                                      fit: BoxFit.fill),
                                ),
                                // child: Icon(
                                //   Icons.person,
                                //   size: 80,
                                //   color: Theme.of(context).primaryColor,
                                // ),
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<DrawerBloc, DrawerStates>(
                  builder: (context, DrawerStates state) {
                    return state as Widget;
                  },
                ),
              ),
            ],
          ),
          endDrawer: ClipPath(
            clipper: _DrawerClipper(),
            child: Drawer(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 48, bottom: 32),
                  height: (orientation == Orientation.portrait)
                      ? MediaQuery.of(context).size.height
                      : MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.only(right: 20, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Icon(Icons.close),
                        ),
                      ),

                      Spacer(),
                      // FlatButton(
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //     _openSignOutDrawer(context);
                      //   },
                      //   child: RichText(
                      //     text: TextSpan(children: [
                      //       TextSpan(
                      //         text: "Not Laura? ",
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           color: Theme.of(context).primaryColor,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: "Sign out",
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           color: Theme.of(context).primaryColor,
                      //           decoration: TextDecoration.underline,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //     ]),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String findSelectedTitle(DrawerStates state) {
    if (state is UserProfileScreen) {
      return "User Profile";
    } else {
      assert(state is NotificationScreen);
      return "Notifications";
    }
  }

  void _openSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        // shape: BottomSheetShape(),
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 16,
              left: 48,
              right: 48,
            ),
            height: 180,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Laura, are you sure you want to sign out?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Text(
                          "Sign out",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {},
                        borderSide: BorderSide(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Stay logged in",
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class _DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(50, 0);
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
