package com.example.springBootApp.dao;

import com.example.springBootApp.model.NotesModel;
import org.springframework.data.repository.CrudRepository;

public interface NotesRepository extends CrudRepository<NotesModel, Long> {
}
