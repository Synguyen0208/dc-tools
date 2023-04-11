import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/app_model.dart';
import 'package:store/modules/dynamic_layout/configs/app_config.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/colors.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});
  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _selectedIndex = 0;
  bool offstage = false;
  List<BottomTabConfig> get tabData =>
      Provider.of<AppModel>(context, listen: false).appConfig!.bottomTab;
  final navigators = <int, GlobalKey<NavigatorState>>{};
  final List<Widget> _tabView = [];

  void _initTabData() async {
    var tabView = <Widget>[];
    var appModel = Provider.of<AppModel>(context, listen: false);
    var tabData = appModel.appConfig!.bottomTab;
    for (var i = 0; i < tabData.length; i++) {
      BottomTabConfig dataOfTab = tabData[i];
      navigators[i] = GlobalKey<NavigatorState>();
      final initialRoute = dataOfTab.pageName;
      tabView.add(tabViewItem(
        key: navigators[i],
        initialRoute: initialRoute,
        args: null,
      ));
    }
    if (tabView.isNotEmpty) {
      _tabView.clear();
      _tabView.addAll(tabView);
    }
  }

  Navigator tabViewItem({key, initialRoute, args}) {
    return Navigator(
      key: key,
      initialRoute: initialRoute,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == initialRoute) {
          return Routes.getRouteGenerate(RouteSettings(
            name: initialRoute,
            arguments: args,
          ));
        }
        return Routes.getRouteGenerate(settings);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initTabData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabView[_selectedIndex],
      bottomNavigationBar: Offstage(
        offstage: offstage,
        child: BottomNavigationBar(
          onTap: (value) => setState(() => _selectedIndex = value),
          currentIndex: _selectedIndex,
          items: tabData
              .map(
                (tab) => BottomNavigationBarItem(
                  icon: Image.asset(tab.icon!, width: 24, height: 24),
                  activeIcon: Image.asset(
                    tab.activeIcon!,
                    width: 24,
                    height: 24,
                    color: AppColors.primary,
                  ),
                  label: tab.title,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
