package com.example.filmsservice.controller;

import com.example.filmsservice.model.entities.Genre;
import com.example.filmsservice.model.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping(value = "/api")
@CrossOrigin("*")
public class GenreController {

    private final GenreRepository genreRepository;

    @Autowired
    public GenreController(GenreRepository genreRepository) {
        this.genreRepository = genreRepository;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/genre")
    public List<Genre> findAll() {
        return genreRepository.findAll(Sort.by("name"));
    }

    @RequestMapping(method = RequestMethod.GET, value = "/genre/{id}")
    public Optional<Genre> findById(@PathVariable String id) {
        return genreRepository.findById(id);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/genre/search")
    public List<Genre> findByName(@RequestParam String name) {
        return genreRepository.findByName(name);
    }
}
