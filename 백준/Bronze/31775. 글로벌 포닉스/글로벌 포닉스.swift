import Foundation

var L = false
var K = false
var P = false

for _ in 0..<3{
    let str = readLine()!.map{String($0)}
    if str[0] == "l"{
        L = true
    }else if str[0] == "k"{
        K = true
    }else if str[0] == "p"{
        P = true
    }
}
print(L&&K&&P ? "GLOBAL":"PONIX")