//
//  Person.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 02.04.2022.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}
