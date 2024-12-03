shader_type canvas_item;

uniform float blur_radius : hint_range(0, 10, 0.1) = 3.0;

void fragment() {
    vec4 color = vec4(0.0);
    vec2 offsets[9] = vec2[](
        vec2(-1, -1), vec2(0, -1), vec2(1, -1),
        vec2(-1,  0), vec2(0,  0), vec2(1,  0),
        vec2(-1,  1), vec2(0,  1), vec2(1,  1)
    );
    
    float weight[9] = float[](1.0, 2.0, 1.0, 2.0, 4.0, 2.0, 1.0, 2.0, 1.0);
    float weight_sum = 16.0; // Somme des poids
    
    for (int i = 0; i < 9; i++) {
        color += texture(TEXTURE, UV + offsets[i] * blur_radius / TEXTURE_PIXEL_SIZE) * weight[i];
    }
    
    COLOR = color / weight_sum;
}