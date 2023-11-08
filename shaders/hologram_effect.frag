#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform float uTime;

uniform sampler2D uTexture;

void main() {
    vec2 uv = FlutterFragCoord() / uSize;

    vec4 texColor = texture(uTexture, uv);

    float noise = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);

    // 斜め方向の虹色の変化を計算
    float angle = 45;
    vec2 rotatedUV = vec2(
    cos(angle) * uv.x - sin(angle) * uv.y,
    sin(angle) * uv.x + cos(angle) * uv.y
    );

    // 虹色の光沢感を生成
    float glossIntensity = sin(rotatedUV.x * 6.283185 + rotatedUV.y * 6.283185 + uTime * 4) * 0.5 + 0.5;
    vec3 glossColor = vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5) * cos(rotatedUV.x * 6.283185 + rotatedUV.y * 6.283185 + vec3(0, 2, 4));

    // 白色に近い部分だけに光沢を適用
    float whiteArea = step(0.75, dot(texColor.rgb, vec3(1.0)));
    glossColor *= glossIntensity * whiteArea;

    // 色の変化を適用しつつ、色が黒にならないように調整
    vec3 hologramColor = texColor.rgb + noise * 0.2;
    hologramColor = mix(hologramColor, hologramColor + glossColor, 0.5);

    fragColor = vec4(hologramColor, texColor.a);
}
