import Foundation

let T = Int(readLine()!)!
var arr = Array(repeating: 0, count: 10)
for _ in 0..<T{
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    var temp = 1
    
    for _ in 0..<ab[1]{
        temp *= ab[0]
        temp %= 10
    }
    if temp == 0{
        print(10)
    }else{
        print(temp)
    }
}