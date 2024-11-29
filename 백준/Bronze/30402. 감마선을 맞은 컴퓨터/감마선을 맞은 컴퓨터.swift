var map = [[String]]()
var chunbae = false
var nabi = false
var yeongcheol = false

for _ in 0..<15{
    let info = readLine()!.split(separator: " ").map{String($0)}
    for data in info{
        if data == "w"{
            chunbae = true
        }else if data == "b"{
            nabi = true
        }else if data == "g"{
            yeongcheol = true
        }else{
            continue
        }
    }
}
print(chunbae ? "chunbae":nabi ? "nabi":yeongcheol ? "yeongcheol":"none")