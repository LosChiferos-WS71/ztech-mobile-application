import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}

class PlantChartsComponent extends StatelessWidget {
  const PlantChartsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> temperatureData = List.generate(
        12, (index) => ChartData(index.toDouble(), 10 + index.toDouble()));
    final List<ChartData> humidityData = List.generate(
        12, (index) => ChartData(index.toDouble(), 60 - index * 5));
    final List<ChartData> uvData = List.generate(
        12, (index) => ChartData(index.toDouble(), 2 + index.toDouble() / 2));

    return Column(
      children: [
        ChartCard(
            title: "Temperature",
            data: temperatureData,
            color: const Color(0xFFFFCACA)),
        ChartCard(
            title: "Humidity of floor",
            data: humidityData,
            color: const Color(0xFF9FE0C2)),
        ChartCard(
            title: "UV rays", data: uvData, color: const Color(0xFFCADCFF)),
        buildAlert(Icons.notifications_active,
            "The temperature in your plant is very high."),
        buildAlert(Icons.notifications_active,
            "The humidity in your plant is very high."),
        buildAlert(Icons.notifications_active,
            "The UV rays in your plant are very high."),
      ],
    );
  }
}

class ChartCard extends StatelessWidget {
  final String title;
  final List<ChartData> data;
  final Color color;

  const ChartCard(
      {super.key,
      required this.title,
      required this.data,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20)),
          ),
          SizedBox(
            height: 100,
            child: SfCartesianChart(
              primaryXAxis: const NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 1,
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                interval: 10,
                maximum: 20,
                majorGridLines: MajorGridLines(width: 0),
              ),
              series: <FastLineSeries<ChartData, double>>[
                FastLineSeries<ChartData, double>(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: Colors.black,
                )
              ],
              plotAreaBorderWidth: 0,
            ),
          ),
        ],
      ),
    );
  }
}

// Función para construir las alertas debajo de los gráficos
Widget buildAlert(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 10), // Añade margen a la izquierda
    child: ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(text),
      horizontalTitleGap: 5,
    ),
  );
}
