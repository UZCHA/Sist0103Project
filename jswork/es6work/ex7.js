//비교연산자

let a=6;
let b="6";

console.log(a==b); //true, 값으로만 비교하기 때문
console.log(a===b); //false, 타입까지 같아야 true가 나온다

console.log(Object.is(a,b)); //false, Object와 ===은 동일
console.log(`a의 타입은 ${typeof(a)}입니다`);
console.log(`b의 타입은 ${typeof(b)}입니다`);