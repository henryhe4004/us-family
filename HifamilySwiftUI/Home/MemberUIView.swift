//
//  MemberUIView.swift
//  HifamilySwiftUI
//
//  Created by 游 on 2021/9/16.
//


//废弃的文件

import SwiftUI


struct MemberUIView: View {
    
    @State var isPressed = false //是否按压图片
    
    var body: some View {

        ZStack {
            if(isPressed){
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.5)
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer()
                    VStack {
                        Image(systemName: "arrowshape.turn.up.left.fill")
                            .resizable(resizingMode: .tile)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("AccentColor"))
                            .onTapGesture {
                                isPressed = false
                            }
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .offset(x: -630, y: 0)
                        
                            
                        
                        HStack(alignment: .center, spacing: 10) {
                            Spacer()
                            AddMemberCardUIView()
                            CardUIView(image: "mother",memberName:"妈妈",memberIdentity:"女儿",memberTelephone:"15025584040").padding()
                            CardUIView(image: "father",memberName:"爸爸",memberIdentity:"爸爸",memberTelephone:"15025584040").padding()
                            CardUIView(image: "sister",memberName:"姐姐",memberIdentity:"姐姐",memberTelephone:"15025584040").padding()
                            Spacer()
                        }
                        
                        
                    }
                    Spacer()
                }
            }else{
                VStack {
                    HStack {
                        Image("grandFather")
                            .onTapGesture {
                                isPressed = true
                            }
                            .frame(width: 130, height: 130)

                            .offset(x: 10, y: -20)
                        Image("grandmother")
                            .onTapGesture {
                                isPressed = true
                            }
                    }
                    .frame(width: 300, height: 130)
                    HStack {
                        Image("father")
                            .onTapGesture {
                                isPressed = true
                            }
                            .offset(x: -60, y: -50.0)
                        Image("mother")
                            .onTapGesture {
                                isPressed = true
                            }.offset(x: 0, y: -30.0)
                    }
                    .frame(width: 400, height: 100)
                 
                    HStack {
                        Image("bother")
                            .onTapGesture {
                                isPressed = true
                            }
                            .offset(x: -80, y: -60)
                        Image("sister")
                            .onTapGesture {
                                isPressed = true
                            }
                            .offset(x: 40, y: -40)
                        
                    }
//                    Image("addMember")
//                        .offset(x: -80, y: -70)
                }.offset(x: 10, y: -190)
            }
           
        }
        
        
    }
}

struct MemberUIView_Previews: PreviewProvider {
    static var previews: some View {
        MemberUIView()
    }
}
