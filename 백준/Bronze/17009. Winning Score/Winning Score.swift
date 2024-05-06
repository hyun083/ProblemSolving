import Foundation

var apple = 0
var bananas = 0

apple += Int(readLine()!)!*3
apple += Int(readLine()!)!*2
apple += Int(readLine()!)!

bananas += Int(readLine()!)!*3
bananas += Int(readLine()!)!*2
bananas += Int(readLine()!)!

print(apple>bananas ? "A":apple==bananas ? "T":"B")