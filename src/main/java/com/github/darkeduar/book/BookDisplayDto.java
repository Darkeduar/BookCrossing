package com.github.darkeduar.book;

public class BookDisplayDto {

    private Long id;
    private String title;
    private String author;
    private String isbn;
    private String description;
    private String user;
    private String category;
    private String image;

    public BookDisplayDto() {
    }

    public BookDisplayDto(Book that) {
        this.id = that.getId();
        this.title = that.getTitle();
        this.author = that.getAuthor().getFullName();
        this.isbn = that.getIsbn();
        this.description = that.getDescription();
        this.user = that.getUser().getEmail();
        this.category = that.getCategory().getName();
        this.image = that.getImage().getName();

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
