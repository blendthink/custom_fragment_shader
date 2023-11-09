#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform float uProgress;

uniform sampler2D uTexture;

const float SQRT_2 = 1.414213562373;
const float dots = 40.0;
const vec2 center = vec2(0, 0);

vec4 transition(vec2 uv) {
    bool nextImage = distance(fract(uv * dots), vec2(0.5, 0.5)) < (uProgress / distance(uv, center));
    return nextImage ? texture(uTexture, uv) : vec4(0.0);
}

void main() {
    vec2 uv = FlutterFragCoord() / uSize;
    fragColor = transition(uv);
}
