//
//  CourseCellViewModel.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 04.04.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIdenifier: String { get }
    var cellHeight: Double { get }
}

protocol SectionRowRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class CourseCellViewModel: CellIdentifiable {
    let courseName: String
    let imageURL: URL
    
    var cellIdenifier: String {
        "CourseCell"
    }
    
    var cellHeight: Double {
        100
    }
    
    init(course: Course) {
        courseName = course.name
        imageURL = course.imageUrl
    }
}

class CourseSectionViewModel: SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
}
