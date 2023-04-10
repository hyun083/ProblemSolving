var arr = Array(repeating: 0, count: 26)
for (_,value) in readLine()!.utf8.enumerated(){
    arr[Int(exactly: value)! - 97] += 1
}
for number in arr{
    print(number,terminator: " ")
}