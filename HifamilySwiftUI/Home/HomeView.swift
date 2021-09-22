//
//  HomeView.swift
//  HifamilySwiftUI
//
//  Created by 游 on 2021/9/14.
//

import SwiftUI

struct HomeView: View {
    let imgsTree = ["tree","second tree","third tree"]
    @State  private var indexTree = 0 //默认树
    var body: some View {
        VStack{
            //title
            HStack {
                Image("three line")
                    .resizable()
                    .frame(width:23,
                           height:23,
                           alignment:.center)
                Spacer()
                Text("Your family tree")
                    .foregroundColor(Color("AccentColor"))
                
                Spacer()
                Image("person")
                    .resizable()
                    .frame(width:23,
                           height:23,
                           alignment:.center)
            }.padding()
            
            Divider()
            
            //家庭ID
            HStack {
                VStack(alignment: .leading) {
                    Text("家庭ID：a566").font(.system(size: 14))
                    
//                    Text("目前家庭有6位成员").font(.system(size: 12)).foregroundColor(Color.gray)
                }
                Spacer()
                Text("在线成员:").font(.system(size: 14))
                    + Text("6").foregroundColor(Color("AccentColor"))
                    .font(.system(size: 16))
                    
            }.padding(20)
            
            ZStack {
                
                HomeLandUIView()
                HStack {
                    Image(imgsTree[indexTree])
                        .animation (.interpolatingSpring(stiffness: 50, damping: 3))
                    //切换家庭树
                    Button(action: {
                        if indexTree == 2{
                            indexTree = 0
                        }else{
                            indexTree = indexTree + 1
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(Color("AccentColor"))
                            Text("切换")
                                .fontWeight(.bold)
                        }.padding(8)
                        .cornerRadius(30.0)
                        .background(Color.white)
                        .shadow(color: Color("AccentColor"), radius: 4, x: 2.0, y: 2.0)
                    }
                    .padding(EdgeInsets(top:240,leading:-100,bottom:0,trailing:0))
                    
                }
                .padding(EdgeInsets(top:0,leading:0,bottom:0,trailing:0))
//                MemberUIView()
                Textfield02()
                
            }
        }.frame(minWidth: 0/*@END_MENU_TOKEN@*/,  maxWidth: .infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0,  maxHeight: /*@START_MENU_TOKEN@*/.infinity, alignment: .topLeading)
    
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
