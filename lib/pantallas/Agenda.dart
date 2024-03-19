//////////////////////////////////////////////////////////
//////// Clase para la pantalla de "Agenda". /////////////
//////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class Agenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        // Configuraciones iniciales de tu aplicación.
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: AgendaScreen(),
      ),
    );
  }
}

class AgendaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: Center(
        child: WeekView(
          controller: EventController(),
          eventTileBuilder: (date, events, boundary, start, end) {
            if (events.isNotEmpty) {
              final firstEventTitle = (events[0] as CalendarEventData).title;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  firstEventTitle ?? '',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return Container();
            }
          },
          fullDayEventBuilder: (events, date) {
            if (events.isNotEmpty) {
              final firstEventTitle = (events[0] as CalendarEventData).title;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  firstEventTitle ?? '',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return Container();
            }
          },
          showLiveTimeLineInAllDays: true,
          width: 400,
          minDay: DateTime(2022, 1, 1),
          maxDay: DateTime(2022, 12, 31),
          initialDay: DateTime.now(),
          heightPerMinute: 2,
          eventArranger: SideEventArranger(),
          onEventTap: (events, date) => print(events),
          onDateLongPress: (date) => print(date),
          startDay: WeekDays.sunday,
          startHour: 8,
          showVerticalLines: true,
          hourLinePainter: (Color lineColor, double lineHeight, double offset, double minuteHeight,
              bool showVerticalLine, double verticalLineOffset, LineStyle lineStyle, double lineOffset,
              double lineWidth, double lineLength, int lineCount) {
            // Tu propio pintor personalizado para las líneas de horas.
            return HourLinePainter(lineColor);
          },
          weekPageHeaderBuilder: WeekHeader.hidden,
        ),
      ),
    );
  }
}

class HourLinePainter extends CustomPainter {
  final Color lineColor;

  HourLinePainter(this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    // Implementa la lógica de pintura de las líneas de horas aquí.
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
