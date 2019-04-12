// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33331,y:32638,varname:node_3138,prsc:2|diff-6407-OUT,normal-9072-OUT;n:type:ShaderForge.SFN_Tex2d,id:647,x:32738,y:32599,ptovrint:False,ptlb:A,ptin:_A,varname:_A,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7105,x:32738,y:32839,ptovrint:False,ptlb:B,ptin:_B,varname:_B,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5fb7986dd6d0a8e4093ba82369dd6a4d,ntxv:0,isnm:False|UVIN-5677-OUT;n:type:ShaderForge.SFN_TexCoord,id:5293,x:32378,y:32779,varname:node_5293,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:2817,x:32378,y:32951,varname:node_2817,prsc:2,v1:8;n:type:ShaderForge.SFN_Multiply,id:5677,x:32562,y:32839,varname:node_5677,prsc:2|A-5293-UVOUT,B-2817-OUT;n:type:ShaderForge.SFN_Lerp,id:6407,x:33084,y:32727,varname:node_6407,prsc:2|A-647-RGB,B-7105-RGB,T-8390-R;n:type:ShaderForge.SFN_VertexColor,id:8390,x:32738,y:33082,varname:node_8390,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:293,x:32738,y:33267,ptovrint:False,ptlb:A_normal,ptin:_A_normal,varname:_A_normal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:1524,x:32738,y:33503,ptovrint:False,ptlb:B_normal,ptin:_B_normal,varname:_B_normal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cf20bfced7e912046a9ce991a4d775ec,ntxv:3,isnm:True|UVIN-5677-OUT;n:type:ShaderForge.SFN_Lerp,id:9072,x:33078,y:33296,varname:node_9072,prsc:2|A-293-RGB,B-1524-RGB,T-8390-R;proporder:647-7105-293-1524;pass:END;sub:END;*/

Shader "Shader Forge/BlendAndcolor" {
    Properties {
        _A ("A", 2D) = "white" {}
        _B ("B", 2D) = "white" {}
        _A_normal ("A_normal", 2D) = "bump" {}
        _B_normal ("B_normal", 2D) = "bump" {}
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _A; uniform float4 _A_ST;
            uniform sampler2D _B; uniform float4 _B_ST;
            uniform sampler2D _A_normal; uniform float4 _A_normal_ST;
            uniform sampler2D _B_normal; uniform float4 _B_normal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _A_normal_var = UnpackNormal(tex2D(_A_normal,TRANSFORM_TEX(i.uv0, _A_normal)));
                float2 node_5677 = (i.uv0*8.0);
                float3 _B_normal_var = UnpackNormal(tex2D(_B_normal,TRANSFORM_TEX(node_5677, _B_normal)));
                float3 normalLocal = lerp(_A_normal_var.rgb,_B_normal_var.rgb,i.vertexColor.r);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _A_var = tex2D(_A,TRANSFORM_TEX(i.uv0, _A));
                float4 _B_var = tex2D(_B,TRANSFORM_TEX(node_5677, _B));
                float3 diffuseColor = lerp(_A_var.rgb,_B_var.rgb,i.vertexColor.r);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _A; uniform float4 _A_ST;
            uniform sampler2D _B; uniform float4 _B_ST;
            uniform sampler2D _A_normal; uniform float4 _A_normal_ST;
            uniform sampler2D _B_normal; uniform float4 _B_normal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _A_normal_var = UnpackNormal(tex2D(_A_normal,TRANSFORM_TEX(i.uv0, _A_normal)));
                float2 node_5677 = (i.uv0*8.0);
                float3 _B_normal_var = UnpackNormal(tex2D(_B_normal,TRANSFORM_TEX(node_5677, _B_normal)));
                float3 normalLocal = lerp(_A_normal_var.rgb,_B_normal_var.rgb,i.vertexColor.r);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _A_var = tex2D(_A,TRANSFORM_TEX(i.uv0, _A));
                float4 _B_var = tex2D(_B,TRANSFORM_TEX(node_5677, _B));
                float3 diffuseColor = lerp(_A_var.rgb,_B_var.rgb,i.vertexColor.r);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
