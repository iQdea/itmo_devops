package com.example.springBootApp.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table("notes")
public class NotesModel {
    @Id
    @Column("id")
    private Long id;

    @Column("content")
    private String content;
}
