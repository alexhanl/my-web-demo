package com.example.mywebdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
@RestController
public class MyWebDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyWebDemoApplication.class, args);
    }


    @GetMapping("/hello")
    public String sayHello(@RequestParam(value = "myName", defaultValue = "World") String name) {
        return String.format("Hello %s!", name);
    }

    @GetMapping("/slowresponse")
    public String slowResponse(@RequestParam(value = "waitFor", defaultValue = "1") String waitFor)  {
        try {
            Thread.sleep(Integer.parseInt(waitFor) * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println(String.format("I was instructed to wait for %s seconds before return.", waitFor));
        return String.format("The application waited for %s seconds before return!", waitFor);
    }
}
