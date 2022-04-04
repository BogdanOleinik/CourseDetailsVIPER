//
//  CourseListInteractor.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 04.04.2022.
//

import Foundation

protocol CourseListInteractorInputProtocol: AnyObject {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
    func getCourse(at indexPath: IndexPath)
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    func coursesDidReceive(_ courses: [Course])
    func courseDidReceive(_ course: Course)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    
    unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { courses in
            self.presenter.coursesDidReceive(courses)
            DataManager.shared.setCourses(courses)
        }
    }
    
    func getCourse(at indexPath: IndexPath) {
        let course = DataManager.shared.getCourse(at: indexPath)
        presenter.courseDidReceive(course)
    }
}
