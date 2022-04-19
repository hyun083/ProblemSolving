//
//  main.swift
//  9654_swift
//
//  Created by Hyun on 2022/04/19.
//

//import Foundation

var ship = [["SHIP NAME","CLASS","DEPLOYMENT","IN SERVICE"],
            ["N2 Bomber","Heavy Fighter","Limited","21"],
            ["J-Type 327","Light Combat","Unlimited","1"],
            ["NX Cruiser","Medium Fighter","Limited","18"],
            ["N1 Starfighter","Medium Fighter","Unlimited","25"],
            ["Royal Cruiser","Light Combat","Limited","4"]]
for i in 0..<6{
    for k in 0..<4{
        if k <= 1{
            while ship[i][k].count < 15{
                ship[i][k].append(" ")
            }
        }else if k == 2{
            while ship[i][k].count < 11{
                ship[i][k].append(" ")
            }
        }else{
            while ship[i][k].count < 10{
                ship[i][k].append(" ")
            }
        }
        print(ship[i][k],terminator: "")
    }
    print()
}
