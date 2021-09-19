import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/modules/home/bloc/home_event.dart';
import 'package:login_app/modules/home/widget/home_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  HomeBloc? homeBloc;

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    if (currentScroll == maxScroll) homeBloc!.add(HomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    scrollController.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        title: Text('Paging'),
      ),
      body: Container(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeUninitialized) {
            return Center(child: CircularProgressIndicator());
          } else {
            HomeLoaded homeLoaded = state as HomeLoaded;
            return ListView.builder(
              controller: scrollController,
                itemCount: homeLoaded.hasReachedMax!
                    ? homeLoaded.homes!.length
                    : homeLoaded.homes!.length + 1,
                itemBuilder: (context, index) {
                  return index < homeLoaded.homes!.length
                      ? HomeItem(responsePost: homeLoaded.homes![index])
                      : Center(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ),
                        );
                });
          }
        }),
      ),
    );
  }
}
