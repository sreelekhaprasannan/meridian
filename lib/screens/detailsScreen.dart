import 'package:flutter/material.dart';
import 'package:meridian/utilities/homeProvider.dart';
import 'package:provider/provider.dart';

class ScreenDetailsPage extends StatelessWidget {
  const ScreenDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderHomePage>(context, listen: false)
        .getDetails(context: context);
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<ProviderHomePage>(builder: (context, data, child) {
          return data.detailsData.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(data.detailsData[index].body);
                  },
                  itemCount: data.detailsData.length,
                )
              : const Center(
                  child: Text(
                    'No Data Found',
                    maxLines: 10,
                  ),
                );
        }),
      ),
    );
  }
}
