var cnt = 0
for _ in 0..<Int(readLine()!)!{
    var flag = true
    let word = readLine()!.map{String($0)}
    var stack = [String]()
    for i in 0..<word.count{
        if i == 0{
            stack.append(word[i])
        }else{
            if stack.last! != word[i]{
                stack.append(word[i])
            }
        }
    }
    var temp = [String:Bool]()
    for stack in stack {
        if temp[stack] == nil{
            temp[stack] = true
        }else if temp[stack]!{
            flag = false
        }
    }
    if flag{
        cnt += 1
    }
}
print(cnt)