module com.example.springBootApp {
    requires spring.boot;
    requires spring.boot.autoconfigure;
    requires spring.boot.starter.thymeleaf;
    requires spring.boot.starter.web;
    requires spring.boot.starter.data.jdbc;
    requires java.sql;
    requires com.fasterxml.jackson.databind;
    requires com.fasterxml.jackson.core;
    requires lombok;

    exports com.example.springBootApp;
    exports com.example.springBootApp.controller;
    exports com.example.springBootApp.model;
}