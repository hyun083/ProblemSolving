import Foundation

func score() -> Int{
    readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
}

print(max(score(), score()))