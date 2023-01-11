## Lambda
```java
// 例１
Consumer<String> con = (x) -> System.out.println(x);
con.accept("消費者::引数１つ、内容を実行する");

// 例２
BiPredicate<String, String> bp = String::equals;  
bp.test("a", "b");

// 例３
BiConsumer<String, String> biCon = (x, y) -> {  
    System.out.println("step1:" + x);  
    System.out.println("step2:" + y);  
};  
biCon.accept("hello", "world");
```
## function Interface
### Consumer::消費者
```java
@FunctionalInterface  
public interface Consumer<T> {
	void accept(T t);  
  
	default Consumer<T> andThen(Consumer<? super T> after) {  
		Objects.requireNonNull(after);  
		return (T t) -> { accept(t); after.accept(t); };  
	}
}
```

消費者チェーン
```java
StringBuilder sb = new StringBuilder();  
Consumer<StringBuilder> con1 = (str) -> str.append("chain1,");  
Consumer<StringBuilder> con2 = (str) -> str.append("chain2,");  
Consumer<StringBuilder> con3 = (str) -> str.append("chain3.");  
con1.andThen(con2).andThen(con3).accept(sb);  
System.out.println(sb.toString());
// output::chain1,chain2,chain3.
```
### Supplier::供給者
### Predicate::アサート

## Stream
## Optional


