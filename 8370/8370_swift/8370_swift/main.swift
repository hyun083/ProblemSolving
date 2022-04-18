//
//  main.swift
//  8370_swift
//
//  Created by Hyun on 2022/04/18.
//

//import Foundation

let seats = readLine()!.split(separator: " ").map{Int(String($0))!}
print(seats[0]*seats[1] + seats[2]*seats[3])

