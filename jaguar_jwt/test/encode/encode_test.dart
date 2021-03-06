library test.encode;

import 'package:test/test.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

final key = 'secret';

main() {
  group('Encoding', () {
    test('Nopayload', () {
      final claimSet = new JwtClaim(
          issuer: 'teja',
          subject: '1234567890',
          audience: ["admin", "students"],
          issuedAt: new DateTime.fromMillisecondsSinceEpoch(1481842800000,
              isUtc: true));
      String token = issueJwtHS256(claimSet, key);
      expect(token,
          r'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYWRtaW4iLCJzdHVkZW50cyJdLCJleHAiOjE0ODE5MjkyMDAsImlhdCI6MTQ4MTg0MjgwMCwiaXNzIjoidGVqYSIsInN1YiI6IjEyMzQ1Njc4OTAifQ==.sbsys3_L_Yc_L8S8KsiX3cBtQp34-jbX_eWhm6O8lxY=');
    });

    test('With payload', () {
      final claimSet = new JwtClaim(
          issuer: 'teja',
          subject: '1234567890',
          audience: ["admin", "students"],
          issuedAt: new DateTime.fromMillisecondsSinceEpoch(1481842800000,
              isUtc: true),
          payload: {"k": "v"});
      String token = issueJwtHS256(claimSet, key);
      expect(token,
          r'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYWRtaW4iLCJzdHVkZW50cyJdLCJleHAiOjE0ODE5MjkyMDAsImlhdCI6MTQ4MTg0MjgwMCwiaXNzIjoidGVqYSIsInBsZCI6eyJrIjoidiJ9LCJzdWIiOiIxMjM0NTY3ODkwIn0=.8C3WCOzfgAGvO7niu31HrkS_m883Vp8MSs7RMr9gN6g=');
    });
  });
}
