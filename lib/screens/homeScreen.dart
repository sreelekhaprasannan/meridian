import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meridian/screens/detailsScreen.dart';
import 'package:meridian/utilities/homeProvider.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var screenHeight = MediaQuery.of(context).size.height;
    Provider.of<ProviderHomePage>(context, listen: false)
        .getData(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
                  Icon(
                    Icons.notifications,
                    size: 30,
                  )
                ],
              ),
              SizedBox(height: screenHeight * .01),
              Container(
                alignment: Alignment.centerLeft,
                height: screenHeight * .04,
                child: Text(
                  'Social Media Posts',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: screenHeight * .01),
              SizedBox(
                height: screenHeight * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: homepage_tabBars(
                            screenheight: screenHeight,
                            text: 'Trending',
                            theme: theme,
                            color: Colors.orange)),
                    Expanded(
                        child: homepage_tabBars(
                            screenheight: screenHeight,
                            text: 'Relation Ships',
                            color: const Color.fromARGB(255, 235, 235, 235),
                            theme: theme)),
                    Expanded(
                        child: homepage_tabBars(
                            text: 'Self Care',
                            color: const Color.fromARGB(255, 235, 235, 235),
                            theme: theme,
                            screenheight: screenHeight))
                  ],
                ),
              ),
              SizedBox(height: screenHeight * .01),
              Container(
                height: screenHeight * .8,
                child:
                    Consumer<ProviderHomePage>(builder: (context, home, child) {
                  return home.homeTiledata.length > 0
                      ? RefreshIndicator(
                          onRefresh: () async {
                            await Provider.of<ProviderHomePage>(context,
                                    listen: false)
                                .getData(context: context);
                          },
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                  ),
                                  title: Container(
                                    height: screenHeight * .18,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Text(
                                            home.homeTiledata[index].title,
                                            maxLines: 5,
                                          ),
                                        )),
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Wrap(
                                                children: [
                                                  TextButton.icon(
                                                      onPressed: () {},
                                                      icon: Icon(Icons
                                                          .thumb_up_outlined),
                                                      label: Text('2')),
                                                  TextButton.icon(
                                                      onPressed: () {},
                                                      icon: Icon(Icons
                                                          .comment_outlined),
                                                      label: Text(''))
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      CupertinoIcons.reply),
                                                  label: Text('')),
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ScreenDetailsPage()));
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: home.homeTiledata.length),
                        )
                      : Container(
                          child: Center(child: Text('No Data found')),
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget homepage_tabBars(
      {Color color = Colors.grey,
      required String text,
      required screenheight,
      required ThemeData theme}) {
    Color textColor = color;
    if (color == Colors.orange) {
      textColor = Colors.white;
    } else {
      textColor = Color.fromARGB(226, 32, 32, 32);
    }
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: screenheight * .04,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        // color: color,
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.bodySmall!.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
