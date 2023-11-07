#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float uPixelCount;

uniform sampler2D uTexture;

out vec4 fragColor;

void main() {
    vec2 pixels = vec2(uPixelCount);

    vec2 uv = FlutterFragCoord() / uSize;
    vec2 puv = round(uv * pixels) / pixels;
    fragColor = texture(uTexture, puv);
}
