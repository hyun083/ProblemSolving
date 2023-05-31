import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
var a = line[0]
let p = line[1]
var idx = 0
var ans = [Int:Int]()

func makeNumber(from a:Int) -> Int{
    var result = 0
    var a = a
    var temp = [Int]()
    
    while a >= 10{
        temp.append(a%10)
        a /= 10
    }
    temp.append(a)
    
    for t in temp{
        result += Int(NSDecimalNumber(decimal: pow(Decimal(t), p)))
    }
    
    return result
}

while ans[a] == nil{
    ans[a] = idx
    idx += 1
    a = makeNumber(from: a)
}
print(ans[a]!)