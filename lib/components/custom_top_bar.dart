import 'package:flutter/material.dart';

class WeekTopBar extends StatelessWidget {
  WeekTopBar({super.key});

  final List<String> weekLetters = ["D", "S", "T", "Q", "Q", "S", "S"];

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    // Gera os 7 dias da semana começando no domingo da semana atual
    int weekday = today.weekday % 7; // domingo = 0
    DateTime startOfWeek = today.subtract(Duration(days: weekday));

    List<DateTime> daysOfWeek = List.generate(
      7,
      (i) => startOfWeek.add(Duration(days: i)),
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      color: const Color(0xFFFFB5D9), // rosa do fundo
      child: Column(
        children: [
          // Linha com ícones e título "Hoje"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('lib/images/rating_star.png', width: 30,),
                  // Icon(Icons.star, color: Colors.orange, size: 30),
                  SizedBox(width: 4),
                  Text(
                    "50",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "Hoje",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Image.asset('lib/images/medal.png', width: 30,),
                  // Icon(Icons.emoji_events, color: Colors.amber, size: 30),
                  SizedBox(width: 4),
                  Text(
                    "2",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16),

          // Cards dos dias da semana
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (i) {
              bool isToday =
                  daysOfWeek[i].day == today.day &&
                  daysOfWeek[i].month == today.month &&
                  daysOfWeek[i].year == today.year;

              return Container(
                width: 55,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isToday
                      ? const Color(0xFFFFF59D) // amarelo
                      : const Color(0xFF7CE1CD), // verde água
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      weekLetters[i],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      daysOfWeek[i].day.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class CustomTopBar extends StatelessWidget {
//   const CustomTopBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Color(0xFFFFB6C1), // Rosa claro
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset('lib/images/rating_star.png', width: 30,),
//               // Icon(Icons.star, color: Colors.amber, size: 24),
//               SizedBox(width: 6),
//               Text(
//                 '50',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),

//           Text(
//             'Hoje',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.black,
//             ),
//           ),

//           Row(
//             children: [
//               Image.asset('lib/images/medal.png', width: 30,),
//               // Icon(Icons.emoji_events, color: Colors.orange, size: 24),
//               SizedBox(width: 6),
//               Text(
//                 '2',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
