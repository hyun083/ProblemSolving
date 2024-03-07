import Foundation

let (y,m,d) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
let (ty,tm,td) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]

let birthday = (y*365)+(m*30)+(d)
let today = (ty*365)+(tm*30)+(td)

print((today - birthday)/365)
print(ty-y+1)
print(ty-y)