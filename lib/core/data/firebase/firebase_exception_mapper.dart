import 'package:firebase_core/firebase_core.dart';
import 'package:shoesly/core/data/firebase/firebase_exception.dart'; // Ensure you import this for FirebaseException

class FirebaseExceptionMapper {
  static FirebaseServiceException mapFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseServiceException(
            message: "Permission Denied", code: e.code);
      case 'not-found':
        return FirebaseServiceException(
            message: "Data Not Found", code: e.code);
      case 'already-exists':
        return FirebaseServiceException(
            message: "Resource Already Exists", code: e.code);
      case 'deadline-exceeded':
        return FirebaseServiceException(
            message: "Operation Timed Out", code: e.code);
      case 'unavailable':
        return FirebaseServiceException(
            message: "Service Unavailable", code: e.code);
      case 'cancelled':
        return FirebaseServiceException(
            message: "Operation Cancelled", code: e.code);
      case 'data-loss':
        return FirebaseServiceException(
            message: "Data Loss or Corruption", code: e.code);
      case 'internal':
        return FirebaseServiceException(
            message: "Internal Error", code: e.code);
      case 'resource-exhausted':
        return FirebaseServiceException(
            message: "Resource Exhausted", code: e.code);
      case 'failed-precondition':
        return FirebaseServiceException(
            message: "Failed Precondition", code: e.code);
      case 'aborted':
        return FirebaseServiceException(
            message: "Operation Aborted", code: e.code);
      case 'auth/email-already-in-use':
        return FirebaseServiceException(
            message: "Email Already In Use", code: e.code);
      case 'auth/invalid-email':
        return FirebaseServiceException(
            message: "Invalid Email Address", code: e.code);
      case 'auth/operation-not-allowed':
        return FirebaseServiceException(
            message: "Operation Not Allowed", code: e.code);
      case 'auth/weak-password':
        return FirebaseServiceException(message: "Weak Password", code: e.code);
      case 'auth/user-disabled':
        return FirebaseServiceException(message: "User Disabled", code: e.code);
      case 'auth/user-not-found':
        return FirebaseServiceException(
            message: "User Not Found", code: e.code);
      case 'auth/wrong-password':
        return FirebaseServiceException(
            message: "Wrong Password", code: e.code);
      default:
        return FirebaseServiceException(
            message: "Unexpected Error", code: e.code);
    }
  }
}
