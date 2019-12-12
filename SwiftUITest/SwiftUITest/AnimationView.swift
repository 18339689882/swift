//
//  AnimationView.swift
//  SwiftUITest
//
//  Created by My MacBook Pro on 2019/12/11.
//  Copyright © 2019 SHSwift. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    @State private var showDetail = false
    var body: some View {
        Button(action: {
            self.showDetail = !self.showDetail
        }){
            Image(systemName: "chevron.right.circle")
                .imageScale(.large)
                .rotationEffect(.degrees(showDetail ? 90 : 0))
                .scaleEffect(showDetail ? 1.5 : 1)
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
