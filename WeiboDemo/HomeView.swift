//
//  HomeView.swift
//  WeiboDemo
//
//  Created by RND on 2020/7/30.
//  Copyright © 2020 RND. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var leftPercent: CGFloat = 0
    
    //类型的构造方法
    init() {
        //去掉分割线
        UITableView.appearance().separatorStyle = .none
        //默认点击样式去掉
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    
    var body: some View {
        NavigationView{
            
            GeometryReader{ geometry in
                HScrollViewController(pageWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width*2, height: geometry.size.height),
                                      leftPercent: self.$leftPercent){
                    
                    HStack(spacing: 0){
                        PostListView(category: .recommed).frame(width:UIScreen.main.bounds.width)
                        PostListView(category: .hot).frame(width:UIScreen.main.bounds.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom) //安全区域
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
