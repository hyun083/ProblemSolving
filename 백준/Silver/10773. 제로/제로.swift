import Foundation

var K = Int(readLine()!)!
var numbers = Array<Int>()
var sum = 0

for _ in 1...K{
    var number = Int(readLine()!)!
    if(number == 0){
        sum -= numbers.removeLast()
    }else{
        sum += number
        numbers.append(number)
    }
}
print(sum)