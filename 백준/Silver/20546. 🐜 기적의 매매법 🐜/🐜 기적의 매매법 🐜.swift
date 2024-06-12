import Foundation

let money = Int(readLine()!)!
var J = money
var jCnt = 0
var S = money
var sCnt = 0

var price = readLine()!.split(separator: " ").map{Int($0)!}
var rising = 0
var falling = 0

if J/price[0] > 0{
    jCnt += J/price[0]
    J = J%price[0]
}

for i in 1..<14{
    let p = price[i]
    if J/p > 0{
        jCnt += J/p
        J = J%p
    }
    
    if p > price[i-1]{
        rising += 1
        falling = 0
    }else if p==price[i-1]{
        rising = 0
        falling = 0
    }else{
        rising = 0
        falling += 1
    }
    
    if rising>=3{
        S += sCnt*p
        sCnt = 0
    }
    if falling>=3&&S/p>0{
        sCnt += S/p
        S = S%p
    }
}
let jTotal = J+(jCnt*price.last!)
let sTotal = S+(sCnt*price.last!)
print(jTotal>sTotal ? "BNP": jTotal==sTotal ? "SAMESAME":"TIMING")