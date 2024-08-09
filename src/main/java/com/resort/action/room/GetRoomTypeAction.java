package com.resort.action.room;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.TotalDAO;

public class GetRoomTypeAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		TotalDAO dao = TotalDAO.getInstance();

		PrintWriter out = response.getWriter();

		List<String> list = dao.getRoomTypeList();
		
		if(list != null) {
			JSONArray jsonArray = new JSONArray();
			for(String type : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("type", type);
				
				jsonArray.add(jsonObject);
			}
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			out.print(jsonArray.toJSONString());
			out.flush();
		}
		
		out.close();

		return null;
	}

}
