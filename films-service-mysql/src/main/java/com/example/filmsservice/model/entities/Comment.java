package com.example.filmsservice.model.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Comparator;

@Entity
@Table(name="comment")
public class Comment {
    @Id
    private String id;

    @ManyToOne
    @JoinColumn(name = "id_film")
    @JsonIgnore
    private Film film;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss", timezone = "UTC")
    private LocalDateTime posted;

    private String author;
    private String text;

    private static Comparator<Comment> latestFirst = Comparator.comparing(Comment::getPosted).reversed();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public LocalDateTime getPosted() {
        return posted;
    }

    public void setPosted(LocalDateTime posted) {
        this.posted = posted;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public static Comparator<Comment> getLatestFirstComparator() {
        return latestFirst;
    }
}
