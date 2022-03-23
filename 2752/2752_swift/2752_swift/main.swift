//
//  main.swift
//  2752_swift
//
//  Created by Hyun on 2022/03/23.
//

//import Foundation

for number in readLine()!.split(separator: " ").map({Int(String($0))!}).sorted(by: <){
    print(number,terminator: " ")
}

