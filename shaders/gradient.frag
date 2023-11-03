#version 460 core

#include <flutter/runtime_effect.glsl>

precision highp float;

// 0xFFFF57DD
#define START_COLOR vec4(1.0, 0.34, 0.87, 1.0)

// 0xFF56C2FF
#define END_COLOR vec4(0.337, 0.76, 1.0, 1.0)

uniform vec2 uSize;

out vec4 fragColor;

void main() {
    vec2 pixel = FlutterFragCoord() / uSize;
    fragColor = mix(START_COLOR, END_COLOR, pixel.x);
}
