for _ in 0..<Int(readLine()!)!{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let HP = input[0]+input[4]<1 ? 1:input[0]+input[4]
    let MP = input[1]+input[5]<1 ? 1:input[1]+input[5]
    let ATK = input[2]+input[6]<0 ? 0:input[2]+input[6]
    let DEF = input[3]+input[7]
    print(1*HP+5*MP+2*ATK+2*DEF)
}