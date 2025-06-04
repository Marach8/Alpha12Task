import '../global_export.dart';

class A12AppBar extends StatelessWidget implements PreferredSizeWidget {
  const A12AppBar({
    super.key,
    this.title,
    this.leading,
    this.centerTitle = true,
    this.actions,
    this.leadingWidth = 60.0,
    this.bgColor,
    this.titleStyle,
    this.titleText,
    this.horizPadding,
    this.bottom
  });

  final Widget? title, leading;
  final String? titleText;
  final TextStyle? titleStyle;
  final bool? centerTitle;
  final List<Widget>? actions;
  final double? leadingWidth;
  final Color? bgColor;
  final (double?, double?)? horizPadding;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      centerTitle: centerTitle ?? true,
      leading: Padding(
        padding: EdgeInsets.only(left: horizPadding?.$1 ?? 16),
        child: leading
      ),
      title: title,
      leadingWidth: leadingWidth,
      actions: actions,
      actionsPadding: EdgeInsets.only(right: horizPadding?.$2 ?? 16),
      bottom: bottom,
    );
  }

   @override
  Size get preferredSize {
    final double bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight((kToolbarHeight * 0.4) + bottomHeight);
  }
}
