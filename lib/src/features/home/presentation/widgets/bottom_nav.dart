import 'package:alpha_12_task/src/global_export.dart';

class A12BottomNav extends StatefulWidget {
  const A12BottomNav({
    super.key,
    this.horizSidePadding = 16,
    this.horizIndicatorPadding = 12,
    this.durationMilli = 300,
    this.indicatorColor,
    this.icon2TextGap = 15,
    this.indicatorRadius = 20,
    this.vertIndicatorPadding = 5,
    this.navBarHeight = 90,
    this.curve = Curves.decelerate,
    this.navLabels,
    this.onNavPressedOverrides,
    required this.navBuilders,
  }) : assert(
      navLabels == null || navLabels.length == navBuilders.length,
      A12Strings.LABELS_MUST_MATCH_ICONS,
    );

  final double horizSidePadding, horizIndicatorPadding,
  vertIndicatorPadding, icon2TextGap, navBarHeight;
  final double? indicatorRadius;
  final int durationMilli;
  final Color? indicatorColor;
  final Curve curve;
  final List<String>? navLabels;
  final List<Widget Function(bool isSelected)> navBuilders;
  final Map<int, VoidCallback>? onNavPressedOverrides;


  @override
  State<A12BottomNav> createState() => _A12BottomNavState();
}

class _A12BottomNavState extends State<A12BottomNav> {
  late final List<GlobalKey> _navIconKeys;
  late final List<GlobalKey> _navKeys;
  final List<double> _navsWidths = <double>[];
  late double screenWidth;

  int _selectedIndex = 0;
  double _totalNavWidths = 0;
  double _navsHeight = 0;
  double _navsSpacing = 0;
  double _indicatorLeft = 0;
  double _indicatorWidth = 0;
  double _indicatorHeight = 0;


  @override
  void initState() {
    super.initState();
    _navIconKeys = List<GlobalKey>.generate(widget.navBuilders.length, (_) => GlobalKey());
    _navKeys = List<GlobalKey>.generate(widget.navBuilders.length, (_) => GlobalKey());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = 0;
    _totalNavWidths = 0;
    _navsHeight = 0;
    _navsSpacing = 0;
    _indicatorLeft = 0;
    _indicatorWidth = 0;
    _indicatorHeight = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) => _intializeTabs());
  }

  void _intializeTabs() {
    double maxTabWidth = 0;

    for (GlobalKey iconKey in _navIconKeys) {
      final BuildContext? context = iconKey.currentContext;
      if (context == null) return;

      final RenderBox box = context.findRenderObject() as RenderBox;
      final Size size = box.size;

      if (size.height > _navsHeight) {
        _navsHeight = size.height;
      }

      if (size.width > maxTabWidth) {
        maxTabWidth = size.width;
      }
    }

    for (GlobalKey navKey in _navKeys) {
      final BuildContext? context = navKey.currentContext;
      if (context == null) return;

      final RenderBox box = context.findRenderObject() as RenderBox;
      final Size size = box.size;
      _navsWidths.add(size.width);
      _totalNavWidths += size.width;

    }

    screenWidth = context.screenWidth;

    final double totalSpacing = screenWidth - _totalNavWidths - 
      (2 * (widget.horizSidePadding + widget.horizIndicatorPadding));

    final double gaps = widget.navBuilders.length - 1;
    _navsSpacing = gaps > 0 ? totalSpacing / gaps : 0;

    final double fixedWidth = maxTabWidth + (2 * widget.horizIndicatorPadding);

    if (!mounted) return;

    setState(() {
      _indicatorLeft = _calculateIndicatorLeft(_selectedIndex, fixedWidth);
      _indicatorWidth = fixedWidth;
      _indicatorHeight = _navsHeight + (2 * widget.vertIndicatorPadding);
    });
  }


  void _updateIndicatorPosition(int index) {
    if (!mounted) return;
    setState(() {
      _selectedIndex = index;
      _indicatorLeft = _calculateIndicatorLeft(index, _indicatorWidth);
    });
  }


  double _calculateIndicatorLeft(int index, double fixedWidth) {
    if (_navsWidths.length <= index) return 0;

    double left = 0;
    for (int i = 0; i < index; i++) {
      left += _navsWidths[i] + _navsSpacing;
    }

    final double tabCenterOffset = (_navsWidths[index] - fixedWidth) / 2;
    return left + tabCenterOffset;
  }


  @override
  Widget build(BuildContext context) {
    return A12Container(
      height: widget.navBarHeight,
      width: context.screenWidth,
      padding: EdgeInsets.fromLTRB(
        (widget.horizSidePadding + widget.horizIndicatorPadding),
        15, 
        (widget.horizSidePadding + widget.horizIndicatorPadding),
        0
      ),
      alignment: Alignment.topCenter,
      color: A12Colors.white.withValues(alpha: 0.95),
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
              color: widget.indicatorColor,
              radius: widget.indicatorRadius ?? _indicatorHeight * 0.5,
              height: _indicatorHeight,
              width: _indicatorWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.navBuilders.indexed.map(
              ((int, Widget Function(bool)) navEntry){
                final int navIndex = navEntry.$1;
                final bool isSelected = _selectedIndex == navIndex;

                final String? label = widget.navLabels?.elementAtOrNull(navIndex);
                
                return A12Container(
                  key: _navKeys[navIndex],                                 
                  onTap: () {
                    if (widget.onNavPressedOverrides?.containsKey(navIndex) ?? false) {
                      widget.onNavPressedOverrides![navIndex]!();
                    } else {
                      _updateIndicatorPosition(navIndex);
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: widget.vertIndicatorPadding,),
                      SizedBox(
                        key: _navIconKeys[navIndex],
                        child: navEntry.$2(isSelected)
                      ),
                      if(label != null) SizedBox(height: widget.icon2TextGap),
                      if(label != null) Text(
                        label, textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isSelected ? widget.indicatorColor : null,
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

