package com.github.darkeduar.book;

import com.github.darkeduar.author.Author;
import com.github.darkeduar.author.AuthorService;
import com.github.darkeduar.category.Category;
import com.github.darkeduar.category.CategoryService;
import com.github.darkeduar.image.ImageService;
import com.github.darkeduar.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {

    private BookService bookService;
    private UserService userService;
    private CategoryService categoryService;
    private AuthorService authorService;
    private ImageService imageService;


    @Autowired
    public BookController(BookService bookService, UserService userService, CategoryService categoryService, AuthorService authorService, ImageService imageService) {
        this.userService = userService;
        this.bookService = bookService;
        this.categoryService = categoryService;
        this.authorService = authorService;
        this.imageService = imageService;
    }

    @ModelAttribute("categories")
    public List<Category> categoryList(){
        return categoryService.getAllCategories();
    }

    @ModelAttribute("authors")
    public List<Author> authorList(){
        return authorService.getAllAuthors();
    }

    @GetMapping("/addBook")
    public String addBookForm(Model model){
        model.addAttribute("book", new BookDto());
        return "add_book";
    }

    @PostMapping("/addBook")
    public String createBook(@ModelAttribute BookDto bookDto, @RequestParam("dupa") MultipartFile multipartFile, HttpServletRequest request) throws IOException {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        bookDto.setUser(userService.getUserIdByEmail(email));
        imageService.uploadImage(multipartFile, request);
        bookDto.setImage(multipartFile.getOriginalFilename());
        bookService.createBook(bookDto);
        return "redirect:/home";
    }

    @GetMapping("/getAll")
    public List<BookDisplayDto> getAllBooks(){
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        return bookService.getAllByUserId(userService.getUserIdByEmail(email));
    }

    @GetMapping("/details/{id}")
    public String getBookDetails(@PathVariable("id")Long id,Model model){
        model.addAttribute("bookList", bookService.getAllByCategoryId(bookService.getCategoryId(id), id));
        model.addAttribute("book", bookService.getBookDetails(id));
        return "book_details";
    }

    @GetMapping("/forExchange")
    public String getAllBooksForExchange(Model model){
        model.addAttribute("books",bookService.getAllBooksForExchange());
        return "books_for_exchange";
    }

    @PostMapping("/exchange/{id}")
    public String changeBookStatusToExchange(@PathVariable("id")Long id, RedirectAttributes redirectAttributes){
        bookService.updateBookStatus(id);
        redirectAttributes.addFlashAttribute("message", "Book set for exchange :)");
        return "redirect:/books/details/" + id;
    }

}
