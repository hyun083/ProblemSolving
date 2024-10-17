import Foundation

let T = readLine()!.map{String($0)}
var key:UInt8 = 0
for i in 0..<128{
    let t = Character(T[0]).asciiValue!
    let k = UInt8(i)
    
    if t^k == UInt8(67){
        key = k
    }
}

for t in T{
    let ans = Character(t).asciiValue!^key
    print(String(UnicodeScalar(ans)),terminator: "")
}