# Custom Fragment Shader

![screenshot](docs/screenshot.png)

## 概要

Flutter で高度なグラフィックスを実現するために、これまでは RenderObject や CustomPainter を利用していました。
しかし、これらは CPU 上で多くの処理を実行することになってしまうため、柔軟性や表現力にどうしても限界がありました。

Flutter 2.8 で Fragment Shader を利用可能になり、GPU 上で処理を実行できるようになったため、より柔軟で高度なグラフィックスを実現できるようになりました。

このプロジェクトでは、Fragment Shader の基礎から Flutter での具体的な実装例についてご紹介します。

## トピック

- Fragment Shader とは
- Flutter における Fragment Shader の実装方法
- Flutter で Fragment Shader が実行されるまでの仕組み
- Fragment Shader の実装例と解説
    - Pixelation
    - Hologram Effect
    - Ink Sparkle
    - Transition Animation

## 参考資料

- https://docs.flutter.dev/ui/design/graphics/fragment-shaders
- https://www.youtube.com/watch?v=OpcPZdfJbq8
- https://github.com/flutter/flutter
- https://github.com/flutter/engine
- https://github.com/google/skia
- https://github.com/jonahwilliams/flutter_shaders
- https://www.khronos.org/opengl/wiki/Rendering_Pipeline_Overview
- https://www.khronos.org/opengl/wiki/Fragment_Shader
- https://thebookofshaders.com
- https://glumpy.github.io/modern-gl.html
