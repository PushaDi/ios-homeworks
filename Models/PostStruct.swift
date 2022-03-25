//
//  PostStruct.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 23.03.2022.
//

import UIKit

struct PostStruct {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

let postBatman: PostStruct = PostStruct(author: "LonelyBat3000", description: "Очень жаль, что в России нельзя посмотреть на меня, я же старался", image: "batman", likes: 200, views: 1500)
let postDrStrange: PostStruct = PostStruct(author: "Mr(DR)Strange", description: "Придется как следует потрудиться с заклинаниями, чтобы расставить все констрэйнты. Кажется после этого стоит называть меня Доктор Констрэйндж", image: "drStrange", likes: 400, views: 1800)
let postPeacemaker: PostStruct = PostStruct(author: "maker", description: "Эй, Бэтмэн! Новый фильм ниче так!", image: "peacemaker", likes: 100, views: 101)
let postSpiderman: PostStruct = PostStruct(author: "Friend1yNe!ghb0ur", description: "Левый констрэйнт убегает!", image: "spiderman", likes: 1000, views: 10000)

let postsCollection: [PostStruct] = [postBatman, postSpiderman, postPeacemaker, postDrStrange]
