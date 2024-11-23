package vn.iotstar.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.mail.Address;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.Cart;
import vn.iotstar.entity.User;
import vn.iotstar.services.ICartService;
import vn.iotstar.services.implement.CartService;
import vn.iotstar.utils.Constant;

@WebServlet(urlPatterns = { "/checkout"})
public class CheckoutController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public ICartService cartService = new CartService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		if (url.contains("checkout")) {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("account");
			req.setAttribute("user", user);
			//Address address = findByAddressId(user.getAddress().getAddress_id());
			req.getRequestDispatcher(Constant.CHECKOUT).forward(req, resp);
		}
		
	}

}
