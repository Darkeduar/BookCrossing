package com.github.darkeduar.msgSystem;

import com.github.darkeduar.message.Message;
import com.github.darkeduar.user.User;

import javax.persistence.*;

@Entity
@Table(name = "messages_users")
public class MsgUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne(cascade = {CascadeType.ALL})
    private Message message;
    @OneToOne(cascade = {CascadeType.ALL})
    private User sender;
    @OneToOne(cascade = {CascadeType.ALL})
    private User receiver;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }
}

