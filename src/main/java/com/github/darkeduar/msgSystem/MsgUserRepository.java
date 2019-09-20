package com.github.darkeduar.msgSystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MsgUserRepository extends JpaRepository<MsgUser, Long> {

    List<MsgUser> findAllByReceiverId(Long receiverId);
    List<MsgUser> findAllBySenderId(Long senderId);

}
