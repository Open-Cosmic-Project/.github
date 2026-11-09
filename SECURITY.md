# Política de seguridad

CosmicOS es experimental y todavía no tiene versiones estables ni dispositivos soportados. Aun así, las vulnerabilidades en el código se toman en serio.

## Cómo reportar una vulnerabilidad

**No abras un issue público.** Entra en la pestaña **Security** del repositorio afectado y pulsa **Report a vulnerability**. Así el aviso llega en privado a los mantenedores.

Incluye:

- Qué componente y qué versión (rama y commit).
- Cómo reproducirlo.
- Qué impacto crees que tiene.

## Qué cuenta

Interesan especialmente los fallos en el aislamiento entre apps, la verificación de paquetes `.sps`, el arranque verificado, el desbloqueo y bloqueo del bootloader, y la gestión de claves.

## Versiones soportadas

Mientras el proyecto esté en `eventhorizon`, solo se corrige la rama actual.
