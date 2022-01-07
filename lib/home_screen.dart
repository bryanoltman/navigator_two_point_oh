import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/app_state.dart';
import 'package:navigator_two_point_oh/pages/animals_router_delegate.dart';

enum HomeScreenTab { lions, tigers, bears }

class HomeScreen extends StatefulWidget {
  final AppState appState;
  const HomeScreen({
    Key? key,
    required this.appState,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AnimalsRouterDelegate _animalsRouterDelegate;
  ChildBackButtonDispatcher? _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _animalsRouterDelegate = AnimalsRouterDelegate(widget.appState);
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animalsRouterDelegate.appState = widget.appState;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Defer back button dispatching to the child router
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher
        ?.createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;
    _backButtonDispatcher?.takePriority();

    return Scaffold(
      body: Router(
        routerDelegate: _animalsRouterDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.appState.currentTab.index,
        onTap: (index) =>
            widget.appState.currentTab = HomeScreenTab.values[index],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_3_2_rounded),
            label: 'Lions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_weight),
            label: 'Tigers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link_sharp),
            label: 'Bears',
          ),
        ],
      ),
    );
  }
}
