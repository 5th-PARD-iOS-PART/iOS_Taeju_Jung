//
//  NavigationTarget.swift
//  4th_HW4_TaejuJung
//
//  Created by 정태주 on 4/11/25.
//

enum NavigationTarget: Hashable {
    case view1
    case view2(View1Data)
    case view3(View1Data, Int)
}
