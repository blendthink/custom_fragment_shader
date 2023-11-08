#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform float uTime;

uniform sampler2D uTexture;

const float PI = 3.141592653589793;
const float PI_SQUARE = PI * 2.;

// 斜め方向の虹色の変化を計算
vec2 rotateUV(in vec2 uv, in float angle) {
    return vec2(
    cos(angle) * uv.x - sin(angle) * uv.y,
    sin(angle) * uv.x + cos(angle) * uv.y
    );
}

// UV 座標と経過時間から調整した虹色を取得
vec3 getRainbowColor(in vec2 uv, in float time) {
    return vec3(0.5) + vec3(0.5) * cos(uv.x * PI_SQUARE + uv.y * PI_SQUARE + time * 4 + vec3(0, 2, 4));
}

// UV 座標と経過時間から調整した光沢度を取得
float getGlossIntensity(in vec2 uv, in float time) {
    return sin(uv.x * PI_SQUARE + uv.y * PI_SQUARE + time * 4) * 0.5 + 0.5;
}

// 白色に近い部分だけに虹色と光沢を適用した光沢色を取得
vec3 getGlossColor(in vec3 texColor, in vec3 rainbowColor, in float glossIntensity) {
    float whiteArea = step(0.75, dot(texColor.rgb, vec3(1.0)));
    return rainbowColor * glossIntensity * whiteArea;
}

void main() {
    vec2 uv = FlutterFragCoord() / uSize;
    vec3 texColor = texture(uTexture, uv).rgb;

    vec2 rotatedUV = rotateUV(uv, 45);
    vec3 rainbowColor = getRainbowColor(rotatedUV, uTime);
    float glossIntensity = getGlossIntensity(rotatedUV, uTime);
    vec3 glossColor = getGlossColor(texColor, rainbowColor, glossIntensity);

    vec3 hologramColor = mix(texColor, texColor + glossColor, 0.5);
    fragColor = vec4(hologramColor, 1.0);
}
