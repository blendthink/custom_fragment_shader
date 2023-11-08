#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

// 0xFFFF57DD
const vec4 startColor = vec4(1.0, 0.34, 0.87, 1.0);

// 0xFF56C2FF
const vec4 endColor = vec4(0.337, 0.76, 1.0, 1.0);

uniform vec2 uSize;

void main() {
    vec2 pixel = FlutterFragCoord() / uSize;
    fragColor = mix(startColor, endColor, pixel.x);
}
