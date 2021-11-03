//
//  AnimeView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/3.
//

import SwiftUI

struct AnimeView: View {
    var body: some View {
        AnimeList()
    }
}

struct AnimeList: View {
    let AnimeVideos = [
        Video(name: "煙花", year: "2017", time: "1 小時 29 分鐘", creator: "大根仁", maturityNum: "7+", about: "中學生奈砂一心想與典道同學私奔，典道卻用某種方式在這個命運的夏日讓時光倒流。", Netflix: "https://www.netflix.com/tw/title/81000505", YouTube: "https://youtu.be/F4elmaixJQ0", photoLink: ["https://occ-0-4791-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVSf65F5sIwiFPqDt_mkhJ-KJ2xlp1S4shSZbqPwyraKNvnmVvZizT-GsqXIvEjGVVdxJBpx4aIwEYfSlIw7Uw3uDQl6.jpg?r=512", "https://occ-0-4791-993.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABYuJHkqFC0OuQE3uGZwStqkyObVXgkloqecuPfhQOrnBeCrsROciDrg0yygqbYntbP3ypy4fCB8KHvPh3BPl_5UngVH9.jpg?r=d52"]),
        Video(name: "你的名字", year: "2016", time: "1 小時 46 分鐘", creator: "新海誠", maturityNum: "13+", about: "百無聊賴的鄉下女孩起床時偶爾會變成一個都市男孩，而對方過著她夢寐以求的精彩生活。", Netflix: "https://www.netflix.com/tw/title/80161371", YouTube: "https://youtu.be/TWJtF62Ppfo", photoLink: ["https://occ-0-4791-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYBqkVNUybDilvjL71L14K1KEHQ5lO-I5FR_GBt7z_grXOT15m6MU5smE-KbfLpZ2KGyfZ28-Dlg4CUYu8glBjLUDcA1.jpg?r=6ed", "https://occ-0-4791-993.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABWP_zPF0fNn5Q1AOwu055R66k2wH36MHrZ_6A0PNJ4lqRecLD0HbKWxOJL1jtNhVmQ0VXdHKCqmqDWrGLn5YtmFeRckj.jpg?r=deb"]),
        Video(name: "追逐繁星的孩子", year: "2011", time: "1 小時 56 分鐘", creator: "新海誠", maturityNum: "13+", about: "聆聽著已故父親的礦石收音機，一位寂寞的孤兒追隨神奇樂音，進入充滿危險及誘惑的美麗世界。", Netflix: "https://www.netflix.com/tw/title/80104167", YouTube: "https://youtu.be/eOzWO5etMBE", photoLink: ["https://occ-0-4791-993.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABRD0ACNBcVeyNT2iimizqAtFuIcDohRxCXkLvAMFF6O5GGr-ilzNeqQ7YgyWUtGY1RyiQK99HEMm-CteA7drnBFCSvc.jpg?r=bc2", "https://occ-0-4791-993.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABSq95oASL3Y7Bh2_Vy9pezuv0AI-Z9Ert4mht5oViAqnStww3df5r1-65Bz2AorqvPDnViuhqiQoo2E5c6TTxeCW8l6_.jpg?r=ef"]),
        Video(name: "秒速 5 公分", year: "2007", time: "1 小時 2 分鐘", creator: "新海誠", maturityNum: "7+", about: "小四學生遠野貴樹和篠原明里因著對書本的熱愛而結識，形影不離的兩人因為搬家而慢慢疏離。", Netflix: "https://www.netflix.com/tw/title/70093699", YouTube: "https://youtu.be/hcA79OTKvY0", photoLink: ["https://occ-0-4791-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABWUg-48X9vLpenBuMI6wZhwrrLJHb1LP_rGcVlCHyRlxUP_zkkgAdgPubwuGqPi_hTF8TKQOEGO3gQet2HN_lxjRK_iw.jpg?r=c95", "https://occ-0-4791-993.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABS8Ki7bvJDt64J68S9Y0RTYELaiX_VMas-QWu1OkbW7dHvA_cHYD0jwZL0VL_zp9FVFroOWIuYrpgsNzkFQEdQ1fTapJ.jpg?r=3b4"])
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(AnimeVideos, id: \.name) { video in
                    ZStack {
                        VideoRow(video: video)
                        
                        NavigationLink {
                            AnimeDetailView(video: video)
                        } label: {
                            EmptyView()
                        }
                    }
                }
            }
            .navigationTitle("Anime")
        }
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView()
    }
}
