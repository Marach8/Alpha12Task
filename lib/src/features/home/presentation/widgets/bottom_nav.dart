import 'dart:developer' show log;

import 'package:alpha_12_task/src/global_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class A12BottomNav extends StatefulWidget {
  const A12BottomNav({
    super.key,
    this.horizSidePadding = 16,
    this.indicatorHeight = 32,
    this.indicatorPadding = 12,
    this.durationMilli = 300,
    this.indicatorColor,
    this.indicatorRadius = 16,
    this.curve = Curves.decelerate,
  });

  final double horizSidePadding, indicatorRadius, 
  indicatorHeight, indicatorPadding;
  final int durationMilli;
  final Color? indicatorColor;
  final Curve curve;

  @override
  State<A12BottomNav> createState() => _A12BottomNavState();
}

class _A12BottomNavState extends State<A12BottomNav> {
  late final List<GlobalKey> _tabKeys;
  late double screenWidth;
  int _selectedIndex = 0;

  double _totalTabWidths = 0;
  double _tabsHeight = 0;
  double _tabsSpacing = 0;
  double _tabWidth = 0;

  double _indicatorLeft = 0;
  double _indicatorWidth = 0;

  final List<String> labels = <String>[
    A12Strings.HOME, A12Strings.CART,
    A12Strings.FAVORITES, A12Strings.PROFILE
  ];

  final List<IconData> tabs = <IconData>[
    Iconsax.home, CupertinoIcons.cart,
    Iconsax.heart, Icons.account_circle_outlined,
  ];

  @override
  void initState() {
    super.initState();
    _tabKeys = List<GlobalKey>.generate(tabs.length, (_) => GlobalKey());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = 0;
    _totalTabWidths = 0;
    _tabsHeight = 0;
    _tabsSpacing = 0;
    _tabWidth = 0;
    _indicatorLeft = 0;
    _indicatorWidth = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) => _intializeTabs());
  }

  void _intializeTabs() {
    for (GlobalKey key in _tabKeys) {
      final BuildContext? context = key.currentContext;
      if (context == null) return;

      final RenderBox box = context.findRenderObject() as RenderBox;
      final Size size = box.size;
      _totalTabWidths += size.width;
      // Guarantees that the tabHeight is the height of the tallest tab
      // (incase the tabs have different sizes)
      if (size.height > _tabsHeight) {
        _tabsHeight = size.height;
      }
    }

    _tabWidth = _totalTabWidths/tabs.length;
    screenWidth = context.screenWidth;

    final double totalSpacing = screenWidth - _totalTabWidths - 
      (2 * (widget.horizSidePadding + widget.indicatorPadding));

    final double gaps = tabs.length - 1;
    _tabsSpacing = gaps > 0 ? totalSpacing / gaps : 0;

    setState(() {
      _indicatorLeft = -widget.indicatorPadding;
      _indicatorWidth = _tabWidth + (2 * widget.indicatorPadding);
    });
  }

  void _updateIndicatorPosition(int index) {
    setState(() {
      _selectedIndex = index;
      _indicatorLeft = ((_tabsSpacing + _tabWidth) * index) - widget.indicatorPadding;
      _indicatorWidth = _tabWidth + (2 * widget.indicatorPadding);
    });
  }


  @override
  Widget build(BuildContext context) {
    return A12Container(
      height: kBottomNavigationBarHeight,
      width: context.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: (widget.horizSidePadding + widget.indicatorPadding)),
      //color: Colors.red,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: widget.durationMilli),
            curve: widget.curve,
            left: _indicatorLeft,            
            child: A12Container(
              color: widget.indicatorColor ?? A12Colors.hex60B5FF,
              radius: widget.indicatorRadius,
              height: widget.indicatorHeight,
              width: _indicatorWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabs.map(
              (IconData tab){
                final int tabIndex = tabs.indexOf(tab);
                final bool isSelected = _selectedIndex == tabIndex;
                final String label = labels.elementAt(tabIndex);
                
                return A12Container(                  
                  onTap: (){
                    _updateIndicatorPosition(tabIndex);
                    if(tabIndex == 1){
                      context.pushNamed(A12Routes.CART_SCREEN);
                    }
                  },
                  child: Icon(
                    key: _tabKeys[tabIndex],
                    tab,
                    color: isSelected ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).textTheme.headlineSmall?.color
                  )
                );
              }
            ).toList()
          ),
          // Positioned(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: labels.map(
          //       (String label){
          //         final int tabIndex = labels.indexOf(label);
          //         final bool isSelected = _selectedIndex == tabIndex;                  
          //         return Text(
          //           label, textAlign: TextAlign.center,
          //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //             color: isSelected ? A12Colors.hex60B5FF : null,
          //             fontWeight: isSelected ? A12FontWeights.w600 : null,
          //           )
          //         );
          //       }
          //     ).toList()
          //   ),
          // ),
        ],
      ),
    );
  }
}




// Text(
//                         label, textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: isSelected ? A12Colors.hex60B5FF : null,
//                           fontWeight: isSelected ? A12FontWeights.w600 : null,
//                         )
//                       )