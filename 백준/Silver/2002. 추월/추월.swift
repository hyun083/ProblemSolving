import Foundation

let N = Int(readLine()!)!
var cars = [String:Int]()
var idx = 0
var over = [Int]()

for i in 0..<N{
    cars[readLine()!] = i
}

for _ in 0..<N{
    while over.contains(idx){
        idx+=1
    }
    let car = cars[readLine()!]!
    if car == idx{
        idx += 1
    }else{
        over.append(car)
    }
}
print(over.count)