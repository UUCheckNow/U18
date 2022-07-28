//
//  RankingListModel.swift
//  U18
//
//  Created by 优优 on 2022/7/28.
//

import HandyJSON

struct RankinglistModel: HandyJSON {
    var rankinglist: [RankingModel]?
}

struct RankingModel: HandyJSON {
    var argCon: Int = 0
    var argName: String?
    var argValue: Int = 0
    var canEdit: Bool = false
    var cover: String?
    var isLike: Bool = false
    var sortId: Int = 0
    var sortName: String?
    var title: String?
    var subTitle: String?
    var rankingType: Int = 0
}
