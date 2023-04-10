var arr = Array(repeating: "-1", count: 26)
let str = readLine()!.map{Character(String($0))}
for i in 0..<str.count{
    let idx = Int(str[i].asciiValue! - 97)
    if arr[idx] == "-1"{
        arr[idx] = String(i)
    }else{
        arr[idx] = Int(arr[idx])!>i ? String(i):arr[idx]
    }
}
print(arr.joined(separator: " "))