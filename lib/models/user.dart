class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String? profileImage;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.profileImage,
    this.phoneNumber,
  });

  factory User.dummy() {
    return User(
      id: 027,
      name: "Ayank Tio",
      userName: "yangyo",
      email: "2006146@itg.ac.id",
      profileImage: "https://scontent-sin6-4.xx.fbcdn.net/v/t39.30808-6/315560104_2647497042050512_9097400968069790629_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFMvzrcyYAy31UZaocU5a51BDmDWCYCoPMEOYNYJgKg8xmR73dt-kNiraNwGzNHxmWZ4vVz2FFda8PXGx52UYMB&_nc_ohc=emIxv2NYtq4AX-ekDRw&_nc_ht=scontent-sin6-4.xx&oh=00_AfAGg0qkCtuC5rlIHurRl71XbTMAofCKx8hQc8OtCU8pGA&oe=642C116F",
      phoneNumber: "089663455221",
    );
  }
}
