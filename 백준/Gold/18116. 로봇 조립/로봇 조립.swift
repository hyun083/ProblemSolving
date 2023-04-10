import Foundation

var arr = Array(repeating: -1, count: 1000002)
var output = ""
func root(of n:Int) -> Int{
    if arr[n] < 0{ return n }
    arr[n] = root(of: arr[n])
    return arr[n]
}

func union(a:Int, b:Int){
    let rootOfA = root(of: a)
    let rootOfB = root(of: b)
    
    if rootOfA == rootOfB{
        return
    }
    
    if arr[rootOfA] <= arr[rootOfB]{
        arr[rootOfA] += arr[rootOfB]
        arr[rootOfB] = rootOfA
    }else{
        arr[rootOfB] += arr[rootOfA]
        arr[rootOfA] = rootOfB
    }
}

for _ in 0..<Int(readLine()!)!{
    let cmd = readLine()!.split(separator: " ").map{String($0)}
    if cmd[0] == "I"{
        let a = Int(cmd[1])!
        let b = Int(cmd[2])!
        union(a: a, b: b)
    }else{
        let root = root(of: Int(cmd[1])!)
        output += "\(-1*arr[root])\n"
    }
}
print(output)