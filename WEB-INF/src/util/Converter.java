package util;

public class Converter {
	public static String getParam(String param) {
		return (param != null) ? param : "";
	}

	public static String getColorForInquiryList (String inquiryname) {
		switch (inquiryname) {
		case "料金・お支払いについて":
			return "#ff7f7f";
		case "講座・コース・教材について":
			return "#ff7fff";
		case "学習の進め方について":
			return "#7f7fff";
		case "受講期間について":
			return "#7fffff";
		case "受講終了後のサポートについて":
			return "#7fff7f";
		case "その他お問い合わせ":
			return "#ffbf7f";
		case "返信":
			return "#ff0000";
		}
		return "";
	}

	public static String convertInquiryname (String inquiryname) {
		switch (inquiryname) {
		case "料金・お支払いについて":
			return "料金";
		case "講座・コース・教材について":
			return "講座";
		case "学習の進め方について":
			return "学習";
		case "受講期間について":
			return "受講期間";
		case "受講終了後のサポートについて":
			return "サポート";
		case "その他お問い合わせ":
			return "その他";
		}
		return "";
	}
}
