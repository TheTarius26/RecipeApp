import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/presentation/blocs/home/home_bloc.dart';
import 'package:recipe_app/presentation/injector/injector.dart';
import 'package:recipe_app/presentation/module/home/widgets/card_bookmark.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => getIt()..add(const HomeInitial()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Builder(
                  builder: (context) {
                    final height = MediaQuery.of(context).size.height * .4;
                    return Container(
                      width: double.infinity,
                      height: height,
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * .2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: ColoredBox(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        'Recipe App',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.account_circle,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: height * .8 - 32,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Bookmarks',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                    ColoredBox(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      child: const SizedBox(
                                        width: double.infinity,
                                        height: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: double.infinity,
                                      child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                        ),
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder: (context, index) =>
                                            const CardBookmark(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Home Screen',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
