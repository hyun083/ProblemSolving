import Foundation
let (W,H) = [readLine()!.split(separator: " ").map{Float($0)!}].map{($0[0], $0[1])}[0]
print(String(format: "%.1f", W*H/2))