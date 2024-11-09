package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.services.IUserService;
import vn.iotstar.services.implement.UserService;

@WebServlet(urlPatterns = { "/forgotpassword" })
public class ForgotPasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IUserService service = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("views/ForgotPassword.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Mã hóa bằng tiếng việt
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		// Lấy tham số từ view
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String repeatPassword = req.getParameter("repeatPassword");

		// biến kiểm tra đổi mật khẩu thành công hay thất bại
		String alertMsg = "";

		if (username.isEmpty() || password.isEmpty() || repeatPassword.isEmpty()) {
			alertMsg = "Thông tin phải được nhập đầy đủ";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/ForgotPassword.jsp").forward(req, resp);
			return;
		}
		if (!password.equals(repeatPassword)) {
			alertMsg = "Mật khẩu xác nhận không khớp";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/ForgotPassword.jsp").forward(req, resp);
			return;
		}
		// Xử lý bài toán
//		UserModel user = service.updatePassword(username, password);
//		if (user != null) {
//			resp.sendRedirect(req.getContextPath() + "/login");
//		} else {
//			alertMsg = "Tài khoản không đúng";
//			req.setAttribute("alert", alertMsg);
//			req.getRequestDispatcher("/views/ForgotPassword.jsp").forward(req, resp);
//		}
	}
}
