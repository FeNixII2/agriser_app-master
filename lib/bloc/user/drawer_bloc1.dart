import 'package:agriser/pages/user/user_edit_notification_screen.dart';
import 'package:agriser/pages/user/user_edit_profile.dart';
import 'package:bloc/bloc.dart';

enum DrawerEvents { ProfileEvent, NotificationEvent }

abstract class DrawerStates {}

class DrawerBloc extends Bloc<DrawerEvents, DrawerStates> {
  @override
  DrawerStates get initialState => UserEditProfile();

  @override
  Stream<DrawerStates> mapEventToState(DrawerEvents event) async* {
    switch (event) {
      case DrawerEvents.ProfileEvent:
        yield UserEditProfile();
        break;
      case DrawerEvents.NotificationEvent:
        yield UserEditNotificationScreen();
        break;
    }
  }
}
