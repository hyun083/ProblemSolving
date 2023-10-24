import Foundation

let input = readLine()!

if input.count == 2{
    print(input.map{Int(String($0))!}.reduce(0, +))
}else if input.count == 3{
    let tmp = input.map{String($0)}
    var a = 0
    var b = 0
    if tmp[1] == "0"{
        a = Int(tmp[0]+tmp[1])!
        b = Int(tmp[2])!
    }else{
        a = Int(tmp[0])!
        b = Int(tmp[1]+tmp[2])!
    }
    print(a+b)
}else{
    print(20)
}