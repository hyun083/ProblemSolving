import Foundation

let T = Int(readLine()!)!
let distance = [1,3,5]
for _ in 0..<T{
    let GCE = readLine()!.split(separator: " ").map{Int($0)!}
    let G = GCE[0]-1
    let C = GCE[1]
    let E = GCE[2]
    print(E<=C ? 0:(E-C)*distance[G])
}