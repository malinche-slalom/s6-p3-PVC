package com.slalom.api;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GoodbyeController {

    private static final String template = "Goodbye, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/goodbye")
    //test this via http://localhost:8080/goodbye and http://localhost:8080/goodbye?name=Kesha
    public Goodbye goodbye(@RequestParam(value = "name", defaultValue = "World") String name) {
        return new Goodbye(counter.incrementAndGet(), String.format(template, name));
    }
}