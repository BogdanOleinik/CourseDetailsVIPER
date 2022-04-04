//
//  DataManager.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 03.04.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private var courses: [Course] = []
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
    
    func setCourses(_ course: [Course]) {
        self.courses = course
    }
    
    func getCourse(at indexPath: IndexPath) -> Course {
        courses[indexPath.row]
    }
}
