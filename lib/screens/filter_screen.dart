import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:haux/widgets/custom_drop_down.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "filter_screen";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List strings = [
    "3 bedroom",
    '2 Bedroom',
    "Selfcon",
    "1 Bedroom",
    "Single room"
  ];
  List cash = [
    "50,000 - 100,000",
    "100,000 - 180,000",
    "180,000-200,000",
    "200,000-280,000",
    "280,000 - 380,000",
    "380,000 - 450,000"
  ];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(),
                    const CustomDropDown(),
                    Text("Pick Your Home Type",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: const Color(0xff363B64)))),
                    WrappingWidget(strings: strings),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("Pick Price Range",
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: const Color(0xff363B64)))),
                    ),
                    WrappingWidget(strings: cash),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      // this will provide get all the haux in the range of what was choosen
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Apply changes "),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(deviceSize.width, 50),
                        primary: const Color(0xFFC69DFF))),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class WrappingWidget extends StatelessWidget {
  const WrappingWidget({
    Key? key,
    required this.strings,
  }) : super(key: key);

  final List strings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Wrap(
        direction: Axis.horizontal,
        children: strings
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 5.0),
                child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item),
                  ),
                  style: TextButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0xffC69DFF), width: 1),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Text("Filter",
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: const Color(0xff363B64),
                      ))),
        ),
        const SizedBox()
      ],
    );
  }
}
