# Mockito

```java
// 待测试层bean
@InjectMocks
private MyService myService;
// mock层bean，模拟数据并认为该操作成功
@Mock
private MyDao myDao;

//模拟数据-某个方法的请求参数
private MyRequest myRequest;
//模拟数据-某个方法的响应参数
private MyResponse myResponse;

// 初始化mock环境和数据
@Before
public void initEnv(){
    // 初始化mock环境
    MockitoAnnotations.initMocks(this);
    //初始化请求参数
    myRequest = new MyRequest();
    myRequest.setUserName("xName");
    myRequest.setPassword("xPass");
    //初始化响应参数
    myResponse = new MyResponse();
    myResponse.setMsg("请求成功");
    myResponse.setUserId("xUID");
}

// 单元测试
@Test
public void myServiceTest(){
    //Mock掉MyDao中的checkUser(MyRequest)方法：当调用 myDao.checkUser(MyRequest)方法时，设置返回myResponse
    Mockito.when(myDao.checkUser(Mockito.any(MyRequest.class))).thenReturn(myResponse);

    //Mock MyDao中的insertLog(UserLog)方法：当调用 **void** myDao.insertLog(UserLog) 方法时，不做任何事情
    Mockito.doNothing().when(myDao).insertLog(Mockito(UserLog.class));

    //调用被测试方法
    //myService.getUser(myRequest)方法中会执行 myDao.getUser(myRequest) 和 myDao.insertLog(userLog) 方法，这两个方法都已经被 Mock了

    XxResponse xxResponse = myService.getUser(myRequest);
    //断言响应不为空   
    assertThat(xxResponse).isNotNull();
}
```

