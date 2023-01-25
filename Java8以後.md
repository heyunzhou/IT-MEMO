## Lambda
```java
// 例１
list.forEach(n -> System.out.println(n));
// 例２
list.sort(comparing(Apple::getWeight));
// 例３
(x,y) -> x + y
```

## Function Interface
### Function
```java
@FunctionalInterface  
public interface Function<T, R> {

	R apply(T t);
	
	default <V> Function<V, R> compose(Function<? super V, ? extends T> before) {  
	    Objects.requireNonNull(before);  
	    return (V v) -> apply(before.apply(v));  
	}
	default <V> Function<T, V> andThen(Function<? super R, ? extends V> after) {  
	    Objects.requireNonNull(after);  
	    return (T t) -> after.apply(apply(t));  
	}

	static <T> Function<T, T> identity() {  
	    return t -> t;  
	}
```

例：One Input One Output
```java
Function<Integer,Integer> plusOne = x -> x+1;  
Function<Integer,Integer> multiplyTwo = x -> x * 2;  
plusOne.compose(multiplyTwo).apply(1); // 1 * 2 + 1
plusOne.andThen(multiplyTwo).apply(1); // ( 1 + 1 )* 2

list.stream().collect(toMap(Apple::getColor, identity()));
```

### Consumer
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

例：One Input No Output
```java
StringBuilder sb = new StringBuilder();  
Consumer<StringBuilder> con1 = (str) -> str.append("chain1,");  
Consumer<StringBuilder> con2 = (str) -> str.append("chain2.");  
con1.andThen(con2).accept(sb);  
System.out.println(sb.toString());// result::chain1,chain2.
```

### Supplier
```java
@FunctionalInterface  
public interface Supplier<T> {  
  T get();  
}
```

### Predicate
```java
@FunctionalInterface  
public interface Predicate<T> {  
  
    boolean test(T t);  
	
	default Predicate<T> and(Predicate<? super T> other) {  
        Objects.requireNonNull(other);  
        return (t) -> test(t) && other.test(t);  
    }  
  
	default Predicate<T> negate() {  
        return (t) -> !test(t);  
    }  
  
	default Predicate<T> or(Predicate<? super T> other) {  
        Objects.requireNonNull(other);  
        return (t) -> test(t) || other.test(t);  
    }  
  
    static <T> Predicate<T> isEqual(Object targetRef) {  
        return (null == targetRef)  
                ? Objects::isNull  
                : object -> targetRef.equals(object);  
    }  
  
    static <T> Predicate<T> not(Predicate<? super T> target) {  
        Objects.requireNonNull(target);  
        return (Predicate<T>)target.negate();  
    }  
}
```

例: One Input Boolean Output
```java
Predicate<Apple> isRedApple = a -> a.getColor().equals("red");  
Predicate<Apple> notRedApple = isRedApple.negate();  
Predicate<Apple> isRedOrBlueApple = isRedApple.or(a -> a.getColor().equals("blue"));  
Predicate<Apple> isRedAndHeavyApple = isRedApple.and(a -> a.getWeight() > 150);

list.stream().filter(not(isRedApple)).findFirst();
list.stream().filter(isEqual(redApple)).findFirst();
```

## Optional
### Create
```java
Optional.empty();  
Optional.of("notNull");  
Optional.ofNullable("mayBeNull");
```
### Get
```java
optional.isPresent();  
optional.isEmpty()
optional.get();
```
### IfPresent
```java
// 値存在：true返却
optional.isPresent();  
// 値存在の場合、consumerを実行
optional.ifPresent(consumer);
// 値存在の場合、consumerを実行。それ以外、runnableを実行
optional.ifPresentOrElse(consumer, runnable));
```
### OrElse
```java
// 値存在、値を返却。存在しない、指定の値を返却
optional.orElse("default value");  
optional.orElseGet(supplier);
// 値存在、値を返却。存在しない、例外をスロー
optional.orElseThrow();
optional.orElseThrow(exceptionSupplier);
```
### Map
```java
// 転換したい値を取得
optional.map(Function);
// 条件一致の値を取得
optional.filter(predicate);
```

## Stream

## LocalDateAPI


