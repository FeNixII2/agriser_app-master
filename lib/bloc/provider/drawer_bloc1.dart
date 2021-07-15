import 'package:agriser/pages/provider/prov_edit_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:agriser/pages/provider/prov_edit_notification_screen.dart';
import 'package:agriser/pages/provider/prov_edit_profile.dart';

enum DrawerEvents { ProfileEvent, NotificationEvent }

abstract class DrawerStates {}

class DrawerBloc extends Bloc<DrawerEvents, DrawerStates> {
  @override
  DrawerStates get initialState => ProvEditProfile();

  @override
  Stream<DrawerStates> mapEventToState(DrawerEvents event) async* {
    switch (event) {
      case DrawerEvents.ProfileEvent:
        yield ProvEditProfile();
        break;
      case DrawerEvents.NotificationEvent:
        yield ProvEditNotificationScreen();
        break;
    }
  }
}
