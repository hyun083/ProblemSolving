import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 10), count: 1001)

for i in 0...9{
    arr[1][i] = 1
    arr[2][i] = i+1
}
for i in 3...1000{
    for k in 0...9{
        if k == 0{
            arr[i][k] = 1
            continue
        }
        arr[i][k] = (arr[i][k-1] % 10007)+(arr[i-1][k] % 10007)%10007
    }
}

func numbers(num:Int) -> Int{
    var sum = 0
    for i in 0..<10{
        sum += arr[num][i]
    }
    return sum % 10007
}
print(numbers(num: N))