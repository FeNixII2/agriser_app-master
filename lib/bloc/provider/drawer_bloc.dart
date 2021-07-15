import 'package:agriser/pages/provider/prov_edit_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:agriser/pages/provider/provnotification_screen.dart';
import 'package:agriser/pages/provider/prov_profile_screen.dart';

enum DrawerEvents { ProfileEvent, NotificationEvent }

abstract class DrawerStates {}

class DrawerBloc extends Bloc<DrawerEvents, DrawerStates> {
  @override
  DrawerStates get initialState => ProvProfileScreen();

  @override
  Stream<DrawerStates> mapEventToState(DrawerEvents event) async* {
    switch (event) {
      case DrawerEvents.ProfileEvent:
        yield ProvProfileScreen();
        break;
      case DrawerEvents.NotificationEvent:
        yield ProvNotificationScreen();
        break;
    }
  }
}
