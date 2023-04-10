let N = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
for number in arr.sorted(by: <){
    print(number)
}