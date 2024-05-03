import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let (X,Y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    print(X>=Y ? "MMM BRAINS":"NO BRAINS")
}