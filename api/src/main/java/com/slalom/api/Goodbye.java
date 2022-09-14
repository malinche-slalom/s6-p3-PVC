package com.slalom.api;

public class Goodbye {
    private final long id;
    private final String content;

    public Goodbye(long id, String content) {
        this.id = id;
        this.content = content;
    }

    public long getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    @Override
    public String toString() {
        return content;
    }
}
