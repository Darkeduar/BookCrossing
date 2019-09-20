package com.github.darkeduar.author;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/authors")
public class AuthorController {

    private AuthorService authorService;

    @Autowired
    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping("/create")
    public String createAuthorForm(Model model){
        model.addAttribute("author", new AuthorDto());
        return "add_author";
    }

    @PostMapping("/create")
    public String createAuthor(@RequestParam("firstName")String firstName, @RequestParam("firstName")String lastName){
        AuthorDto authorDto = new AuthorDto();
        authorDto.setFirstName(firstName);
        authorDto.setLastName(lastName);
        authorService.createAuthor(authorDto);
        return "redirect:/home";
    }
}
