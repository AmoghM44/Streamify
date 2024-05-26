// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:jitsi_meet/jitsi_meet.dart';
// import 'package:custom_jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:custom_jitsi_meet/jitsi_meet.dart';
import 'package:zoom_2/resources/auth_methods.dart';
import 'package:zoom_2/resources/firestore_methods.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
// import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  final _jitsiMeetPlugin = JitsiMeet();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name = username.isEmpty ? _authMethods.user.displayName! : username;

      // FeatureFlags featureFlag = FeatureFlag();
      // FeatureFlags.welcomePageEnabled = false;
      // featureFlag.resolution = FeatureFlagVideoResolution
          // .MD_RESOLUTION; // Limit video resolution to 360p
      // String name;
      // if (username.isEmpty) {
      //   name = _authMethods.user.displayName!;
      // } else {
      //   name = username;
      // }
      var options = JitsiMeetConferenceOptions(room: roomName,configOverrides: {
        "startWithAudioMuted" : isAudioMuted,
        "startWithVideoMuted" : isVideoMuted,
        // "subject" : "Jitsi with Flutter",
      },
      featureFlags: {
        FeatureFlags.welcomePageEnabled: false,
        FeatureFlags.resolution: FeatureFlagVideoResolutions.resolution720p,
      },
      userInfo: JitsiMeetUserInfo(
          displayName: name,
          email: _authMethods.user.email,
          avatar: _authMethods.user.photoURL,
      ),
);
        // ..userDisplayName = name
        // ..userEmail = _authMethods.user.email
        // ..userAvatarURL = _authMethods.user.photoURL
        // ..audioMuted = isAudioMuted
        // ..videoMuted = isVideoMuted
        // ..featureFlags 
        // ;

      _firestoreMethods.addToMeetingHistory(roomName);
      await _jitsiMeetPlugin.join(options);
    } catch (error) {
      print("error: $error");
    }
  }

  
}
