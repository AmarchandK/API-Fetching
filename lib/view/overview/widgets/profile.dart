import 'package:deep_nucleus/controller/overview_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final OverViewProvider provider;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              provider.ownersDetail.profileUrl)),
      title: Text(
          provider.ownersDetail.name.toUpperCase()),
      subtitle:
          Text('Member since ${provider.userDate}'),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.forward)),
    );
  }
}
