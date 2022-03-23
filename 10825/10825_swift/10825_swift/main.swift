//
//  main.swift
//  10825_swift
//
//  Created by Hyun on 2022/03/23.
//

import Foundation

struct Student:Comparable{
    static func < (lhs: Student, rhs: Student) -> Bool {
        if lhs.kor == rhs.kor{
            if lhs.eng == rhs.eng{
                if lhs.math == rhs.math{
                    return lhs.name < rhs.name
                }else{return lhs.math>rhs.math}
            }else{return lhs.eng < rhs.eng}
        }else{return lhs.kor > rhs.kor}
    }
    
    var name:String
    var kor:Int
    var eng:Int
    var math:Int
    
    init(name:String, kor:Int, eng:Int, math:Int){
        self.name = name
        self.kor = kor
        self.eng = eng
        self.math = math
    }
}

let N = Int(readLine()!)!
var students = [Student]()
for _ in 0..<N{
    let std = readLine()!.split(separator: " ").map{String($0)}
    students.append(Student(name: std[0], kor: Int(std[1])!, eng: Int(std[2])!, math: Int(std[3])!))
}
for student in students.sorted(by: <) {
    print(student.name)
}
