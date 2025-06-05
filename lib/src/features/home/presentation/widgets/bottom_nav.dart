import 'dart:developer' show log;
import 'dart:io' show Platform;

import 'package:alpha_12_task/src/global_export.dart';

// class A12BottomNav extends StatefulWidget {
//   const A12BottomNav({
//     super.key,
//     this.horizSidePadding = 16,
//     this.indicatorHeight = 32,
//     this.indicatorPadding = 12,
//     this.durationMilli = 300,
//     this.indicatorColor,
//     this.indicatorRadius = 16,
//     this.curve = Curves.decelerate,
//   });

//   final double horizSidePadding, indicatorRadius, 
//   indicatorHeight, indicatorPadding;
//   final int durationMilli;
//   final Color? indicatorColor;
//   final Curve curve;

//   @override
//   State<A12BottomNav> createState() => _A12BottomNavState();
// }

// class _A12BottomNavState extends State<A12BottomNav> {
//   late final List<GlobalKey> _tabKeys;
//   late double screenWidth;
//   int _selectedIndex = 0;

//   double _totalTabWidths = 0;
//   double _tabsHeight = 0;
//   double _tabsSpacing = 0;
//   double _tabWidth = 0;

//   double _indicatorLeft = 0;
//   double _indicatorWidth = 0;

//   final List<String> labels = <String>[
//     A12Strings.HOME, A12Strings.CART,
//     A12Strings.FAVORITES, A12Strings.PROFILE
//   ];

//   final List<String> _iconImgs = const <String>[
//     A12ImgStrings.HOME_ICON, A12ImgStrings.CART_ICON,
//     A12ImgStrings.FAVORITE_ICON, A12ImgStrings.PROFILE_ICON
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabKeys = List<GlobalKey>.generate(_iconImgs.length, (_) => GlobalKey());
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _selectedIndex = 0;
//     _totalTabWidths = 0;
//     _tabsHeight = 0;
//     _tabsSpacing = 0;
//     _tabWidth = 0;
//     _indicatorLeft = 0;
//     _indicatorWidth = 0;
//     WidgetsBinding.instance.addPostFrameCallback((_) => _intializeTabs());
//   }

//   void _intializeTabs() {
//     for (GlobalKey key in _tabKeys) {
//       final BuildContext? context = key.currentContext;
//       if (context == null) return;

//       final RenderBox box = context.findRenderObject() as RenderBox;
//       final Size size = box.size;
//       _totalTabWidths += size.width;
//       // Guarantees that the tabHeight is the height of the tallest tab
//       // (incase the tabs have different sizes)
//       if (size.height > _tabsHeight) {
//         _tabsHeight = size.height;
//       }
//     }

//     _tabWidth = _totalTabWidths/_iconImgs.length;
//     screenWidth = context.screenWidth;

//     final double totalSpacing = screenWidth - _totalTabWidths - 
//       (2 * (widget.horizSidePadding + widget.indicatorPadding));

//     final double gaps = _iconImgs.length - 1;
//     _tabsSpacing = gaps > 0 ? totalSpacing / gaps : 0;

//     setState(() {
//       _indicatorLeft = -widget.indicatorPadding;
//       _indicatorWidth = _tabWidth + (2 * widget.indicatorPadding);
//     });
//   }

