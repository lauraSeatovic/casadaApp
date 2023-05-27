class Member {
  int? memberId;
  String? memberName;
  String? memberSurname;
  String? memberEmail;
  String? memberPassword;
  int? roleId;
  String? roleName;

  Member(
      {this.memberId,
      this.memberName,
      this.memberSurname,
      this.memberEmail,
      this.memberPassword,
      this.roleId,
      this.roleName});

  Member.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    memberName = json['memberName'];
    memberSurname = json['memberSurname'];
    memberEmail = json['memberEmail'];
    memberPassword = json['memberPassword'];
    roleId = json['roleId'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberId'] = this.memberId;
    data['memberName'] = this.memberName;
    data['memberSurname'] = this.memberSurname;
    data['memberEmail'] = this.memberEmail;
    data['memberPassword'] = this.memberPassword;
    data['roleId'] = this.roleId;
    data['roleName'] = this.roleName;
    return data;
  }
}