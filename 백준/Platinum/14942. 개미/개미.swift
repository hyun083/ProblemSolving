import Foundation

//by wapas
class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

let file = FileIO()

let MAX = 18
let N = file.readInt()
var power = [Int]()
var arr = Array(repeating: [(node:Int, cost:Int)](), count: N)
var cost = Array(repeating: 0, count: N)
var parent = Array(repeating: Array(repeating: (-1,0), count: N), count: MAX)
var depth = Array(repeating: -1, count: N)

func makeTree(from curr:Int, currCost:Int){
    for next in arr[curr]{
        if depth[next.node] < 0{
            depth[next.node] = depth[curr]+1
            parent[0][next.node].0 = curr
            parent[0][next.node].1 = next.cost
            cost[next.node] = currCost + next.cost
            makeTree(from: next.node, currCost: cost[next.node])
        }
    }
}

for _ in 0..<N{
    power.append(file.readInt())
}

for _ in 0..<N-1{
    let u = file.readInt()-1
    let v = file.readInt()-1
    let c = file.readInt()
    
    arr[u].append((v,c))
    arr[v].append((u,c))
}

depth[0] = 0
makeTree(from: 0, currCost: 0)

for level in 0..<MAX-1{
    for node in 1..<N{
        if parent[level][node].0 > -1{
            parent[level+1][node].0 = parent[level][parent[level][node].0].0
            if parent[level+1][node].0 > -1{
                parent[level+1][node].1 = cost[node] - cost[parent[level+1][node].0]
            }
        }
    }
}

for ant in 0..<N{
    var u = ant
    var energy = power[u]
    var depth = depth[u]
    
    for level in stride(from: MAX-1, through: 0, by: -1){
        if depth >= 1<<level && energy >= parent[level][u].1 && parent[level][u].0 > -1{
            depth -= 1<<level
            energy -= parent[level][u].1
            u = parent[level][u].0
        }
    }

    print(u+1)
}