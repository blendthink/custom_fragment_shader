#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

// 0xFFFFA500
const vec4 orangeColor = vec4(1.0, 0.65, 0.0, 1.0);

void main() {
    fragColor = orangeColor;
}
