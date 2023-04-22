package com.example.springBootApp.controller;

import com.example.springBootApp.model.NotesModel;
import com.example.springBootApp.dao.NotesRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

@RestController
public class DBController {

    private final NotesRepository notesRepository;

    @Autowired
    public DBController(NotesRepository notesRepository) {
        this.notesRepository = notesRepository;
    }

    @GetMapping("/db")
    public List<String> getNotes() {
        Iterable<NotesModel> notes = notesRepository.findAll();
        ObjectMapper objectMapper = new ObjectMapper();
        List<String> jsonObjects = new ArrayList<>();
        for (NotesModel note : notes) {
            try {
                String json = objectMapper.writeValueAsString(note);
                jsonObjects.add(json);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return jsonObjects;
    }
}
