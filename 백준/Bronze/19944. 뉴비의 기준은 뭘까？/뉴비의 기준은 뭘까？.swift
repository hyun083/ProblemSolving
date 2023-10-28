import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
print((M==1 || M==2) ? "NEWBIE!":M<=N ? "OLDBIE!":"TLE!")