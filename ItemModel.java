package aiwa.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import aiwa.entity.Item;

public class ItemModel {

	public Item findByid(ServletContext context, int id) {

		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/lib/webapp05.db"));

			String sql = "select * from items where itemid=?";
			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("itemid"));
				item.setItemName(rs.getString("itemname"));
				item.setPrice(rs.getInt("price"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImage(rs.getString("image"));
				item.setYoutube(rs.getString("Youtube"));

				conn.close();

				return item;
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public ArrayList<Item> findByCondition(ServletContext context, String word, int priceMin, int priceMax) {
		ArrayList<Item> items = new ArrayList<Item>();

		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/lib/webapp05.db"));
			String sql = "select*from items where (itemname like? or detail like?)";
			if (priceMin > 0) {
				sql += "and price >=?";
			}
			if (priceMax > 0) {
				sql += "and price <=?";
			}
			PreparedStatement stmt = conn.prepareStatement(sql);

			int index = 1;

			stmt.setString(index++, "%" + word + "%");
			stmt.setString(index++, "%" + word + "%");

			if (priceMin > 0) {
				stmt.setInt(index++, priceMin);
			}
			if (priceMax > 0) {
				stmt.setInt(index++, priceMax);
			}
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("itemid"));
				item.setItemName(rs.getString("itemname"));
				item.setPrice(rs.getInt("price"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImage(rs.getString("image"));
				item.setYoutube(rs.getString("Youtube"));
				items.add(item);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return items;
	}
}
