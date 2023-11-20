import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ui_1/provider/weather_provider.dart';

class WeatherApp extends ConsumerWidget {
  final bool icons = false;
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        // backgroundColor: const Color(0xff493C94),
        body: ref.watch(getWeatherProvider).when(
      data: (data) {
        return Container(
          padding: const EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1558486012-817176f84c6d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2VhdGhlcnxlbnwwfHwwfHx8MA%3D%3D'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      )),
                  Column(
                    children: [
                      const Text(
                        'My Location',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        data!.city.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        size: 30,
                        color: Colors.white,
                      ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                '⛅',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                '${(data.list[0].main.temp - 273.15).toStringAsFixed(2)}°C',
                style: const TextStyle(fontSize: 70, color: Colors.white),
              ),
              Text(
                "Feels like ${(data.list[0].main.feelsLike - 273.15).toStringAsFixed(2)}°C",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                "${data.list[0].weather[0].description}",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 80,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text(
              //       'Latitude',
              //       style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.black.withOpacity(.8),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 40,
              //     ),
              //     Text(
              //       data.city.coord.lat.toString(),
              //       style: TextStyle(
              //           fontSize: 21,
              //           color: Colors.black.withOpacity(.8),
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text(
              //       'Longitude',
              //       style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.black.withOpacity(.8),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 40,
              //     ),
              //     Text(
              //       data.city.coord.lon.toString(),
              //       style: TextStyle(
              //           fontSize: 21,
              //           color: Colors.black.withOpacity(.8),
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.black.withOpacity(.7),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '5-day forecast',
                      style: TextStyle(
                          fontSize: 20, color: Colors.black.withOpacity(.8)),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Container(
                                width: 300,
                                height: 300,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Wind',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text('Speed'),
                                        Text(
                                            data.list[1].wind.speed.toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text('Dig'),
                                        Text(data.list[1].wind.deg.toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text('Gust'),
                                        Text(data.list[1].wind.gust.toString()),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Visibility',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text("What's Today"))
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.sizeOf(context).width,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      const Color.fromARGB(255, 201, 200, 200).withOpacity(.8),
                ),
                child: ListView.builder(
                  itemCount: data.list.length,
                  itemBuilder: (context, index) {
                    final temps = data.list[index].main.temp;
                    int weathers = 282;
                    return ListTile(
                      leading: temps > weathers
                          ? const Icon(Icons.cloud)
                          : const Icon(Icons.cloudy_snowing),
                      title: Text(
                        'Time: ${data.list[index].dtTxt.hour}:${data.list[index].dtTxt.minute}${data.list[index].dtTxt.millisecond}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Date: ${data.list[index].dtTxt.day}/${data.list[index].dtTxt.month}/${data.list[index].dtTxt.year}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: Text(
                        '${(data.list[index].main.temp - 273.15).toStringAsPrecision(2)}°C',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const Text('Retry');
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
