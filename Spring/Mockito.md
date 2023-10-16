https://site.mockito.org/
## Basic
```java
@InjectMocks  
private FooService fooService;  
  
@Mock  
private DbService dbService;  
  
@BeforeEach  
void init() {  
    MockitoAnnotations.initMocks(this);  
}

@Test
void test(){
	Mockito.when(dbService.findData(eq("sql"), any())).thenReturn("some");
	Object act = fooService.apply();
	
	verify(dbService, times(One)).find(any());
	assetThat(act.num, is(exNum))
}
```

## Mock Action
### mock property
```java
ReflectionTestUtils.setField(dbService, "propertyName", "value");
```
### return value
```java
when(dbService.find(eq("query"))).thenReturn(new Entity());
```
### return nothing
```java
doNothing().when(dbService).insertData(any(Entity.class));
```
### throw exception
```java
when(dbService.update(any())).thenThrow(new RuntimeException());
```
### call real method
```java
doCallRealMethod().when(mock).someVoidMethod();
```
### mulitpue call
```java
// Classic style:
when(yourMock.yourMethod()).thenReturn(1, 2, 3);

// Explicit style:
when(yourMock.yourMethod())
	.thenReturn(1);
	.thenReturn(2);
	.thenReturn(3);
```
## Verify

### Verification in order
```java
// A. Single mock whose methods must be invoked in a particular order
List singleMock = mock(List.class);

// using a single mock
singleMock.add("was added first");
singleMock.add("was added second");

// create an inOrder verifier for a single mock
InOrder inOrder = inOrder(singleMock);

// following will make sure that add is first called with "was added first", then with "was added second"
inOrder.verify(singleMock).add("was added first");
inOrder.verify(singleMock).add("was added second");

// B. Multiple mocks that must be used in a particular order
List firstMock = mock(List.class);
List secondMock = mock(List.class);

// using mocks
firstMock.add("was called first");
secondMock.add("was called second");

// create inOrder object passing any mocks that need to be verified in order
InOrder inOrder = inOrder(firstMock, secondMock);

// following will make sure that firstMock was called before secondMock
inOrder.verify(firstMock).add("was called first");
inOrder.verify(secondMock).add("was called second");

// Oh, and A + B can be mixed together at will
```
###  Capturing arguments
```java
// when method with multipule args,just can capture only one
ArgumentCaptor<Person> argument = ArgumentCaptor.forClass(Person.class);
verify(mock).doSomething(argument.capture());
assertEquals("John", argument.getValue().getName());
```