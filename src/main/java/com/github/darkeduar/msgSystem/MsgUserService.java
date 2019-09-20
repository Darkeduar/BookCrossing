package com.github.darkeduar.msgSystem;

import com.github.darkeduar.message.Message;
import com.github.darkeduar.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class MsgUserService {

    private MsgUserRepository msgUserRepository;
    private UserRepository userRepository;


    @Autowired
    public MsgUserService(MsgUserRepository msgUserRepository, UserRepository userRepository) {
        this.msgUserRepository = msgUserRepository;
        this.userRepository = userRepository;
    }

    public void createMsg(Long senderId, Long receiverId, Message message){
        MsgUser msgUser = new MsgUser();
        msgUser.setSender(userRepository.getOne(senderId));
        msgUser.setReceiver(userRepository.getOne(receiverId));
        msgUser.setMessage(message);
        msgUserRepository.save(msgUser);
    }

    public List<MsgUser> findAllByReceiver(Long receiverId){
        return msgUserRepository.findAllByReceiverId(receiverId);
    }
    public List<MsgUser> findAllBySender(Long senderId){
        return msgUserRepository.findAllBySenderId(senderId);
    }


}
