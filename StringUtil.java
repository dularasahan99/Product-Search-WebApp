package aiwa.util;

public class StringUtil {

	public static String toMoney(int num) {
		return String.format("%,d", num);
	}

	public static String toBR(String str) {
		return str.replace("\r\n", "<br>");

	}

	public static String toStar(double rating) {

		String stars = "";

		for (int i = 0; i < (int) rating; i++) {
			stars += "<i class='bi bi-star-fill fg-warning'></i>";
		}
		if (rating - (int) rating > 0) {
			stars += "<i class='bi bi-star-half fg-warning'></i>";
		}

		return stars;
	}
}
