package com.example.springBootApp.controller;

import com.example.springBootApp.dao.NotesRepository;
import com.example.springBootApp.model.NotesModel;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class DBController {

    private final NotesRepository notesRepository;

    public DBController() {
        this.notesRepository = null; // or some default value
    }

    @GetMapping("/db")
    public Iterable<NotesModel> getStrings() {
        return notesRepository.findAll();
    }
}
