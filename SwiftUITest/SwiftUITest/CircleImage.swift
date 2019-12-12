//
//  CircleImage.swift
//  SwiftUITest
//
//  Created by My MacBook Pro on 2019/12/12.
//  Copyright © 2019 SHSwift. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("image").clipShape(Circle())//圆形
            .overlay(Circle().stroke(Color.white, lineWidth: 4))//盖了圆形边
                .shadow(radius: 10)//阴影
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
