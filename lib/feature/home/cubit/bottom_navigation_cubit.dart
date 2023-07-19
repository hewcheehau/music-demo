import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

/// Small cubit control the main bottom navigation bar
/// Connect with [TabsRouter] - Auto route tab bar router
class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState());
  TabsRouter? _tabsRouter;

  // void changeBtmIndex(index) => emit(index);
  void switchBtm(index) {
    _tabsRouter?.setActiveIndex(index ?? 0);

    emit(
      BottomNavigationState(
        position: _tabsRouter?.activeIndex ?? 0,
      ),
    );
  }

  void setRouter(TabsRouter tabsRouter) {
    _tabsRouter = tabsRouter;
  }

  TabsRouter? get getTabRouter => _tabsRouter;
}

class BottomNavigationState extends Equatable {
  final int position;
  final bool isShow;
  const BottomNavigationState({this.position = 0, this.isShow = true});

  BottomNavigationState copyWith({
    int? position,
    bool? isShow,
  }) {
    return BottomNavigationState(
        position: position ?? this.position, isShow: isShow ?? this.isShow);
  }

  @override
  List<Object?> get props => [isShow, position];
}
