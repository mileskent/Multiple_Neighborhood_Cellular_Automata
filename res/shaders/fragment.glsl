#version 120
uniform sampler2D texture;
uniform float resolution;

vec4 WHITE = vec4(1.0, 1.0, 1.0, 1.0);
vec4 BLACK = vec4(0.0, 0.0, 0.0, 1.0);


float get(float x, float y) {
    return float(texture2D(texture, (gl_TexCoord[0].xy + vec2(x, y)/resolution)).b);
}

vec2 ring(vec2 r) {
	float a = 0.0;
	float b = 0.0;
	for(float i = -r[0]; i <= r[0]; i+=1.0) {
		for(float j = -r[0]; j <= r[0]; j+=1.0) {
			float d = floor( sqrt(i*i+j*j) + .5 );
			if( d <= r[0] && d > r[1] ) {
				a += floor(get(i,j));
				b++; 
			} 
		}
	}
	return vec2(a, b); 
}

void main(void)
{
	vec2 nh_0 = ring(vec2(7,4));
    float nh_avg0 = nh_0[0] / nh_0[1];
    vec2 nh_1 = ring(vec2(3,0));
    float nh_avg1 = nh_1[0] / nh_1[1];

    if( nh_avg0 >= 0.210 &&  nh_avg0 <= 0.220 ) { gl_FragColor = WHITE; }
    if( nh_avg0 >= 0.350 &&  nh_avg0 <= 0.500 ) { gl_FragColor = BLACK; }
    if( nh_avg0 >= 0.750 &&  nh_avg0 <= 0.850 ) { gl_FragColor = BLACK; }
    if( nh_avg1 >= 0.100 &&  nh_avg1 <= 0.280 ) { gl_FragColor = BLACK; }
    if( nh_avg1 >= 0.430 &&  nh_avg1 <= 0.550 ) { gl_FragColor = WHITE; }
    if( nh_avg0 >= 0.120 &&  nh_avg0 <= 0.150 ) { gl_FragColor = BLACK; }
}
