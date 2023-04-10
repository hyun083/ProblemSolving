import Foundation
var dic = [String:Int]()
func s(input: [String], k:Int){
    var result = ""
    var visited = Array(repeating: false, count: input.count)
    
    func btk(cnt:Int, pre:Int){
        if result.count == k{
            if dic[result] == nil{
                dic[result] = 1
            }else{
                dic[result]! += 1
            }
        }
        for i in 0..<input.count{
            if !visited[i] && pre<i{
                visited[i] = true
                result.append(contentsOf: input[i])
                btk(cnt: cnt+1,pre: i)
                result.removeLast()
                visited[i] = false
            }
        }
    }
    for i in 0..<input.count{
        visited[i] = true
        result.append(contentsOf: input[i])
        btk(cnt: 0, pre: i)
        result.removeLast()
        visited[i] = false
    }
}

let x = readLine()!.map{String($0)}
let y = readLine()!.map{String($0)}
let z = readLine()!.map{String($0)}
let k = Int(readLine()!)!

s(input: x, k: k)
s(input: y, k: k)
s(input: z, k: k)
var answers = ""

for ans in dic.sorted(by: { return $0.key < $1.key }){
    if ans.value >= 2{
        answers += ans.key + "\n"
    }
}

if answers.isEmpty{
    print(-1)
}else{
    answers.removeLast()
    print(answers)
}