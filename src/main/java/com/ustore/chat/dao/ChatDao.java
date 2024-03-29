package com.ustore.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ustore.chat.dto.ChatDto;
import com.ustore.chat.dto.ChatRoomDto;
import com.ustore.chat.dto.Participant;

@Mapper
public interface ChatDao {

	int insertChatRoom(ChatRoomDto chatRoomDto);
	int insertChatParticipants(int chatRoomIdx, String chatParticipants);
	List<ChatRoomDto> selectChatRoomList(String emp_idx);
	List<String> selectReceiveMember(String roomNum, String sender);
	int insertReceivedMsg(ChatDto chat);
	int insertSendMsg(ChatDto chat);
	List<ChatDto> selectChatHistory(int roomNum, String emp_idx);
	List<Participant> selectParticipants(int roomNum);
	int deleteParticipants(int roomNum, String name);
	void updateToRead(int roomNum, String emp_idx);
	void setRead(int roomNum, int chatIdx, String name);
	List<String> unReadUser(int roomNum, int chatIdx);
	String selectUserInfo(String userInfo);
	List<Integer> selectIndividual(String emp_idx);
	int selectIndividualRoomExsit(int i, String orderIdx);

}
