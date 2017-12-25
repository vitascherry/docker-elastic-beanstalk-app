package com.example.filmsservice.model;

import javax.persistence.*;
import java.util.List;
import java.util.stream.Collectors;

@Entity
@Table(name="film")
public class Film {

    @Id
    private String id;

    private String name;
    private int year;
    private String director;
    private int rating;

    @ManyToMany
    @JoinTable(name = "cast",
            joinColumns=@JoinColumn(name = "id_film"),
            inverseJoinColumns = @JoinColumn(name = "id_actor"))
    private List<Actor> actors;

    @ManyToMany
    @JoinTable(name = "film_genre",
            joinColumns=@JoinColumn(name = "id_film"),
            inverseJoinColumns = @JoinColumn(name = "id_genre"))
    private List<Genre> genres;

    @OneToMany(mappedBy = "film",cascade = CascadeType.ALL)
    private List<Comment> comments;

    public Film apply(Film src) {
        this.name = src.name;
        this.year = src.year;
        this.director = src.director;
        this.rating = src.rating;
        this.actors = src.actors;
        this.genres = src.genres;
        this.comments = src.comments.stream()
                .peek(comment -> {
                    if(comment.getId() == null)
                        comment.setId(String.valueOf(System.currentTimeMillis()));
                    comment.setFilm(this);
                })
                .collect(Collectors.toList());
        return this;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public List<Actor> getActors() {
        return actors;
    }

    public void setActors(List<Actor> actors) {
        this.actors = actors;
    }

    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public List<Comment> getComments() {
        comments.sort(Comment.getLatestFirstComparator());
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
