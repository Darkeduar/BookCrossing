package com.github.darkeduar.message;

import com.github.darkeduar.msgSystem.MsgUserService;
import com.github.darkeduar.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/messages")
public class MessageController {

    private UserService userService;
    private MsgUserService msgUserService;
    private MessageService messageService;

    @Autowired
    public MessageController(UserService userService, MsgUserService msgUserService, MessageService messageService) {
        this.userService = userService;
        this.msgUserService = msgUserService;
        this.messageService = messageService;
    }

    @GetMapping("/create/{id}")
    public String createMessage(@PathVariable("id")Long id, Model model){
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addAttribute("sender", userService.getOneById(userService.getUserIdByEmail(name)));
        model.addAttribute("receiver", userService.getOneById(id));
        model.addAttribute("msg", new Message());
        return "send_msg";
    }

    @PostMapping("/send/{senderId}/{receiverId}")
    public String sendMessage(@PathVariable("senderId")Long senderId,
                              @PathVariable("receiverId")Long receiverId,
                              @ModelAttribute Message message){
        msgUserService.createMsg(senderId, receiverId, message);
        messageService.createMessage(message);
        return "redirect:http://localhost:8080";
    }

    @GetMapping("/all")
    public String getAllMessages(Model model){
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addAttribute("received", msgUserService.findAllByReceiver(userService.getUserIdByEmail(name)));
        model.addAttribute("sent", msgUserService.findAllBySender(userService.getUserIdByEmail(name)));
        return "messages";
    }
}
