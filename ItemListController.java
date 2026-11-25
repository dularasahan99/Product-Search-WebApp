package aiwa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiwa.entity.Item;
import aiwa.model.ItemModel;

@WebServlet("/ItemListController")
public class ItemListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.PARAMETER
		String word = request.getParameter("Keyword");
		if (word == null) {
			word = "";
		}
		String priceMin = request.getParameter("pricemin");
		if (priceMin == null || priceMin.equals("")) {
			priceMin = "0";
		}
		String priceMax = request.getParameter("pricemax");
		if (priceMax == null || priceMax.equals("")) {
			priceMax = "0";
		}

		//2.MODEL
		ItemModel im = new ItemModel();
		ArrayList<Item> items = im.findByCondition(getServletContext(), word, Integer.parseInt(priceMin),
				Integer.parseInt(priceMax));

		//3.VIEW
		request.setAttribute("items", items);
		request.setAttribute("word", word);

		request.setAttribute("pricemin", Integer.parseInt(priceMin));
		request.setAttribute("pricemax", Integer.parseInt(priceMax));

		request.getRequestDispatcher("/itemListView.jsp").forward(request, response);

	}

}
