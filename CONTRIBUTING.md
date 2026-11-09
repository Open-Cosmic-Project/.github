# Cómo contribuir

CosmicOS es un proyecto muy joven y experimental. Toda contribución es bienvenida, pero lo más útil ahora mismo es **probar, reportar y discutir diseño**.

## Descargar el árbol

Cada carpeta es un repositorio; se bajan todos juntos con [`repo`](https://gerrit.googlesource.com/git-repo):

```sh
mkdir cosmicos && cd cosmicos
repo init -u https://github.com/Open-Cosmic-Project/Cosmic-Manifest.git -b eventhorizon -g desktop-dev
repo sync -j4
cargo check --workspace
```

Para **trabajar**, haz fork del repositorio que vayas a tocar y edita en tu propio árbol de desarrollo. No edites dentro de un árbol sincronizado con `repo`: el siguiente `repo sync` choca con los cambios locales.

## Rama

Todo el desarrollo está en `eventhorizon`. Abre las *pull requests* contra esa rama.

## Licencias

- El código propio solo puede usar licencias GPL-3.0, LGPL-3.0 (SDK) o AGPL-3.0 (módulos de red). El kernel es GPL-2.0.
- No se aceptan archivos propios con MIT, Apache o BSD. Las **dependencias** con esas licencias sí se pueden usar.
- Cada archivo nuevo lleva su cabecera SPDX, por ejemplo `// SPDX-License-Identifier: GPL-3.0-or-later`.

## Antes de abrir una pull request

- Que compile (`cargo check --workspace`).
- Nada de binarios compilados, `target/` ni archivos generados.
- Cambios pequeños y con un motivo claro. Si es un cambio de diseño, abre antes una propuesta.

## Idioma

La documentación y las discusiones están en español. El inglés llegará más adelante.
