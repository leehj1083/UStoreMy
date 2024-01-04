package com.ustore.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.ustore.member.dto.MemberDto;

@Mapper
public interface MemberDao {

	int joinnum(HashMap<String, String> params);

	int joinbis(HashMap<String, String> params);

	int cusnum(HashMap<String, String> params);

	ArrayList<HashMap<String, String>> listall(int pageState);

	HashMap<String, String> detail(int idx);

	ArrayList<HashMap<String, String>> cussearch(String keyword, int state);

	HashMap<String, String> update(int idx);

	int updatesave(HashMap<String, String> params);

	int del(int idx);

	int newdate(int idx);

	HashMap<String, String> filefind(int idx);

	ArrayList<HashMap<String, String>> productlistcall(int memberidx, String startdate, String enddate);
	

}
