import Foundation

let square = readLine()!.split(separator: " ").map{Int($0)!}.reduce(1,*)
let bag = 5*4840
let mod = square%bag

print(mod==0 ? square/bag : square/bag+1)