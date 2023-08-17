import Foundation

func readInt() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

let AB = readInt()
let CD = readInt()

let A = AB[0]
let B = AB[1]
let C = CD[0]
let D = CD[1]

print(min(A+D, B+C))