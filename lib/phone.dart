
import 'package:hive/hive.dart';

part 'phone.g.dart';
@HiveType(typeId: 0)
class Phone extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int price;
  @HiveField(2)
  final int quantitive;

  Phone({required this.name, required this.price, required this.quantitive});
}