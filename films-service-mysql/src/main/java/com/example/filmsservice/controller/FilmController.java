package com.example.filmsservice.controller;

import com.example.filmsservice.model.*;
import com.example.filmsservice.model.entities.Film;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value = "/api")
@CrossOrigin("*")
public class FilmController {

    private final FilmRepository filmRepository;

    @Autowired
    public FilmController(FilmRepository filmRepository) {
        this.filmRepository = filmRepository;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/film")
    public List<Film> findAll() {
        return filmRepository.findAll(Sort.by("name"));
    }

    @RequestMapping(method = RequestMethod.GET, value = "/film/{id}")
    public Optional<Film> findById(@PathVariable String id) {
        return filmRepository.findById(id);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/film/search")
    public List<Film> findByName(@RequestParam String name) {
        return filmRepository.findByName(name);
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/film")
    public Film insert(@RequestBody Film src) {
        return filmRepository.save(src);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/film/{id}")
    public Film update(@PathVariable String id, @RequestBody Film src) {
        Optional<Film> old = filmRepository.findById(id);
        return filmRepository.save(old.map(a -> a.apply(src)).orElse(src));
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/film/{id}")
    public void delete(@PathVariable String id) {
        filmRepository.deleteById(id);
    }

}
