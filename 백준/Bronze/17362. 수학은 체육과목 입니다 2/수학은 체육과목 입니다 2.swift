import Foundation

let N = Int(readLine()!)! % 8
print(N==0 ? 2:N<=5 ? N:10-N)