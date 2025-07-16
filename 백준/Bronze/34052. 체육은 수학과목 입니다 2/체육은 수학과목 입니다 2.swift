var sum = 0
for _ in 0..<4{
    let time = Int(readLine()!)!
    sum += time
}
sum += 300
print(sum<=1800 ? "Yes":"No")
