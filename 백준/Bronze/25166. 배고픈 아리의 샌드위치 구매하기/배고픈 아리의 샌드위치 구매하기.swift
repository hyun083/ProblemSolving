import Foundation

let SM = readLine()!.split(separator: " ").map{Int($0)!}
let remain = SM[0]-1023
let R = String(remain,radix:2).map{String($0)}
let M = String(SM[1],radix:2).map{String($0)}

if remain<=0{
    print("No thanks")
}else{
    let biR = Array(repeating: "0", count: max(0,11-R.count)) + R
    let biM = Array(repeating: "0", count: max(0,11-M.count)) + M
    var valid = true
    
    for i in 0..<11{
        if biR[i]=="1" && biM[i]=="0"{
            valid = false
        }
    }
    print(valid ? "Thanks":"Impossible")
}