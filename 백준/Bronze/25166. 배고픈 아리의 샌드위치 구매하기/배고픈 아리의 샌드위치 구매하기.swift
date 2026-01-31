import Foundation

let SM = readLine()!.split(separator: " ").map{Int($0)!}
let S = SM[0]
let M = SM[1]
let remain = S-1023
var padCount = 0

if remain<=0{
    print("No thanks")
}else{
    let remainArr = String(remain,radix: 2).map{String($0)}
    let mArr = String(M,radix: 2).map{String($0)}
    let biR = Array(repeating: "0", count: max(0,11-remainArr.count))+remainArr
    let biM = Array(repeating: "0", count: max(0,11-mArr.count))+mArr
    var flag = true
    
    for i in 0..<11{
        if biR[i]=="1" && biM[i]=="0"{
            flag = false
        }
    }
    print(flag ? "Thanks":"Impossible")
}