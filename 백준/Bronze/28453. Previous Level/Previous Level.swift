import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
for level in arr{
    if level >= 300{
        print(1,terminator: " ")
    }else if level >= 275{
        print(2,terminator: " ")
    }else if level >= 250{
        print(3,terminator: " ")
    }else{
        print(4,terminator: " ")
    }
}