#version 460 core

// Flutterの環境で使用するためのruntime effectをインクルードします。
#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize; // エフェクトの範囲を指定するベクトル
uniform float uTime; // 現在の時間を指定するフロート

const float PI = 3.141592653589793;

// ノイズ生成関数
float noise(in vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// スパークル効果を生成する関数
float sparkle(in vec2 uv, in float time) {
    vec2 center = vec2(0.5) - uv; // 中心からの距離を計算
    float dist = length(center); // 距離を計算
    // ノイズと時間に基づいて値を計算し、距離に応じて滑らかに透明度を変える
    return smoothstep(0.0, 0.2, 1.0 - dist) * noise(uv * time);
}

void main() {
    // gl_FragCoordを使ってスクリーンの解像度に対して正規化されたテクスチャ座標を取得します。
    vec2 uv = gl_FragCoord.xy / uSize;

    // エフェクトの強さを計算します。時間経過とともに変化させることができます。
    float effectIntensity = sparkle(uv, uTime);

    // エフェクトの色を白に設定します。透明度はeffectIntensityで調整します。
    vec4 effectColor = vec4(1.0, 1.0, 1.0, effectIntensity);

    // 計算したエフェクトの色でfragColorを設定します。
    fragColor = effectColor;
}
