import Foundation

let num1 = Int(readLine()!)!
var num2 = Int(readLine()!)!
let ans = num1*num2

print(num1*(num2%10))
num2 /= 10
print(num1*(num2%10))
num2 /= 10
print(num1*(num2%10))
num2 /= 10
print(ans)