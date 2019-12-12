//
//  ContentView.swift
//  SwiftUITest
//
//  Created by My MacBook Pro on 2019/12/10.
//  Copyright © 2019 SHSwift. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().edgesIgnoringSafeArea(.all).frame(height:300)
            
            CircleImage().offset(y: -130).padding(.bottom, -130)
            
            VStack (alignment: .leading) {//垂直组件
                Text("圆明园").font(.title)
                HStack {//水平组件
                    Text("皇家园林").font(.subheadline)
                    Spacer()
                    Text("北京").font(.subheadline)
                }
            }.padding(60)
            
            Spacer()
            
        }//容器留白
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
