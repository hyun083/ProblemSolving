import Foundation

let N = Int(readLine()!)!
let forecast = readLine()!.split(separator: " ").map{$0=="0" ? -1:1}
var curr = 0
var ans = 0

for weather in forecast{
    curr += weather
    ans += curr
}
print(ans)