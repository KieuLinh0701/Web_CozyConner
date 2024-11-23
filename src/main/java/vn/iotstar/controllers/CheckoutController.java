package vn.iotstar.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.Address;
import vn.iotstar.entity.Cart;
import vn.iotstar.entity.PaymentMethod;
import vn.iotstar.entity.User;
import vn.iotstar.services.IAddressService;
import vn.iotstar.services.ICartService;
import vn.iotstar.services.IPaymentService;
import vn.iotstar.services.implement.AddressService;
import vn.iotstar.services.implement.CartService;
import vn.iotstar.services.implement.PaymentService;
import vn.iotstar.utils.Constant;

@WebServlet(urlPatterns = { "/checkout", "/checkout/updateaddress" })
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

			IPaymentService paymentService = new PaymentService();
			List<PaymentMethod> listPayment = paymentService.findAll();
			req.setAttribute("listPayment", listPayment);

			ICartService cartService = new CartService();
			List<Cart> listCart = cartService.findByUser(user.getId());
			req.setAttribute("listCart", listCart);
			int total = 0;
			for (Cart x : listCart) {
				total = total + x.getQuantity() * x.getProduct().getPrice();
			}
			req.setAttribute("total", total);
			req.getRequestDispatcher(Constant.CHECKOUT).forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		// Mã hóa bằng tiếng việt
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		if (url.contains("checkout/updateaddress")) {
			String city = req.getParameter("city");
			String district = req.getParameter("district");
			String ward = req.getParameter("ward");
			String detail = req.getParameter("detail");
			int address_id = Integer.parseInt(req.getParameter("address_id"));
			
			IAddressService addressService = new AddressService();
			Address address = new Address(address_id, city, district, ward, detail);
			addressService.update(address);
			
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("account");
			user.setAddress(address);
			session.setAttribute("account", user);
			
			resp.sendRedirect(req.getContextPath() + "/checkout");
		}
	}

}
