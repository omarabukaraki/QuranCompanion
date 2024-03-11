import 'package:flutter/material.dart';
import 'package:quran_companion/core/custom_search_Bar.dart';
import 'package:quran_companion/feature/radio_feature/presentation/view/widgets/radio_component.dart';
import 'package:quran_companion/feature/radio_feature/data/model/radio_model.dart';
import 'radio_controller_page.dart';

class RadioMobileLayout extends StatefulWidget {
  const RadioMobileLayout({
    super.key,
    required this.radioChannel,
  });

  final List<RadioModel> radioChannel;

  @override
  State<RadioMobileLayout> createState() => _RadioMobileLayoutState();
}

class _RadioMobileLayoutState extends State<RadioMobileLayout> {
  List<RadioModel> filteredRadios = [];
  String queryP = '';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSearchBar(
          onChanged: (value) {
            search(value);
          },
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: filteredRadios.isEmpty
              ? widget.radioChannel.length
              : filteredRadios.length,
          itemBuilder: (context, index) {
            return RadioComponent(
              name: filteredRadios.isEmpty
                  ? widget.radioChannel[index].name
                  : filteredRadios[index].name,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return RadioControllerPage(
                        radioChannel: filteredRadios.isEmpty
                            ? widget.radioChannel[index]
                            : filteredRadios[index]);
                  },
                ));
              },
            );
          },
        )
      ],
    );
  }

  void search(String query) {
    setState(
      () {
        queryP = query;
        filteredRadios = widget.radioChannel
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
    );
  }
}
