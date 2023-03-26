import Foundation

let m = Int(readLine()!)!
let n = Int(readLine()!)!
var sum = 0
var myMin = 0
for i in stride(from: 100, to: 0, by: -1){
    let number = Int(NSDecimalNumber(decimal:pow(Decimal(i), 2)))
    if m<=number && number<=n{
        sum += number
        myMin = number
    }
}
if sum == 0 && myMin==0{
    print(-1)
}else{
    print(sum)
    print(myMin)
}
