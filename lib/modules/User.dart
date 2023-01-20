
class User {
  String _userName;
  String _avatarURL;

  User(this._userName, this._avatarURL);

  String get avatarURL => _avatarURL;

  set avatarURL(String value) {
    _avatarURL = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }
}