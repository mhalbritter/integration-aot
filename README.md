# Integration AOT bug reproducer

`./build-and-run.sh`:

```
org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'errorChannel': Instantiation of supplied bean failed
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.obtainInstanceFromSupplier(AbstractAutowireCapableBeanFactory.java:1234) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.obtainFromSupplier(AbstractAutowireCapableBeanFactory.java:1209) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1156) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:566) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:526) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:326) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:324) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:200) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:930) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:926) ~[spring-context-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:592) ~[spring-context-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:729) ~[spring-boot-3.0.0-SNAPSHOT.jar!/:3.0.0-SNAPSHOT]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:428) ~[spring-boot-3.0.0-SNAPSHOT.jar!/:3.0.0-SNAPSHOT]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:310) ~[spring-boot-3.0.0-SNAPSHOT.jar!/:3.0.0-SNAPSHOT]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1301) ~[spring-boot-3.0.0-SNAPSHOT.jar!/:3.0.0-SNAPSHOT]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1290) ~[spring-boot-3.0.0-SNAPSHOT.jar!/:3.0.0-SNAPSHOT]
	at com.example.integrationaot.IntegrationAotApplication.main(IntegrationAotApplication.java:10) ~[classes!/:0.0.1-SNAPSHOT]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[na:na]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77) ~[na:na]
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[na:na]
	at java.base/java.lang.reflect.Method.invoke(Method.java:568) ~[na:na]
	at org.springframework.boot.loader.MainMethodRunner.run(MainMethodRunner.java:49) ~[integration-aot-0.0.1-SNAPSHOT.jar:0.0.1-SNAPSHOT]
	at org.springframework.boot.loader.Launcher.launch(Launcher.java:95) ~[integration-aot-0.0.1-SNAPSHOT.jar:0.0.1-SNAPSHOT]
	at org.springframework.boot.loader.Launcher.launch(Launcher.java:58) ~[integration-aot-0.0.1-SNAPSHOT.jar:0.0.1-SNAPSHOT]
	at org.springframework.boot.loader.JarLauncher.main(JarLauncher.java:65) ~[integration-aot-0.0.1-SNAPSHOT.jar:0.0.1-SNAPSHOT]
Caused by: java.lang.IllegalArgumentException: Object of class [java.lang.Boolean] must be an instance of boolean
	at org.springframework.util.Assert.instanceCheckFailed(Assert.java:702) ~[spring-core-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.util.Assert.isInstanceOf(Assert.java:602) ~[spring-core-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.util.Assert.isInstanceOf(Assert.java:633) ~[spring-core-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.aot.AutowiredArguments.get(AutowiredArguments.java:45) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.integration.channel.PublishSubscribeChannel__BeanDefinitions.lambda$getErrorChannelInstance$0(PublishSubscribeChannel__BeanDefinitions.java:31) ~[classes!/:0.0.1-SNAPSHOT]
	at org.springframework.util.function.ThrowingFunction.apply(ThrowingFunction.java:63) ~[spring-core-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.util.function.ThrowingFunction.apply(ThrowingFunction.java:51) ~[spring-core-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.beans.factory.aot.AutowiredInstantiationArgumentsResolver.resolve(AutowiredInstantiationArgumentsResolver.java:156) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	at org.springframework.integration.channel.PublishSubscribeChannel__BeanDefinitions.getErrorChannelInstance(PublishSubscribeChannel__BeanDefinitions.java:31) ~[classes!/:0.0.1-SNAPSHOT]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.obtainInstanceFromSupplier(AbstractAutowireCapableBeanFactory.java:1223) ~[spring-beans-6.0.0-SNAPSHOT.jar!/:6.0.0-SNAPSHOT]
	... 25 common frames omitted
```
