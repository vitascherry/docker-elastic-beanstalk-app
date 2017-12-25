package com.example.filmsservice.model;

import com.example.filmsservice.model.entities.Actor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActorRepository extends JpaRepository<Actor, String> {
    List<Actor> findByName(String name);
}
