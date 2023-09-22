import Foundation

var (N,L) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let fruits = readLine()!.split(separator: " ").map{Int($0)!}.sorted()

for fruit in fruits {
    if L < fruit{ break }
    L += 1
}
print(L)