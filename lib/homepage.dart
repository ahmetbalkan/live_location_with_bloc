import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_location_with_bloc/bloc/livelocation/livelocation_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Location")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LivelocationBloc, LivelocationState>(
          builder: (context, state) {
            if (state is LivelocationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LivelocationLoaded) {
              try {
                return Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Latitude : ${state.position.latitude}"),
                    Text("Longitude : ${state.position.longitude}")
                  ],
                ));
              } catch (e) {
                return Text(e.toString());
              }
            } else {
              return const Text("Something wrong");
            }
          },
        ),
      ),
    );
  }
}
