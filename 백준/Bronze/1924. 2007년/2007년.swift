import Foundation

var ans = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
var day = [0,31,28,31,30,31,30,31,31,30,31,30,31]

let info = readLine()!.split(separator: " ").map{Int($0)!}
var tmp = day[1..<info[0]].reduce(0, +) + info[1]
print(ans[tmp%7])