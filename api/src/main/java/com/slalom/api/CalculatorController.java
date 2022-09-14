package com.slalom.api;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class CalculatorController {

    private final AtomicLong counter = new AtomicLong();

    int x1 = 0, x2 = 0;

//    @GetMapping("/calculator")
//    public String result(@RequestParam(value = "number1" , defaultValue = "0") int x1, @RequestParam(value = "number2" , defaultValue = "0") int x2){
//        return "The total is: " + String.valueOf(x1+x2) + ".";
//    }
    @GetMapping("/calculator")
    public Calculation calculation(@RequestParam(value = "number1" , defaultValue = "0") int x1, @RequestParam(value = "number2" , defaultValue = "0") int x2) {
        return new Calculation(counter.incrementAndGet(), x1+x2);
    }

}
