import 'package:casada/data/member.dart';
import 'package:casada/members/member_repository.dart';

import '../common/Api_Data.dart';

class MemberBloc{
  final MemberRepository _memberRepository = MemberRepository();
  Future<List<Member>> loadAllMember() async {
    final members = await _memberRepository.getAllMember();
    return members;
  }
}