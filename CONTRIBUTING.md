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

Cada repositorio tiene su propia licencia (mira su archivo `LICENSE`): GPL-3.0 en el sistema base, AGPL-3.0 en los demonios, LGPL-2.1 en las bibliotecas y el SDK, y licencias permisivas (MIT, BSD) en la configuración. El kernel es GPL-2.0.

- Tu código nuevo va con la licencia del repositorio al que contribuyes.
- Cada archivo nuevo lleva su cabecera SPDX, por ejemplo `// SPDX-License-Identifier: GPL-3.0-or-later`.
- Las **dependencias** pueden tener otras licencias compatibles (MIT, Apache-2.0...); lo que importa es la licencia de tu aportación.

## Firma de origen (DCO)

Cada commit lleva una línea `Signed-off-by: Tu Nombre <correo>` (`git commit -s`). Con ella certificas, según el [Developer Certificate of Origin](https://developercertificate.org/), que tienes derecho a aportar ese código bajo la licencia del repositorio. No hay CLA: el copyright sigue siendo de quien escribe el código.

## Antes de abrir una pull request

- Que compile (`cargo check --workspace`).
- Nada de binarios compilados, `target/` ni archivos generados.
- Cambios pequeños y con un motivo claro. Si es un cambio de diseño, abre antes una propuesta.

## Idioma

La documentación y las discusiones están en español. El inglés llegará más adelante.
