#version 120
uniform sampler2D texture;
uniform float zoom;
uniform vec2 offset;
uniform float resolution;

void main(void) {
    vec2 UV=gl_TexCoord[0].xy - vec2(.5);
    UV += offset;
    UV /= zoom;
    gl_FragColor = texture2D(texture,UV);
}
