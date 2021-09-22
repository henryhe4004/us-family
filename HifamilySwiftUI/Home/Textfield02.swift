//
//  Textfield02.swift
//  HifamilySwiftUI
//
//  Created by 游 on 2021/9/20.
//

import SwiftUI

struct Textfield02: View {
    
    @State var isPressed = false //是否按压图片
    let avatar = ["mother","father","sister"]
    let memberName = ["妈妈","爸爸","女儿"]
    let birthdy = ["2021/3/1","2020/4/5","2022/6/7"]
    let memberTelephone = ["1234567","123456","123455"]
    
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

                            KeyboardHost{
                                ScrollView{
                                AddMemberCardUIView()
                                }
                            }
                            ForEach( 0 ..< memberName.count){ i in
                                KeyboardHost {
                                    ScrollView{
                                        CardUIView(image: avatar[i],memberName:memberName[i],memberIdentity:birthdy[i],memberTelephone:memberTelephone[i]).padding()
                                    }
                                }
                            }
                           
//                            CardUIView(image: "mother",memberName:"妈妈",memberIdentity:"女儿",memberTelephone:"15025584040").padding()
//                            CardUIView(image: "father",memberName:"爸爸",memberIdentity:"爸爸",memberTelephone:"15025584040").padding()
//                            CardUIView(image: "sister",memberName:"姐姐",memberIdentity:"姐姐",memberTelephone:"15025584040").padding()
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
                }.offset(x: 10, y: -100)
            }
           
        }
    }
}

struct Textfield02_Previews: PreviewProvider {
    static var previews: some View {
        Textfield02()
    }
}

struct KeyboardHost<Content: View>: View {
    let view: Content
    
    @State private var keyboardHeight: CGFloat = 0
    
    private let showPublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillShowNotification
    ).map { (notification) -> CGFloat in
        if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
            return rect.size.height
        } else {
            return 0
        }
    }
    
    private let hidePublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillHideNotification
    ).map {_ -> CGFloat in 0}
    
    // Like HStack or VStack, the only parameter is the view that this view should layout.
    // (It takes one view rather than the multiple views that Stacks can take)
    init(@ViewBuilder content: () -> Content) {
        view = content()
    }
    
    var body: some View {
        VStack {
            view
            Rectangle()
                .frame(height: keyboardHeight)
                .animation(.default)
                .foregroundColor(.clear)
        }.onReceive(showPublisher.merge(with: hidePublisher)) { (height) in
            self.keyboardHeight = height
        }
    }
}
