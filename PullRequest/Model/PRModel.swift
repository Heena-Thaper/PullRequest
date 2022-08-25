//
//  PRModel.swift
//  PullRequest
//
//  Created by heena thapar on 25/08/22.
//

import Foundation

struct PullRequest: Decodable{
    var id: Int?
    var url: String?
    var state: String?
    var title:String?
    var created_at: String?
    var closed_at: String?
    var user: User?
    

}
struct User: Decodable {
    var id: Int?
    var login: String?
    var avatar_url: String?
}
