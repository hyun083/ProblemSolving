import Foundation

func readPrice() -> Int{ Int(readLine()!)!}

var burger = min(readPrice(), min(readPrice(), readPrice()))
var drink = min(readPrice(), readPrice())
print(burger + drink - 50)