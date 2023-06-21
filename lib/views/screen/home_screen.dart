import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:garut_cctv/models/cctv.dart';
import 'package:garut_cctv/views/componen/cctv_card.dart';
import 'package:garut_cctv/controllers/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ResponseResult> _responseResult;
  late List<Cctv> listOfCctv;
  double expandedHeight = 150;

  @override
  void initState() {
    super.initState();
    _responseResult = ApiService().serverResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            pinned: true,
            actions: [
              IconButton(
                iconSize: 24,
                color: Colors.white,
                onPressed: () {
                  GoRouter.of(context).goNamed(
                    "about",
                  );
                },
                icon: const Icon(Icons.info_outline_rounded),
              )
            ],
            collapsedHeight: 100,
            expandedHeight: expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(color: Colors.black),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.panorama_fish_eye_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Garut cctv App',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.clean_hands_outlined,
                          color: Colors.black,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        AnimatedTextKit(
                          repeatForever: true,
                          pause: const Duration(seconds: 2),
                          animatedTexts: [
                            TyperAnimatedText('Welcome !'),
                            TyperAnimatedText('Stay Safe !'),
                            TyperAnimatedText('Stay Healty !'),
                            // TyperAnimatedText('Garut Bangkit !'),
                            // TyperAnimatedText('Garut Berprestasi !'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // todo: fix height ( box constrain )
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 240,
                    ),
                    margin: const EdgeInsets.only(top: 60),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'List',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'cctv di kabupaten Garut',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // todo : Future builder
                        buildItemsList(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ])
          )
        ],
      ),
    );
  }

  // todo: buildItemsList();
  FutureBuilder<ResponseResult> buildItemsList() {
    return FutureBuilder(
      future: _responseResult,
      builder: (BuildContext context, AsyncSnapshot<ResponseResult> snapshot) {
        var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return const AspectRatio(
              aspectRatio: 1 / 1,
              child: Center(child: CircularProgressIndicator())
            );
          } else {
            if (snapshot.hasData) {
              listOfCctv = snapshot.data!.data;
              return Column(
                children: listOfCctv.map((cctv) => CctvCard(objCctv: cctv)).toList(),
              );
            } else {
              return const AspectRatio(
                aspectRatio: 1 / 1,
                child: Center(
                  child: Text('Tidak dapat terhubung ke server')
                ),
              );
            }
          }
      },
    );
  }
}
