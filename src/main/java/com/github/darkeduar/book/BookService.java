package com.github.darkeduar.book;

import com.github.darkeduar.author.AuthorRepository;
import com.github.darkeduar.category.CategoryRepository;
import com.github.darkeduar.image.Image;
import com.github.darkeduar.image.ImageRepository;
import com.github.darkeduar.image.ImageService;
import com.github.darkeduar.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class BookService {

    private BookRepository bookRepository;
    private AuthorRepository authorRepository;
    private CategoryRepository categoryRepository;
    private UserRepository userRepository;
    private ImageRepository imageRepository;
    private ImageService imageService;

    @Autowired
    public BookService(BookRepository bookRepository, AuthorRepository authorRepository, CategoryRepository categoryRepository, UserRepository userRepository, ImageRepository imageRepository, ImageService imageService) {
        this.bookRepository = bookRepository;
        this.authorRepository = authorRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.imageRepository = imageRepository;
        this.imageService = imageService;
    }

    public void createBook(BookDto bookDto){
        Book book = new Book();
        book.setAuthor(authorRepository.getOne(bookDto.getAuthor()));
        book.setCategory(categoryRepository.getOne(bookDto.getCategory()));
        book.setDescription(bookDto.getDescription());
        book.setIsbn(bookDto.getIsbn());
        book.setTitle(bookDto.getTitle());
        book.setUser(userRepository.getOne(bookDto.getUser()));

        Image image = imageService.addImage(bookDto.getImage());

        book.setImage(image);

        bookRepository.save(book);
    }

    public List<BookDisplayDto> getAllByUserId(Long id){
        List<Book> allByUserId = bookRepository.findAllByUserId(id);
        List<BookDisplayDto> bookDtos = new ArrayList<>();

        for (Book book : allByUserId) {
            bookDtos.add(new BookDisplayDto(book));
        }
        return bookDtos;
    }

    public BookDisplayDto getBookDetails(Long id){
        Book book = bookRepository.getOne(id);
        BookDisplayDto bookDisplayDto = new BookDisplayDto(book);
        return bookDisplayDto;
    }

    public List<BookDisplayDto> getAllByCategoryId(Long categoryId, Long bookId){
        List<Book> allByUserId = bookRepository.findAllByCategoryId(categoryId);
        List<BookDisplayDto> bookDtos = new ArrayList<>();

        for (Book book : allByUserId) {
            if (book.getId() != bookId){
                bookDtos.add(new BookDisplayDto(book));
            }

        }
        return bookDtos;
    }

    public Long getCategoryId(Long id){
        Book one = bookRepository.getOne(id);
        return one.getCategory().getId();
    }

    public List<Book> getAllBooksForExchange(){
        return bookRepository.findAllByForExchangeIsTrue();
    }

    public void updateBookStatus(Long id){
        Book book = bookRepository.getOne(id);
        book.setForExchange(true);
        bookRepository.save(book);
    }
}
