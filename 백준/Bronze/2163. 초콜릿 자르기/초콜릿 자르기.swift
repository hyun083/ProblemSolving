import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
print(NM[0]*NM[1]-1)