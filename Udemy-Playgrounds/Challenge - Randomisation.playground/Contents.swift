let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

//The number of letters in alphabet equals 26
var password = alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)]

//print(password)


let password2 = alphabet.shuffled().prefix(6).reduce(""){$0 + $1}

let numbers = [1, 2, 3, 4]
let numberSum = numbers.reduce(0) { acumulador, value in
//    print("acumulador:\(acumulador) - value:\(value)")
    acumulador + value
}
print(numberSum)



//Using reduce
var result = alphabet.shuffled().prefix(6).reduce("") { acumulador, value in
    acumulador + value
}
print("Using prefix and reduce: \(result)")


//Using joined
result = alphabet.shuffled()[0...5].joined()
print("Using range and joined: \(result)")


//Using shuffled, prefix and joined
result = alphabet.shuffled().prefix(6).joined()
print("Using prefix and joined: \(result)")


