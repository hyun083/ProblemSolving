//
//  main.swift
//  1259_swift
//
//  Created by Hyun on 2021/11/14.
//

import Foundation

while(true){
    let input = Int(readLine()!)!
    if(input == 0) {break}
    let rev = String(String(input).reversed().map{$0})
    if(String(input) == rev){
        print("yes")
    }else{
        print("no")
    }
}

