// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-8721-OUT;n:type:ShaderForge.SFN_TexCoord,id:129,x:31280,y:33127,varname:node_129,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Color,id:4641,x:32061,y:32855,ptovrint:False,ptlb:color1,ptin:_color1,varname:node_4641,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9150943,c2:0.116545,c3:0.116545,c4:1;n:type:ShaderForge.SFN_Color,id:6038,x:32061,y:32676,ptovrint:False,ptlb:color2,ptin:_color2,varname:node_6038,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08877714,c2:0.67632,c3:0.8962264,c4:1;n:type:ShaderForge.SFN_Lerp,id:8721,x:32285,y:32736,varname:node_8721,prsc:2|A-6038-RGB,B-4641-RGB,T-1330-OUT;n:type:ShaderForge.SFN_Length,id:5341,x:31717,y:33303,varname:node_5341,prsc:2|IN-5903-OUT;n:type:ShaderForge.SFN_RemapRange,id:5903,x:31453,y:33331,varname:node_5903,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-129-UVOUT;n:type:ShaderForge.SFN_ArcTan2,id:1330,x:31981,y:33458,varname:node_1330,prsc:2,attp:2|A-1388-R,B-1388-G;n:type:ShaderForge.SFN_ComponentMask,id:1388,x:31723,y:33435,varname:node_1388,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5903-OUT;proporder:4641-6038;pass:END;sub:END;*/

Shader "Shader Forge/UVshader" {
    Properties {
        _color1 ("color1", Color) = (0.9150943,0.116545,0.116545,1)
        _color2 ("color2", Color) = (0.08877714,0.67632,0.8962264,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _color1;
            uniform float4 _color2;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_5903 = (i.uv0*2.0+-1.0);
                float2 node_1388 = node_5903.rg;
                float3 emissive = lerp(_color2.rgb,_color1.rgb,((atan2(node_1388.r,node_1388.g)/6.28318530718)+0.5));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
