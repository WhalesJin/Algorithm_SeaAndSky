// 우리는 어떤 올바른 괄호열 X에 대하여 그 괄호열의 값(괄호값)을 아래와 같이 정의하고 값(X)로 표시한다.
//
// ‘()’ 인 괄호열의 값은 2이다.
// ‘[]’ 인 괄호열의 값은 3이다.
// ‘(X)’ 의 괄호값은 2×값(X) 으로 계산된다.
// ‘[X]’ 의 괄호값은 3×값(X) 으로 계산된다.
// 올바른 괄호열 X와 Y가 결합된 XY의 괄호값은 값(XY)= 값(X)+값(Y) 로 계산된다.

let input: String = readLine()!
var stack: [Character] = []
var array: [Character] = []
var result: Int = 0
var temp: Int = 1

for element in input {
    if element == "(" {
        stack.append(element)
        temp *= 2
    } else if element == "[" {
        stack.append(element)
        temp *= 3
    } else if element == ")" {
        if stack.last != "(" {
            result = 0
            break
        }

        if array.last == "(" {
            result += temp
        }

        temp /= 2
        stack.removeLast()
    } else if element == "]" {
        if stack.last != "[" {
            result = 0
            break
        }

        if array.last == "[" {
            result += temp
        }

        temp /= 3
        stack.removeLast()
    }

    array.append(element)
}

if !stack.isEmpty {
    result = 0
}

print(result)
