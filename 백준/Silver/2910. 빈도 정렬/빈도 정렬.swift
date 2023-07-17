import Foundation

func readInt() -> [Int]{
    return readLine()!.split(separator: " ").map{Int($0)!}
}

let NC = readInt()
let N = NC[0]
let C = NC[1]

let msg = readInt()
var arr = Dictionary<Int,(idx:Int, cnt:Int)>()

for idx in 0..<N{
    let number = msg[idx]
    if arr[number] == nil{
        arr[number] = (idx,1)
    }else{
        arr[number]!.cnt += 1
    }
}

for ans in arr.sorted(by: {
    $0.value.cnt == $1.value.cnt ? $0.value.idx < $1.value.idx : $0.value.cnt > $1.value.cnt
}){
    for _ in 0..<ans.value.cnt{
        print(ans.key,terminator: " ")
    }
}