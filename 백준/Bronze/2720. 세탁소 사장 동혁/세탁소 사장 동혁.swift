import Foundation

let T = Int(readLine()!)!
let coin = [25,10,5,1]
for _ in 0..<T{
    var coins = ""
    var charge = Int(readLine()!)!
    for i in 0..<4{
        coins += String(charge/coin[i]) + " "
        charge = charge%coin[i]
    }
    print(coins)
}