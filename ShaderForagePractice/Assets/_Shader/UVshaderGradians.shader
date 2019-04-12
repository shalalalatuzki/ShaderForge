// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33130,y:32581,varname:node_3138,prsc:2|emission-7503-OUT,voffset-2745-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32668,y:32502,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9622642,c2:0.8495811,c3:0.09531862,c4:1;n:type:ShaderForge.SFN_Color,id:8057,x:32668,y:32664,ptovrint:False,ptlb:node_8057,ptin:_node_8057,varname:node_8057,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9245283,c2:0.08285864,c3:0.08285864,c4:1;n:type:ShaderForge.SFN_Lerp,id:7503,x:32914,y:32625,varname:node_7503,prsc:2|A-7241-RGB,B-8057-RGB,T-851-OUT;n:type:ShaderForge.SFN_TexCoord,id:2711,x:31239,y:33045,varname:node_2711,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Sin,id:5474,x:32299,y:33175,varname:node_5474,prsc:2|IN-2533-OUT;n:type:ShaderForge.SFN_Vector1,id:92,x:31880,y:33062,varname:node_92,prsc:2,v1:4;n:type:ShaderForge.SFN_Time,id:3075,x:31623,y:33272,varname:node_3075,prsc:2;n:type:ShaderForge.SFN_Tau,id:767,x:31902,y:33316,varname:node_767,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2533,x:32098,y:33175,varname:node_2533,prsc:2|A-92-OUT,B-2569-OUT,C-767-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2586,x:31623,y:33109,varname:node_2586,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-5169-X;n:type:ShaderForge.SFN_Add,id:2569,x:31886,y:33157,varname:node_2569,prsc:2|A-2586-OUT,B-3075-T;n:type:ShaderForge.SFN_RemapRange,id:155,x:32507,y:33175,varname:node_155,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-5474-OUT;n:type:ShaderForge.SFN_Clamp01,id:851,x:32688,y:33175,varname:node_851,prsc:2|IN-155-OUT;n:type:ShaderForge.SFN_Multiply,id:2745,x:32966,y:33283,varname:node_2745,prsc:2|A-851-OUT,B-5666-OUT,C-5745-OUT;n:type:ShaderForge.SFN_NormalVector,id:5666,x:32707,y:33390,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector1,id:5745,x:32707,y:33572,varname:node_5745,prsc:2,v1:0.3;n:type:ShaderForge.SFN_FragmentPosition,id:5169,x:31399,y:33070,varname:node_5169,prsc:2;proporder:7241-8057;pass:END;sub:END;*/

Shader "Shader Forge/UVshaderGradians" {
    Properties {
        _Color ("Color", Color) = (0.9622642,0.8495811,0.09531862,1)
        _node_8057 ("node_8057", Color) = (0.9245283,0.08285864,0.08285864,1)
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
            uniform float4 _Color;
            uniform float4 _node_8057;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_3075 = _Time;
                float node_851 = saturate((sin((4.0*(mul(unity_ObjectToWorld, v.vertex).r.r+node_3075.g)*6.28318530718))*0.5+0.5));
                v.vertex.xyz += (node_851*v.normal*0.3);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_3075 = _Time;
                float node_851 = saturate((sin((4.0*(i.posWorld.r.r+node_3075.g)*6.28318530718))*0.5+0.5));
                float3 emissive = lerp(_Color.rgb,_node_8057.rgb,node_851);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_3075 = _Time;
                float node_851 = saturate((sin((4.0*(mul(unity_ObjectToWorld, v.vertex).r.r+node_3075.g)*6.28318530718))*0.5+0.5));
                v.vertex.xyz += (node_851*v.normal*0.3);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
