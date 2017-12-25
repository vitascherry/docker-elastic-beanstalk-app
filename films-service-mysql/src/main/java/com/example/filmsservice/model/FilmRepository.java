package com.example.filmsservice.model;

import com.example.filmsservice.model.entities.Film;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FilmRepository extends JpaRepository<Film, String> {

    List<Film> findByName(String name);
}
