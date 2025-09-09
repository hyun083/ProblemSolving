import Foundation

let N = Int(readLine()!)!
var tmp = Array(repeating: 0, count: 36)
tmp[0] = 1

func solution(num:Int)->Int{
    if num == 0{
        return 1
    }else{
        if tmp[num] == 0{
            var sum = 0
            for i in 0..<num{
                sum += solution(num: i)*solution(num: num-i-1)
            }
            tmp[num] = sum
        }
        return tmp[num]
    }
}

print(solution(num: N))