//
//  CourseDetailsInteractor.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 02.04.2022.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
}
