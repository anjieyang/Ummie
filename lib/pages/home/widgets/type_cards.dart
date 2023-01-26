import 'package:flutter/material.dart';
import 'basic_card.dart';

class TypeCard extends StatelessWidget {
  final bool isSelect;
  final Function()? onTap;
  final BasicCard basicCard;

  const TypeCard({
    Key? key,
    required this.basicCard,
    required this.isSelect,
    this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: basicCard.status(isSelect),
    );
  }
}