//   void _updateIndicatorPosition(int index) {
//     setState(() {
//       _selectedIndex = index;
//       _indicatorLeft = ((_tabsSpacing + _tabWidth) * index) - widget.indicatorPadding;
//       _indicatorWidth = _tabWidth + (2 * widget.indicatorPadding);
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return A12Container(
//       height: 90,
//       width: context.screenWidth,
//       padding: EdgeInsets.fromLTRB(
//         (widget.horizSidePadding + widget.indicatorPadding),
//         15, 
//         (widget.horizSidePadding + widget.indicatorPadding),
//         0
//       ),
//       alignment: Alignment.topCenter,
//       color: A12Colors.white.withValues(alpha: 0.95),
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: <Widget>[
//           AnimatedPositioned(
//             duration: Duration(milliseconds: widget.durationMilli),
//             curve: widget.curve,
//             left: _indicatorLeft,            
//             child: A12Container(
//               color: widget.indicatorColor ?? A12Colors.hex60B5FF,
//               radius: widget.indicatorRadius,
//               height: widget.indicatorHeight,
//               width: _indicatorWidth,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: _iconImgs.indexed.map(
//               ((int, String) tabEntry){
//                 final int tabIndex = tabEntry.$1;
//                 final bool isSelected = _selectedIndex == tabIndex;

//                 final String label = labels.elementAt(tabIndex);
                
//                 return A12Container(
//                   //color: Colors.red, 
//                   key: _tabKeys[tabIndex],                
//                   onTap: (){                    
//                     if(tabIndex == 1){
//                       context.pushNamed(A12Routes.CART_SCREEN);
//                     }
//                     else{
//                       _updateIndicatorPosition(tabIndex);
//                     }
//                   },
//                   child: tabIndex == 1 ?  Stack(
//                     clipBehavior: Clip.none,
//                     children: <Widget>[
//                       ColorFiltered(
//                         colorFilter: ColorFilter.mode(
//                           isSelected ? Theme.of(context).scaffoldBackgroundColor
//                           : Theme.of(context).textTheme.headlineSmall!.color!,
//                           BlendMode.srcATop,                       
//                         ),
//                         child: A12ImgLoader(
//                           imgPath: tabEntry.$2,
//                           height: 24, width: 24,
//                         ),
//                       ),

//                       Consumer(
//                         builder: (_, WidgetRef ref, __) {
//                           final List<Product> cartProducts = ref.watch(
//                             cartProvider.select(CartNotifier.listen2CartProducts),
//                           );

//                           if (cartProducts.isEmpty) {
//                             return const SizedBox.shrink();
//                           }

//                           return Positioned(
//                             top: -5, right: -10,
//                             child: A12Container(
//                               width: 24.04, height: 24.82, radius: 68.17,
//                               padding: const EdgeInsets.fromLTRB(8.52, 3.41, 8.52, 3.41),
//                               color: A12Colors.hex3C4856,
//                               child: Text(
//                                 cartProducts.length.toString(),
//                                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                                   fontSize: 10.22, height: 1.7, color: A12Colors.white,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     ],
//                   ) : ColorFiltered(
//                     colorFilter: ColorFilter.mode(
//                       isSelected ? Theme.of(context).scaffoldBackgroundColor
//                       : Theme.of(context).textTheme.headlineSmall!.color!,
//                       BlendMode.srcATop,                       
//                     ),
//                     child: A12ImgLoader(
//                       imgPath: tabEntry.$2,
//                       height: 24, width: 24,
//                     ),
//                   )
//                 );
//               }
//             ).toList()
//           ),
//         ],
//       ),
//     );
//   }
// }




// Text(
//                         label, textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: isSelected ? A12Colors.hex60B5FF : null,
//                           fontWeight: isSelected ? A12FontWeights.w600 : null,
//                         )
//                       )




class A12BottomNav extends StatefulWidget {
  const A12BottomNav({
    super.key,
    this.horizSidePadding = 16,
    this.horizIndicatorPadding = 12,
    this.durationMilli = 300,
    this.indicatorColor,
    this.iconTextGap = 15,
    this.indicatorRadius = 20,
    this.vertIndicatorPadding = 6,
    this.curve = Curves.decelerate,
  });

  final double horizSidePadding, horizIndicatorPadding,
  vertIndicatorPadding, iconTextGap;
  final double? indicatorRadius;
  final int durationMilli;
  final Color? indicatorColor;
  final Curve curve;

  @override
  State<A12BottomNav> createState() => _A12BottomNavState();
}

class _A12BottomNavState extends State<A12BottomNav> {
  late final List<GlobalKey> _tabIconKeys;
  late final List<GlobalKey> _tabKeys;
  final List<double> _tabsWidths = <double>[];
  late double screenWidth;
  int _selectedIndex = 0;

  double _totalTabWidths = 0;
  double _tabsHeight = 0;
  double _tabsSpacing = 0;

  double _indicatorLeft = 0;
  double _indicatorWidth = 0;
  double _indicatorHeight = 0;

  final List<String> _labels = <String>[
    A12Strings.HOME, A12Strings.CART,
    A12Strings.FAVORITES, A12Strings.PROFILE
  ];

  final List<Widget> _icons = const <Widget>[
    _ColorFilteredIcon(isSelected: false, imagePath: A12ImgStrings.HOME_ICON),
    _CartIcon(isSelected: false, imgPath: A12ImgStrings.CART_ICON,),
    _ColorFilteredIcon(isSelected: false, imagePath: A12ImgStrings.FAVORITE_ICON),
    _ColorFilteredIcon(isSelected: false, imagePath: A12ImgStrings.PROFILE_ICON),
  ];

  @override
  void initState() {
    super.initState();
    _tabIconKeys = List<GlobalKey>.generate(_icons.length, (_) => GlobalKey());
    _tabKeys = List<GlobalKey>.generate(_icons.length, (_) => GlobalKey());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = 0;
    _totalTabWidths = 0;
    _tabsHeight = 0;
    _tabsSpacing = 0;
    _indicatorLeft = 0;
    _indicatorWidth = 0;
    _indicatorHeight = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) => _intializeTabs());
  }

  void _intializeTabs() {
    for (GlobalKey iconKey in _tabIconKeys) {
      final BuildContext? context = iconKey.currentContext;
      if (context == null) return;

      final RenderBox box = context.findRenderObject() as RenderBox;
      final Size size = box.size;
      //_totalTabWidths += size.width;
      // Guarantees that the tabHeight is the height of the tallest tab
      // (incase the tabs have different sizes)
      if (size.height > _tabsHeight) {
        _tabsHeight = size.height;
      }
    }

    for (GlobalKey tabKey in _tabKeys) {
      final BuildContext? context = tabKey.currentContext;
      if (context == null) return;

      final RenderBox box = context.findRenderObject() as RenderBox;
      final Size size = box.size;
      _tabsWidths.add(size.width);
      _totalTabWidths += size.width;
    }

    screenWidth = context.screenWidth;

    final double totalSpacing = screenWidth - _totalTabWidths - 
      (2 * (widget.horizSidePadding + widget.horizIndicatorPadding));

    final double gaps = _icons.length - 1;
    _tabsSpacing = gaps > 0 ? totalSpacing / gaps : 0;
    final double tabWidth = _tabsWidths[_selectedIndex];

    setState(() {
      _indicatorLeft = -widget.horizIndicatorPadding;
      _indicatorWidth = tabWidth + (2 * widget.horizIndicatorPadding);
      _indicatorHeight = _tabsHeight + (2 * widget.vertIndicatorPadding);
    });
  }

  void _updateIndicatorPosition(int index) {
    double newLeft = 0;
    for (int i = 0; i < index; i++) {
      newLeft += _tabsWidths[i] + _tabsSpacing;
    }

    setState(() {
      _selectedIndex = index;
      _indicatorWidth = _tabsWidths[index] + (2 * widget.horizIndicatorPadding);
      _indicatorLeft = newLeft - widget.horizIndicatorPadding;
    });
  }



  @override
  Widget build(BuildContext context) {
    return A12Container(
      height: 90,
      width: context.screenWidth,
      padding: EdgeInsets.fromLTRB(
        (widget.horizSidePadding + widget.horizIndicatorPadding),
        15, 
        (widget.horizSidePadding + widget.horizIndicatorPadding),
        0
      ),
      alignment: Alignment.topCenter,
      color: Colors.red,
      //color: A12Colors.white.withValues(alpha: 0.95),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: widget.durationMilli),
            curve: widget.curve,
            top: 0,
            left: _indicatorLeft,            
            child: A12Container(
              color: widget.indicatorColor ?? A12Colors.hex60B5FF,
              radius: widget.indicatorRadius ?? _indicatorHeight * 0.5,
              height: _indicatorHeight,
              width: _indicatorWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _icons.indexed.map(
              ((int, Widget) tabEntry){
                final int tabIndex = tabEntry.$1;
                final bool isSelected = _selectedIndex == tabIndex;

                final String? label = _labels.elementAtOrNull(tabIndex);
                
                return A12Container(
                  key: _tabKeys[tabIndex],
                  color: Colors.green.withValues(alpha: 0.5),                                  
                  onTap: (){    
                    _updateIndicatorPosition(tabIndex);                
                    // if(tabIndex == 1){
                    //   context.pushNamed(A12Routes.CART_SCREEN);
                    // }
                    // else{
                    //   _updateIndicatorPosition(tabIndex);
                    // }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: widget.vertIndicatorPadding,),
                      SizedBox(
                        key: _tabIconKeys[tabIndex],
                        child: tabEntry.$2
                      ),
                      if(label != null) SizedBox(height: widget.iconTextGap),
                      if(label != null) Text(
                        label, textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isSelected ? A12Colors.hex60B5FF : null,
                          fontWeight: isSelected ? A12FontWeights.w600 : null,
                        )
                      )
                    ],
                  )
                );
              }
            ).toList()
          ),
        ],
      ),
    );
  }
}



