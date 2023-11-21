import 'package:bloc/bloc.dart';

part 'listdisplay_state.dart';

class ListdisplayCubit extends Cubit<ListDisplayTypeState> {
  ListdisplayCubit()
      : super(ListDisplayTypeState(type: ListDisplayType.listview));
  toggleListType() {
    emit(ListDisplayTypeState(
      type: state.type == ListDisplayType.listview
          ? ListDisplayType.gridview
          : ListDisplayType.listview,
    ));
  }
}
