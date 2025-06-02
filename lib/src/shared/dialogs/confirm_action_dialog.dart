import '../../global_export.dart';

Future<bool?> confirmActionDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String yesString,
  required String noString
}) async{
  return await showDialog<bool?>(
    context: context,
    builder: (BuildContext dialogContext) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(
              title, maxLines: 3, textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall
            ),
          ),
          if(content.isNotEmpty)Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              content, maxLines: 3, textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium
            ),
          ),
          AfriDivider(
            color: Theme.of(context).textTheme.headlineSmall?.color
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => dialogContext.pop(true),
                child: Text(
                  yesString,
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ),
              AfriDivider(
                axis: AxisType.vertical, height: 50,
                color: Theme.of(context).textTheme.headlineSmall?.color
              ),
              GestureDetector(
                onTap: () => dialogContext.pop(false),
                child: Text(
                  noString,
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ),
            ],
          )
        ],
      )
    )
  );
}
