var arr = [Int]()
for _ in 1...9{
    arr.append(Int(readLine()!)!)
}
print("\(arr.max()!)\n\(arr.firstIndex(of: arr.max()!)! + 1)")