package com.github.darkeduar;

import com.github.darkeduar.book.BookDisplayDto;
import com.github.darkeduar.book.BookService;
import com.github.darkeduar.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


@Controller
public class ViewController {
    private BookService bookService;
    private UserService userService;

    @Autowired
    public ViewController(BookService bookService, UserService userService) {
        this.bookService = bookService;
        this.userService = userService;
    }

    @GetMapping("/home")
    public String loginSuccess(Model model){
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
//        model.addAttribute("username", name);
        model.addAttribute("books",bookService.getAllByUserId(userService.getUserIdByEmail(name)));
        return "user_dash";
    }

    @GetMapping("/")
    public String loginPage() {
        return "landing_page";
    }



}
