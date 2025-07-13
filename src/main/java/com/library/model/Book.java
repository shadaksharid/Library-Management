package com.library.model;

public class Book {
	private int id;
    private String title;
    private String author;
    private String genre;
    private String isbn;
    private int year;
    private boolean available;
    private String coverImage;
    private int copies;
    
    public int getId() {
    	return id;
    }
    public void setId(int id) {
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
    
    public String getGenre() {
    	return genre;
    }
    public void setGenre(String genre) {
    	this.genre = genre;
    }
    
    public String getIsbn() {
    	return isbn;
    }
    public void setIsbn(String isbn) {
    	this.isbn = isbn;
    }
    
    public int getYear() {
    	return year;
    }
    public void setYear(int year) {
    	this.year = year;
    }
    
    public boolean getAvailable() {
    	return available;
    }
    public void setAvailable(boolean available) {
    	this.available = available;
    }
    
    public String getCoverImage() {
        return coverImage;
    }
    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }
    
    public int getCopies() {
        return copies;
    }
    public void setCopies(int copies) {
        this.copies = copies;
    }

}
