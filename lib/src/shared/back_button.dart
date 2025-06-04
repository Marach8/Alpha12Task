import '../global_export.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    required this.text,
    this.shouldPop = true
  });

  final String text;
  final bool shouldPop;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: A12Strings.BACK_BTN,
      child: A12Container(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        height: 44, color: A12Colors.white,
        border: Border(
          top: BorderSide(color: A12Colors.hexE2E8F0),
          bottom: BorderSide(color: A12Colors.hexF5F5F5),
        ),
        child: InkWell(
          onTap: shouldPop ? () => context.pop() : null,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.keyboard_arrow_left,
                color: A12Colors.hex64748B,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall
              )
            ]
          ),
        )
      ),
    );
  }
}