package com.github.darkeduar.author;

import com.github.darkeduar.book.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AuthorService {
    private AuthorRepository authorRepository;
    private BookRepository bookRepository;

    @Autowired
    public AuthorService(AuthorRepository authorRepository, BookRepository bookRepository) {
        this.authorRepository = authorRepository;
        this.bookRepository = bookRepository;
    }

    public void createAuthor(AuthorDto authorDto){
        Author author = new Author();
        author.setFirstName(authorDto.getFirstName());
        author.setLastName(authorDto.getLastName());
//        long[] booksId = authorDto.getBooks();
//        Set<Book> books = new HashSet<>();
//
//        for (long l : booksId) {
//            books.add(bookRepository.getOne(l));
//        }
//        author.setBooks(books);

        authorRepository.save(author);
    }

    public List<Author> getAllAuthors(){
        return authorRepository.findAll();
    }
}
