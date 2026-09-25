# BioWallet · Prototipo Flutter

Frontend con datos ficticios, Navigator y estado local. No realiza autenticación,
HTTP, NFC, reconocimiento facial, escaneo ni deep links reales. La dependencia
flutter_doc_scanner ya existía; se conserva pero no se invoca desde el prototipo.

## Ejecutar

Desde la carpeta del proyecto, con Flutter instalado y disponible en PATH:

```powershell
flutter pub get
flutter devices
flutter run -d <ID_DEL_DISPOSITIVO>
```

Reemplaza el identificador por el que muestre flutter devices. Para Android,
inicia un emulador o conecta un teléfono con depuración USB habilitada.
También puedes probar en Chrome con `flutter run -d chrome`.
La restricción de Dart existente en pubspec.yaml es ^3.13.3; utiliza un Flutter
que incluya una versión compatible.

## Flujo

Inicial → Iniciar sesión → Home (sin necesidad de completar los campos).

En inicio de sesión, la sección DEBUG contiene **Simular invitación**:
Invitación → Validación (2,5 s) → Documento (2 s) → Prueba de vida (2,5 s)
→ Identidad verificada → Crear credencial → Home con confirmación.

El botón de invitación solo se muestra en modo debug. No soy yo y Volver al
inicio regresan a la pantalla inicial. Al finalizar se limpia la pila de
navegación. No se persiste la sesión ni la credencial.

## Simular rechazo

Edita **lib/dev_config.dart**:

```dart
const bool simulateVerificationSuccess = false;
const VerificationFailure simulatedFailure = VerificationFailure.identity;
```

Con true se obtiene éxito; con false se muestra rechazo al terminar la prueba
de vida. Reinicia la app (hot restart, R en flutter run) después de cambiar
estas constantes.

Motivos disponibles y destino de Intentar nuevamente:
- expiredToken: invitación expirada → invitación ficticia nueva.
- invalidToken: token inválido/usado → invitación ficticia nueva.
- document: fotografía/documento rechazado → documento.
- identity: no se pudo validar la identidad → prueba de vida.

Los motivos se presentan al finalizar la prueba simulada para facilitar las
pruebas. No hay validación real de tokens. El reintento conserva el resultado
configurado: seguirá fallando mientras la constante permanezca en false.
Estos errores corresponden al enrolamiento, no al acceso físico.

## Verificar

```powershell
flutter analyze
flutter test
```

Las pantallas están en lib/screens; estilos en lib/theme/app_theme.dart;
componentes compartidos en lib/widgets. No se usa gestión de estado externa.
