import Foundation

let n = Int(readLine()!)!
var dic = [String:Int]()
for name in readLine()!.split(separator: " ").map{String($0)}{
    dic[name] = 0
}
for _ in 0..<n{
    let names = readLine()!.split(separator: " ").map{String($0)}
    for name in names{
        dic[name]! += 1
    }
}
for output in dic.sorted(by: {
    if $0.value == $1.value{
        return $0.key < $1.key
    }else{
        return $0.value > $1.value
    }
}){
    print(output.key, output.value)
}