class _CartIcon extends StatelessWidget {
  const _CartIcon({
    super.key,
    required this.isSelected,
    required this.imgPath,
  });

  final bool isSelected;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            isSelected ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).textTheme.headlineSmall!.color!,
            BlendMode.srcATop,                       
          ),
          child: A12ImgLoader(
            imgPath: imgPath,
            height: 24, width: 24,
          ),
        ),
    
        Consumer(
          builder: (_, WidgetRef ref, __) {
            final List<Product> cartProducts = ref.watch(
              cartProvider.select(CartNotifier.listen2CartProducts),
            );
    
            if (cartProducts.isEmpty) {
              return const SizedBox.shrink();
            }
    
            return Positioned(
              top: -5, right: -10,
              child: A12Container(
                width: 24.04, height: 24.82, radius: 68.17,
                padding: const EdgeInsets.fromLTRB(8.52, 3.41, 8.52, 3.41),
                color: A12Colors.hex3C4856,
                child: Text(
                  cartProducts.length.toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 10.22, height: 1.7, color: A12Colors.white,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}


class _ColorFilteredIcon extends StatelessWidget {
  const _ColorFilteredIcon({
    required this.isSelected,
    required this.imagePath,
  });
  final bool isSelected;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return  ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Theme.of(context).scaffoldBackgroundColor
        : Theme.of(context).textTheme.headlineSmall!.color!,
        BlendMode.srcATop,                       
      ),
      child: A12ImgLoader(
        imgPath: imagePath,
        height: 24, width: 24,
      ),
    );
  }
}