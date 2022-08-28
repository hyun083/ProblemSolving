//
//  main.swift
//  1063_swift
//
//  Created by Hyun on 2022/08/27.
//

import Foundation

let line = readLine()!.split(separator: " ").map{String($0)}
let line0 = line[0].map{$0}
let line1 = line[1].map{$0}
var king = [UInt8]()
var dol = [UInt8]()

king.append(line0[0].asciiValue!)
king.append(UInt8(String(line0[1]))!)

dol.append(line1[0].asciiValue!)
dol.append(UInt8(String(line1[1]))!)

let n = Int(line[2])!

for _ in 0..<n{
    let cmd = readLine()!
    switch cmd{
    case "R":
        if king[0] < 72{
            king[0] += 1
        }
        if dol[0] < 72{
            dol[0] += 1
        }
    case "L":
        if king[0] > 65{
            king[0] -= 1
        }
        if dol[0] > 65{
            dol[0] -= 1
        }
    case "B":
        if king[1] > 1{
            king[1] -= 1
        }
        if dol[1] > 1{
            dol[1] -= 1
        }
    case "T":
        if king[1] < 8{
            king[1] += 1
        }
        if dol[1] < 8{
            dol[1] += 1
        }
    case "RT":
        if (king[1] < 8 && king[0] < 72){
            king[0] += 1
            king[1] += 1
        }
        if (dol[0] < 72 && dol[1] < 8){
            dol[0] += 1
            dol[1] += 1
        }
    case "LT":
        if (king[0] > 65 && king[1] < 8){
            king[0] -= 1
            king[1] += 1
        }
        if (dol[0] > 65 && dol[1] < 8){
            dol[0] -= 1
            dol[1] += 1
        }
    case "RB":
        if (king[0] < 72 && king[1] > 1){
            king[0] += 1
            king[1] -= 1
        }
        if (dol[0] < 72 && dol[1] > 1){
            dol[0] += 1
            dol[1] -= 1
        }
    case "LB":
        if (king[0] > 65 && king[1] > 1){
            king[0] -= 1
            king[1] -= 1
        }
        if (dol[0] > 65 && dol[1] > 1){
            dol[0] -= 1
            dol[1] -= 1
        }
    default:
        continue
    }
}
print(String(UnicodeScalar(king[0]))+String(king[1]))
print(String(UnicodeScalar(dol[0]))+String(dol[1]))

