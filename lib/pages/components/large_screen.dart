import 'package:flutter/material.dart';
import 'package:news_admin/blocs/admin_bloc.dart';
import 'package:news_admin/pages/components/home_card.dart';
import 'package:provider/provider.dart';

class LargeScreen extends StatefulWidget {
  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  Future? users;

  Future? contents;

  Future? notifications;

  Future? categories;

  Future? featuredItems;

  initData() async {
    users = context.read<AdminBloc>().getTotalDocuments('users_count');
    contents = context.read<AdminBloc>().getTotalDocuments('contents_count');
    notifications =
        context.read<AdminBloc>().getTotalDocuments('notifications_count');
    categories =
        context.read<AdminBloc>().getTotalDocuments('categories_count');
    featuredItems =
        context.read<AdminBloc>().getTotalDocuments('featured_count');
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: users,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (!snap.hasData)
                  return HomeCard(title: 'TOTAL USERS', number: 0);
                if (snap.hasError)
                  return HomeCard(title: 'TOTAL USERS', number: 0);
                return HomeCard(title: 'TOTAL USERS', number: snap.data);
              },
            ),
            SizedBox(
              width: 20,
            ),
            FutureBuilder(
              future: contents,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (!snap.hasData)
                  return HomeCard(title: 'TOTAL ARTICLES', number: 0);
                if (snap.hasError)
                  return HomeCard(title: 'TOTAL ARTICLES', number: 0);
                return HomeCard(title: 'TOTAL ARTICLES', number: snap.data);
              },
            ),
            SizedBox(
              width: 20,
            ),
            FutureBuilder(
              future: featuredItems,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (!snap.hasData)
                  return HomeCard(title: 'FEATURED ITEMS', number: 0);
                if (snap.hasError)
                  return HomeCard(title: 'FEATURED ITEMS', number: 0);
                return HomeCard(title: 'FEATURED ITEMS', number: snap.data);
              },
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: notifications,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (!snap.hasData)
                  return HomeCard(title: 'TOTAL NOTIFICATIONS', number: 0);
                if (snap.hasError)
                  return HomeCard(title: 'TOTAL NOTIFICATIONS', number: 0);
                return HomeCard(
                    title: 'TOTAL NOTIFICATIONS', number: snap.data);
              },
            ),
            SizedBox(
              width: 20,
            ),
            FutureBuilder(
              future: categories,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (!snap.hasData)
                  return HomeCard(title: 'TOTAL CATEGORIES', number: 0);
                if (snap.hasError)
                  return HomeCard(title: 'TOTAL CATEGORIES', number: 0);
                return HomeCard(title: 'TOTAL CATEGORIES', number: snap.data);
              },
            ),
          ],
        ),
      ],
    );
  }
}
