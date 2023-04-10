import Foundation
var arr = Array(repeating: false, count: 10001)
func d(num:String)->Int{
    var result = Int(num)!
    for n in num{
        result += Int(String(n))!
    }
    return result
}

for i in 1...10000{
    if d(num: String(i)) <= 10000{
        arr[d(num: String(i))] = true
    }
}
for i in 1..<10000{
    if !arr[i]{
        print(i)
    }
}