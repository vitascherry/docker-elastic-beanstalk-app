package com.example.filmsservice.model;

import com.example.filmsservice.model.entities.Genre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GenreRepository extends JpaRepository<Genre, String> {
    List<Genre> findByName(String name);
}
