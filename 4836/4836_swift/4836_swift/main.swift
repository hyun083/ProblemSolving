//
//  main.swift
//  4836_swift
//
//  Created by Hyun on 2023/02/06.
//

import Foundation

var ans = [String]()
while let dance = readLine(){
    if dance == ""{ break }
    var step = dance.split(separator: " ").map{String($0)}
    var errors = [Int]()
    let length = step.count
    
    if length < 3{
        errors.append(2)
    }else{
        let ending = step[length-3...length-1].joined(separator: " ")
        if ending != "clap stomp clap"{
            errors.append(2)
        }
    }
    
    if step.contains("twirl") && !step.contains("hop"){
        errors.append(3)
    }
    
    if step[0] == "jiggle"{
        errors.append(4)
    }
    
    if !step.contains("dip"){
        errors.append(5)
    }
    
    for i in 0..<length{
        if step[i] == "dip"{
            var flag = false
            for k in i-2..<i{
                if k<0 { continue }
                if step[k] == "jiggle"{ flag = true}
            }
            if i+1 < length{
                if step[i+1] == "twirl"{ flag = true}
            }
            
            if !flag{
                step[i] = "DIP"
                errors.append(1)
            }
        }
    }
    
    var res = String()
    if errors.count == 0{
        res = "form ok: " + dance
    }else if errors.count == 1{
        res = "form error "
        res += "\(errors[0]): \(step.joined(separator: " "))"
    }else{
        res = "form errors "
        errors.sort(by: <)
        for i in 0..<errors.count{
            res += "\(errors[i])"
            if i < errors.count-2{
                res += ", "
            }else{
                if i == errors.count-2{
                    res += " and "
                }else{
                    res += ": \(step.joined(separator: " "))"
                }
            }
        }
    }
    ans.append(res)
}
print(ans.joined(separator: "\n"))
