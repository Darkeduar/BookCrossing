package com.github.darkeduar.user;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/api/users")
public class UserController {

    private Logger LOG = LoggerFactory.getLogger(UserController.class);
    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping
    public String createUser(@RequestParam("email") String email,@RequestParam("password") String password, RedirectAttributes redirectAttributes){
        UserDto userDto = new UserDto();
        userDto.setEmail(email);
        userDto.setPassword(password);
        userService.createUser(userDto);
        redirectAttributes.addFlashAttribute("message", "Zarejestrowano pomyślnie :)");
        return "redirect:http://localhost:8080/";
    }

    @GetMapping("/{uuid}/enable")
    @ResponseBody
    public String enableUser(@PathVariable String uuid) {
        userService.enableUser(uuid);
        return "Konto aktywowane!";
    }

}
