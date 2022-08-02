## 第二章 装配Bean

### 1.自动装配（推荐）

- 组件扫描（component scanning）：Spring会自动发现应用上下文中所创建的bean
- 自动装配（autowiring）： Spring自动满足bean之间的依赖

```java
//配置类定义
@Configuration 
@ComponentScan
//指定多个基类
//@ComponentScan(basePackages = {"base1","base2"})
public class CDPlayerConfig {
}

//接口定义
public interface CompactDisc {
void play();
}

//实现类定义
@Component
public class SgtPeppers implements CompactDisc {
	private String title = "Sgt. Pepper's Lonely Hearts Club Band";
	private String artist = "The Beatles";
	
	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("Playing " + title + " by " + artist);
	}
}
```

### 2.在Java中进行显示配置

```java
@Configuration 
public class CDPlayerConfig {
    @Bean
    public CompactDisc sgtPeppers(){
        return new SgtPeppers();
    }
}
```

### 3.通过XML进行配置

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

<bean id="compactDisc" class="com.example.demo.SgtPeppers"></bean>
</beans>
```

### 4.混合配置

```java
@Configuration 
@Import(Config1.class,Config2.class)
@ImportResource("classpath:config3.xml")
public class MixConfig {}
```



## 第三章 高级装配

## 第四章 面向切面的Spring

## 第五章 构建Spring Web应用程序

## 第六章 渲染Web视图

## 第七章 SpringMVC的高级技术

### 一.静态页面绑定

#### 1.返回值String

-通过返回值指定页面地址

-通过addAttribute方法进行传值

```java
	@RequestMapping("/greeting")
	public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
		model.addAttribute("name", name);
		return "greeting";
	}
```

#### 2.返回值ModelAndView

-通过setViewName指定页面地址

-通过addObject方法进行传值

```java
	@RequestMapping("/greetingModelAndView")
	public ModelAndView greeting2() {
		ModelAndView model = new ModelAndView();
		model.setViewName("greetingModelAndView.html");
		model.addObject("name", "ModelAndView");
		return model;
	}
```

### 二.接收参数

#### 1.通过Bean来接收json

```java
@RequestMapping("/doLogin")
    public @ResponseBody User doLogin(@RequestBody User u) {
        logger.info("name: " + u.getName());
        logger.info("pswd: " + u.getPswd());

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setPswd(request.getParameter("pswd"));

        return user;
    }
```

#### 2.通过map来接收json

```java
@RequestMapping("/doLogin")
    public @ResponseBody User doLogin(@RequestBody Map<String, String> u) {

        logger.info("name: " + u.get("name"));
        logger.info("pswd: " + u.get("pswd"));

        User user = new User();
        user.setName(u.get("name"));
        user.setPswd(u.get("pswd"));

        return user;
    }
```

#### 3.通过@PathVariable获取路径中的参数

```java
    @RequestMapping(value="/addUser4/{username}/{password}",method=RequestMethod.GET)
public String addUser4(@PathVariable String username,@PathVariable String password) {
        System.out.println("username is:"+username);
        System.out.println("password is:"+password);
        return "demo/index";
    }
```

### 三.页面跳转

#### 1.返回值String

```java
    //URL改变为greeting
	@RequestMapping(value="/doRedirect")
    public String doRedirect() {
    	System.out.println("hyz");
        return "redirect:greeting";
    }
    //URL不变,依然doRedirect
    @RequestMapping(value="/doRedirect")
    public String doRedirect() {
    	System.out.println("hyz");
        return "forward:greeting";
    }
```

#### 2.返回值ModelAndView

```java
return new ModelAndView("redirect:test.jsp");
return new ModelAndView("forward:test.jsp");
```

### 四.返回Json的三种方法

1、第一种方式是spring2时代的产物，也就是每个json视图controller配置一个Jsoniew**(删除预定)**

2、第二种使用JSON工具将对象序列化成json，常用工具Jackson，fastjson，gson。设置于HttpServletResponse返回

3、第三种利用spring mvc3的注解@ResponseBody

## 第八章 使用SpringWebFlow

## 第九章 保护Web应用

