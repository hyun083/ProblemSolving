//
//  main.swift
//  1340_swift
//
//  Created by Hyun on 2022/10/16.
//

import Foundation

let day = 1440.00
let month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
let normal = [31.00, 28.00, 31.00, 30.00, 31.00, 30.00, 31.00, 31.00, 30.00, 31.00, 30.00, 31.00]
let leap = [31.00, 29.00, 31.00, 30.00, 31.00, 30.00, 31.00, 31.00, 30.00, 31.00, 30.00, 31.00]

var today = readLine()!.split(separator: " ").map{String($0)}
var minute = 0.00

var i = 0
let year = Int(today[2])!
var yy = 365.00
if year%400==0 || (year%4==0 && year%100 != 0){
    yy = 366.00
    while today[0] != month[i]{
        minute += (day*leap[i])
        i+=1
    }
}else{
    while today[0] != month[i]{
        minute += (day*normal[i])
        i+=1
    }
}

var temp = today[1]
temp.removeLast()
minute += (Double(temp)!-1.00)*day

var time = today[3].split(separator: ":").map{Double($0)!}
minute += time[0]*60
minute += time[1]

print(minute/(yy*1440.00)*100.00)
