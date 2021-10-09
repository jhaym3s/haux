import 'package:flutter/material.dart';
import 'package:haux/provider_state/haux_info_provider.dart';
import 'package:haux/widgets/vertical_list_item.dart';
import 'package:provider/provider.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({ Key? key }) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final favoriteItems = Provider.of<HauxInfoProvider>(context).getFavourite;
    return SingleChildScrollView(
      child: SizedBox(
        height: deviceSize.height,
        child: ListView.builder(
         // scrollDirection: Axis.vertical,
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
         value: favoriteItems[index],
         child: const VerticalListItem(),
         ),
        ),
      ),
    );
  }
}