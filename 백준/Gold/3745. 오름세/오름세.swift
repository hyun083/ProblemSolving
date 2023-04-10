import Foundation

//by honghoker
var answer = ""
var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    let bp = buffer.withUnsafeBufferPointer { $0[byteIdx] }
    if bp == 0 { print(answer); exit(0) } // 여기서 EOF 처리
    return bp
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

while true{
    let N = readInt()
    var arr = [(Int,Int)]()
    var tree = Array(repeating: 0, count: N*4)
    var dp = Array(repeating: 0, count: N)
    
    for i in 0..<N{
        arr.append((readInt(),i))
    }
    arr.sort(by: {
        if $0.0 == $1.0{
            return $0.1 > $1.1
        }else{
            return $0.0 < $1.0
        }
    })
    
    func update_tree(from:Int, to:Int, node_idx:Int, target_idx:Int, value:Int) -> Int{
        if target_idx < from || to < target_idx{
            return tree[node_idx]
        }
        
        if from == to{
            tree[node_idx] = value
            return tree[node_idx]
        }
        
        let mid = (from+to)/2
        let left = update_tree(from: from, to: mid, node_idx: node_idx*2, target_idx: target_idx, value: value)
        let right = update_tree(from: mid+1, to: to, node_idx: node_idx*2+1, target_idx: target_idx, value: value)
        tree[node_idx] = left<right ? right:left
        return tree[node_idx]
    }
    
    func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
        if to < min || max < from{
            return 0
        }
        if min <= from && to <= max{
            return tree[idx]
        }
        
        let mid = (from+to)/2
        let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
        let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
        return left<right ? right:left
    }
    
    for i in 0..<N{
        let idx = arr[i].1
        let length = read_tree(from: 0, to: N-1, idx: 1, min: 0, max: idx)
        update_tree(from: 0, to: N-1, node_idx: 1, target_idx: idx, value: length+1)
    }
    answer.append("\(tree[1])\n")
}
print(answer)