// Configuración local del prototipo. Reinicia la app tras cambiar constantes.
const bool simulateVerificationSuccess = true;
const VerificationFailure simulatedFailure = VerificationFailure.identity;

enum VerificationFailure {
  expiredToken,
  invalidToken,
  document,
  identity;

  String get message => switch (this) {
    expiredToken => 'El token de invitación ha expirado.',
    invalidToken => 'El token de invitación es inválido o ya fue utilizado.',
    document => 'La fotografía o el documento fue rechazado.',
    identity => 'No fue posible validar la identidad.',
  };
}
