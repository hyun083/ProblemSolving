import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
var height = line[0]
let N = line[1]

for _ in 0..<N{
    height = height%2==0 ? height/2^6 : height*2^6
}
print(height)