//
//  HomeLandUIView.swift
//  HifamilySwiftUI
//
//  Created by 游 on 2021/9/15.
//

import SwiftUI
import CoreData

class FamilyNameModel: ObservableObject {
    @Published var FamilyTreeName: String = "相亲相爱"
}

struct HomeLandUIView: View {
    
       @ObservedObject var model = FamilyNameModel()
       @State var isPresented = false
    
    let primaryButton = Alert.Button.default(Text("确认")) {
                print("Yes")
            }
        
            let secondaryButton = Alert.Button.destructive(Text("取消")) {
                
                            }
    
    
        var alert: Alert {
            Alert(title: Text("提示"),
                 message: Text("确认修改家庭树的名字为“\(self.model.FamilyTreeName)”"),
                 primaryButton: primaryButton,
                 secondaryButton: secondaryButton)
        }
    
    var body: some View {
 
        ZStack {
           
            ZStack {
                Image("notice")
                    .padding(.init(top: 300, leading: -180, bottom: 0, trailing: 0))
                TextField("FamilyTreeName",
                          text: $model.FamilyTreeName,
//                          onEditingChanged:{ _ in isPresented = true},
                          onCommit: {isPresented = true}
                )
                    .font(.system(size: 16))
                    .foregroundColor(Color("FamliyTreeNameColor"))
                    .frame(width: 90, height: 0)
                    .offset(x: -123, y: 118)
                    .multilineTextAlignment(.center)
                .alert(isPresented: $isPresented) { () -> Alert in
                                alert
                            }
            }
            RoundedRectangle(cornerRadius: 27)
                .fill(LinearGradient(gradient: .init(colors: [Color("LandColorBefore"), Color("LandColorAfter")]), startPoint:  .leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/ .trailing))
                .frame(minWidth: 300, idealWidth: 400, maxWidth: 600, minHeight: 200, idealHeight: 200, maxHeight: 200, alignment: .top)
                .offset( y: 335)
                .opacity(0.8)
        }
            
        
       
    }
}

struct HomeLandUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLandUIView()
    }
}
