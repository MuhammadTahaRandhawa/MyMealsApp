import 'package:flutter/material.dart';

class SwitchTile extends StatefulWidget {
  const SwitchTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onChanged,
      required this.value})
      : super(key: key);

  final String title;
  final String subtitle;
  final void Function(bool value) onChanged;
  final bool value;
  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.value,
      onChanged: (value) {
        widget.onChanged(value);
      },
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
