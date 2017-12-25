package com.example.filmsservice.controller;

import com.example.filmsservice.model.entities.Actor;
import com.example.filmsservice.model.ActorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value = "/api")
@CrossOrigin("*")
public class ActorController {

    private final ActorRepository actorRepository;

    @Autowired
    public ActorController(ActorRepository actorRepository) {
        this.actorRepository = actorRepository;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/actor")
    public List<Actor> findAll() {
        return actorRepository.findAll(Sort.by("name"));
    }

    @RequestMapping(method = RequestMethod.GET, value = "/actor/{id}")
    public Optional<Actor> findById(@PathVariable String id) {
        return actorRepository.findById(id);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/actor/search")
    public List<Actor> findByName(@RequestParam String name) {
        return actorRepository.findByName(name);
    }
}
