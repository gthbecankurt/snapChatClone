//
//  UserSingleton.swift
//  SnapchatCloneB
//
//  Created by Emirhan Cankurt on 14.02.2023.
//

import Foundation


class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init() {
        
    }
    
    
}
