import 'package:shoesly/crore/firebase/firebase_exception.dart';

class FirebaseExceptionMapper {
  FirebaseException mapFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseException(message: "Permission Denied", code: e.code);
      case 'not-found':
        return FirebaseException(message: "Data Not Found", code: e.code);
      case 'already-exists':
        return FirebaseException(
            message: "Resource Already Exists", code: e.code);
      case 'deadline-exceeded':
        return FirebaseException(message: "Operation Timed Out", code: e.code);
      case 'unavailable':
        return FirebaseException(message: "Service Unavailable", code: e.code);
      case 'cancelled':
        return FirebaseException(message: "Operation Cancelled", code: e.code);
      case 'data-loss':
        return FirebaseException(
            message: "Data Loss or Corruption", code: e.code);
      case 'internal':
        return FirebaseException(message: "Internal Error", code: e.code);
      case 'resource-exhausted':
        return FirebaseException(message: "Resource Exhausted", code: e.code);
      case 'failed-precondition':
        return FirebaseException(message: "Failed Precondition", code: e.code);
      case 'aborted':
        return FirebaseException(message: "Operation Aborted", code: e.code);
      case 'auth/email-already-in-use':
        return FirebaseException(message: "Email Already In Use", code: e.code);
      case 'auth/invalid-email':
        return FirebaseException(
            message: "Invalid Email Address", code: e.code);
      case 'auth/operation-not-allowed':
        return FirebaseException(
            message: "Operation Not Allowed", code: e.code);
      case 'auth/weak-password':
        return FirebaseException(message: "Weak Password", code: e.code);
      case 'auth/user-disabled':
        return FirebaseException(message: "User Disabled", code: e.code);
      case 'auth/user-not-found':
        return FirebaseException(message: "User Not Found", code: e.code);
      case 'auth/wrong-password':
        return FirebaseException(message: "Wrong Password", code: e.code);
      default:
        return FirebaseException(message: "Unexpected Error", code: e.code);
    }
  }
}
