package com.resort.action.room;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.ReservationDTO;
import com.resort.model.RoomInfoDTO;
import com.resort.model.TotalDAO;

public class CheckingScheduleAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
		StringBuilder jsonStr = new StringBuilder();
		String line;

		while ((line = reader.readLine()) != null) {
			jsonStr.append(line);
		}
		reader.close();

		JSONParser parser = new JSONParser();

		JSONObject jsonData = null;
		try {
			jsonData = (JSONObject) parser.parse(jsonStr.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String startDate = (String) jsonData.get("startDate");
		String endDate = (String) jsonData.get("endDate");

		ReservationDTO dto = new ReservationDTO();

		dto.setRes_in_date(startDate);
		dto.setRes_out_date(endDate);

		TotalDAO dao = TotalDAO.getInstance();

		PrintWriter out = response.getWriter();

		List<RoomInfoDTO> list = dao.checkScheduleRoom(dto);
		
		if(list != null) {
			JSONArray jsonArray = new JSONArray();
			for(RoomInfoDTO cont : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("type", cont.getRoom_type());
				
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
