import '../common/Api_Data.dart';
import '../data/member.dart';

class MemberRepository{
  final ApiData _apiData = ApiData('http://localhost:8080');
  
  Future<List<Member>> getAllMember() async {
      final response = await _apiData.getData("/member");
      return response.map((json) => Member.fromJson(json)).toList();
  }
}