import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final Widget? subtitle;
  final Function()? onPressedActualizar;
  final Function()? onPressedBorrar;
  final Function()? onPressedVer;

  const CardCustom(
      {super.key,
      this.title,
      this.leading,
      this.subtitle,
      this.onPressedActualizar,
      this.onPressedBorrar,
      this.onPressedVer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 170,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: ListTile(
                      leading: leading,
                      title: title,
                      subtitle: subtitle,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      IconButton(
                        splashRadius: 10,
                        onPressed: () => onPressedActualizar!(),
                        icon: const Icon(Icons.update),
                      ),
                      IconButton(
                        splashRadius: 10,
                        onPressed: () => onPressedBorrar!(),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
              MaterialButton(
                color: const Color.fromARGB(200, 116, 227, 247),
                minWidth: 100,
                onPressed: () => onPressedVer!(),
                child: const Text('Ver más'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
