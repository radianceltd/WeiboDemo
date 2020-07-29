//
//  PostVIPBadge.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/29.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

struct PostVIPBadge: View {
    
    let vip: Bool
    
   
    
    
    var body: some View {
        //分组
        Group{
            if vip {
                Text("V8")
                .bold()
                .font(.system(size: 11))
                .frame(width:20,height: 20)
                .foregroundColor(.yellow)
                .background(Color.red)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 7.5)
                        .stroke(Color.white, lineWidth: 1)
                )
            }
        }
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge(vip: true)
    }
}
