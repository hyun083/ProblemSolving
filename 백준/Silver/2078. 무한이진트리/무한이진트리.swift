import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var A = input[0]
var B = input[1]
var left = 0
var right = 0
while true{
    if A == 1{
        right += B-1
        break
    }else if B == 1{
        left += A-1
        break
    }
    if A>B{
        left += A/B
        A %= B
    }else{
        right += B/A
        B %= A
    }
}
print(left, right)