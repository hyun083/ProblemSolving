import Foundation

let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0
for number in numbers{
    ans += Int(pow(Double(number), 2.0))
}
print(ans%10)