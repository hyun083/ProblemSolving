import Foundation

let N = Int(readLine()!)!
var minus = [Int]()
var plus = [Int]()
var zero = 0
var ans = 0

for _ in 0..<N{
    let num = Int(readLine()!)!
    if num < 0{
        minus.append(num)
    }else if num == 0{
        zero += 1
    }else{
        plus.append(num)
    }
}

plus.sort(by: <)
while plus.count >= 2{
    let a = plus.removeLast()
    let b = plus.removeLast()
    if a==1 || b==1{
        ans += a + b
    }else{
        ans += a * b
    }
}
if plus.count == 1{
    ans += plus.removeLast()
}

minus.sort(by: >)
while minus.count >= 2{
    let a = minus.removeLast()
    let b = minus.removeLast()
    ans += a * b
}

if minus.count==1 && zero==0{
    ans += minus.removeLast()
}
print(ans)