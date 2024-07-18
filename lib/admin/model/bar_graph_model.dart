import 'package:app_shop_dien_tu/admin/model/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphModel {
  String lable;
  Color color;
  List<GraphModel> graph;

  BarGraphModel(
      {required this.lable, required this.color, required this.graph});
}
