import Foundation

while let line = readLine(){
    let N = Double(line)!
    if N == 0{ break }
    let result = 1 + N + (N*N) + (N*N*N) + (N*N*N*N)
    print(String(format: "%.2f", result))
}