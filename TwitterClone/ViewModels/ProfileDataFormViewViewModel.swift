//
//  ProfileDataFormViewViewModel.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 07.03.2023.
//

import Foundation
import Combine



final class ProfielDataFormViewViewModel: ObservableObject {
    
    @Published var displayName: String?
    @Published var userName: String?
    @Published var bio: String?
    @Published var avatarPath: String?
    
    
}
