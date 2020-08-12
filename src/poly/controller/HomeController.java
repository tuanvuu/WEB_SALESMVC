
package poly.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;

import java.io.File;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.jws.soap.SOAPBinding.Use;
import javax.mail.internet.MimeMessage;
import javax.persistence.TypedQuery;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.smartcardio.Card;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import poly.bean.Email;
import poly.entity.*;
import poly.services.MailServices;
import poly.services.MailServicesImpl;

@Controller
@Transactional
public class HomeController {
	@Autowired
	SessionFactory factory;
	private MailServices mailer;

	ServletContext context;
	Integer cId, pId, pNum, cPage, cPageKM;
	String URL;
	String adminURL;
	User userLogin = null;
	User adminLogin = null;
	Cart cartUser = null;

	public boolean checkPhoneNumber(String number) {
		Pattern pattern = Pattern.compile("^[0-9]*$");
		Matcher matcher = pattern.matcher(number);
		if (!matcher.matches()) {
			return false;
		} else {
			if (number.length() != 10) {
				return false;
			} else {
				if (!number.startsWith("03") && !number.startsWith("05") && !number.startsWith("07")
						&& !number.startsWith("08") && !number.startsWith("09")) {
					return false;
				}
			}
		}
		return true;
	}

	public User checkEmail(String email) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM User WHERE email = :email");
			query.setString("email", email);
			User obj = (User) query.uniqueResult();
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public User checkusername(String username) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("form User where username = :username");
			query.setString("username", "username");
			User login = (User) query.uniqueResult();
			transaction.commit();
			return login;
		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
		} finally {
			session.close();
		}

		return null;
	}

	@ModelAttribute("cartUser")
	public Cart getUserCart() {

		return cartUser;
	}

	@ModelAttribute("userLogin")
	public User getUserLogin() {
		return userLogin;
	}

	@ModelAttribute("adminLogin")
	public User getAdminLogin() {
		return adminLogin;
	}

	@ModelAttribute("URL")
	public String getBaseURL() {
		return URL;
	}

	@ModelAttribute("adminURL")
	public String getAdminURL() {
		return adminURL;
	}

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String viewSingOut(ModelMap model) {
		model.addAttribute("dangki", new User());
		return "signup";
	}

	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String dosignout(ModelMap model, @ModelAttribute("dangki") User user, BindingResult errors) {
		if (checkEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "user", "Tên email đã tồn tại!");
		}
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập email !");
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Vui lòng nhập mật khẩu  !");
		}
		if (user.getAdress().trim().length() == 0) {
			errors.rejectValue("adress", "user", "Vui lòng nhập địa chỉ của bạn !");
		}
		if (!errors.hasErrors()) {
			Session session2 = factory.openSession();
			Transaction k = session2.beginTransaction();
			try {

				session2.save(user);

				model.addAttribute("message", "Tạo tài khoản thành công");
				userLogin = user;
				Cart cart = new Cart();
				cart.setUser(user);
			

				session2.save(cart);

				k.commit();
			} catch (Exception e) {
				k.rollback();
				model.addAttribute("message", "Tạo tài khoản thất bại !");
			} finally {
				session2.close();

			}

		}
		return "signup";
	}

	

	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public String signOut(ModelMap model) {
		userLogin = null;
		return "redirect:/index/1/1.htm";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String viewLogin(ModelMap model) {
		model.addAttribute("login", new User());
		return "login";
	}

	@RequestMapping(value = "editPassword/{id}", method = RequestMethod.GET)
	public String vieweditPW(ModelMap model, @PathVariable("id") Integer id) {
		model.addAttribute("editPass", userLogin);
		System.out.println(userLogin.getEmail());
		return "edit-password";
	}

	@RequestMapping(value = "editPassword/{id}", method = RequestMethod.POST)
	public String vieweditPW(ModelMap model, @PathVariable("id") Integer id, @ModelAttribute("editPass") User user,
			HttpServletRequest request, BindingResult errors) {
		String pass = "";
		String newPass = "";
		String confirmPass = "";
		pass = request.getParameter("pass");
		newPass = request.getParameter("newPass");
		confirmPass = request.getParameter("confirmPass");

		if (pass.isEmpty()) {
			model.addAttribute("msg1", "Vui lòng nhập mật khẩu cũ !");
		}
		if (newPass.isEmpty()) {
			model.addAttribute("msg2", "Vui lòng nhập mật khẩu mới !");
		}
		if (confirmPass.isEmpty()) {
			model.addAttribute("msg3", "Vui lòng xác nhận lại mật khẩu !");
		}

		if (!newPass.equals(confirmPass)) {
			model.addAttribute("msg3", " Xác nhận mật khẩu không đúng, Kiểm tra lại");
			return "edit-password";
		}
		if (!pass.equals(user.getPassword())) {
			errors.rejectValue("password", "user", " Mật khẩu cũ không chính xác, kiểm tra lại");
			System.out.println(user.getPassword());
		}
		if (!pass.isEmpty() && newPass.isEmpty() && confirmPass.isEmpty()) {
			pass = user.getPassword();
			System.out.println(user.getPassword());
		}
		if (!pass.isEmpty() && !newPass.isEmpty() && !confirmPass.isEmpty()) {
			pass = newPass;
		}
		if (!errors.hasErrors()) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				user.setPassword(pass);
				session.update(user);
				t.commit();
				model.addAttribute("message", "Thay đổi mật khẩu thành công !");

			} catch (Exception e) {
				System.out.println(e.toString());
				t.rollback();
				model.addAttribute("message", "Thay đổi mật khẩu thất bại !\n" + e.toString());
			} finally {
				session.close();
			}

		}

		return "edit-password";
	}

	// phuong thuc kiem tra dang nhap dung hay khong
	public User login(String email, String password) {
		Session session = factory.openSession();
		Transaction t = null;
		try {
			t = session.beginTransaction();
			String hql = "FROM User WHERE email = :email AND password = :password";
			Query query = session.createQuery(hql);
			query.setString("email", email);
			query.setString("password", password);
			User user = (User) query.uniqueResult();
			t.commit();
			return user;

		} catch (Exception e) {
			if (t != null) {
				System.out.println(e.toString());
				t.rollback();
			}
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}

		return null;
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String doLogin(ModelMap model, @ModelAttribute("login") User user, BindingResult errers) {


		User us = login(user.getEmail(), user.getPassword());

		if (us == null) {
			model.addAttribute("login", new User());
			model.addAttribute("message", "Tên tài khoản hoặc mật khẩu không chính xác !");
			// model.addAttribute("result", false);
			return "login";
		} else {

			if (us.getEmail().trim().length() == 0) {
				errers.rejectValue("email", "user", "Email không được bỏ trống !");

			}
			if (us.getPassword().trim().length() == 0) {
				errers.rejectValue("password", "user", "Mật khẩu không được bỏ trống !");

			}

			else {

				if (us.getRoleid() == 1) {
					adminLogin = us;
					userLogin = us;
				} else {
					userLogin = us;
				}
				// model.addAttribute("result", true);
			}
		}
		if (URL.equals("preview-1")) {
			return "redirect:/preview-1/" + pNum + ".htm";
		}
		if (URL.equals("index")) {
			return "redirect:/index/" + cPage + "/" + cPageKM + ".htm";
		}
		if (URL.equals("category")) {
			return "redirect:/category/" + cId + "/" + pId + ".htm";
		}

		return "redirect:/index/1/1.htm";
	}

	@RequestMapping(value = "information/{id}", method = RequestMethod.GET)
	public String editUser(ModelMap model, @PathVariable("id") Integer id) {
		model.addAttribute("edituser", userLogin);
		return "information";
	}

	@RequestMapping(value = "information/{id}", method = RequestMethod.POST)
	public String editUser(ModelMap model, @PathVariable("id") Integer id, @ModelAttribute("edituser") User user,
			@PathVariable("photo") MultipartFile photo, HttpServletRequest request) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		context = request.getSession().getServletContext();

		try {
			if (!photo.isEmpty()) {
				String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				user.setAvarta(photo.getOriginalFilename());

			}

			session.update(user);
			t.commit();
			model.addAttribute("message", "Chỉnh sửa thành công");

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Chỉnh sửa thất bại");
		} finally {
			session.close();
		}

		return "information";
	}
	// kiem tra gio hàng

	@RequestMapping("checkout")
	public String cart(ModelMap model) {
		URL = "checkout";

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
//				cart.setName(userLogin.getFullname());
//
//				cart.setAddress(userLogin.getAdress());
//				cart.setPhone(userLogin.getPhone());
//				cart.setEmail(userLogin.getEmail());
				// cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> listCartItem = getCartItems(cart.getId());
				if (listCartItem == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", listCartItem);
				}
			}
		}

		return "checkout";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String checkout(ModelMap model, @ModelAttribute("cart") Cart c, BindingResult errors) {
		if (!checkPhoneNumber(c.getPhone())) {
			errors.rejectValue("phone", "cart", "Số điện thoại phải hợp lệ");
		}
		if (errors.hasErrors()) {
			return "redirect:/checkout.htm";
		} else 	{
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.saveOrUpdate(c);
				t.commit();
			} catch (Exception e) {
				System.out.println(e.toString());

				t.rollback();
			} finally {
				session.flush();
				session.close();
			}
			return "redirect:/thanhtoan.htm";
		}

	}

	@RequestMapping(value = "thanhtoan", method = RequestMethod.GET)
	public String payment(ModelMap model) {
		URL = "thanhtoan";

		// model.addAttribute("baseURL", baseURL);

		// model.addAttribute("cartItem", new CartItem());
		// model.addAttribute("userLogin", userLogin);

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}
		return "thanhtoan";
	}

	@RequestMapping(value = "thanhtoan", method = RequestMethod.POST)
	public String payment(ModelMap model, @ModelAttribute("cart") Cart c) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			c.setBuyDate(new Date());
			session.saveOrUpdate(c);
			Cart cart = new Cart();
			cart.setUser(userLogin);

			session.save(cart);

			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {

			session.close();

		}
		return "redirect:/index/1/1.htm";
	}

	@RequestMapping(value = "checkout/{mp}/{proId}", method = RequestMethod.GET)
	public String minusPlus(ModelMap model, @PathVariable("proId") Integer proId, @PathVariable("mp") String mp) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			CartItem ci_temp = checkCartItem(cartUser.getId(), proId);
			if (ci_temp != null) {
				if (mp.equals("giam")) {
					if (ci_temp.getQuantity() == 1) {
						ci_temp.setQuantity(1);
					} else {
						ci_temp.setQuantity(ci_temp.getQuantity() - 1);
					}
				} else {
					ci_temp.setQuantity(ci_temp.getQuantity() + 1);
				}

				session.merge(ci_temp);
				t.commit();
			} else {
//				session.save(ci);
//				t.commit();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}

		if (URL.equals("checkout")) {
			return "redirect:/checkout.htm";
		} else {
			return "redirect:/index/1/1.htm";
		}
	}

	@RequestMapping("faq")
	public String faq(ModelMap model) {
		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());

			if (cart == null) {

			} else {
				cartUser = cart;
				// System.out.println(cartUser);
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);

				}
			}
		}
		return "faq";

	}

	@RequestMapping("about")
	public String about(ModelMap model) {
		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());

			if (cart == null) {

			} else {
				cartUser = cart;
				// System.out.println(cartUser);
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);

				}
			}
		}
		return "about";
	}

	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public String contact(ModelMap model) {
		model.put("sendmail", new Email());
		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());

			if (cart == null) {

			} else {
				cartUser = cart;
				// System.out.println(cartUser);
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);

				}
			}
		}
		return "contact";
	}

	@RequestMapping(value = "contact/send", method = RequestMethod.POST)
	public String contact(ModelMap model, @ModelAttribute("sendmail") Email email) {
		try {
			String content = "Nguoi gui" + email.getName();
			content += "SDT" + email.getPhone();
			content += "address" + email.getAddress();

			mailer.send(email.getEmail(), "trinhtuanvuu@gmail.com", email.getSubject(), content);
			System.out.println(content);
			model.addAttribute("message", "thanh cong");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
		}

		return "ok";
	}

	@RequestMapping(value = "index/{page}/{pageKM}", method = RequestMethod.GET)
	public String viewProductListByPage(ModelMap model, @PathVariable("page") int page,
			@PathVariable("pageKM") int pageKM) {
		URL = "index";
		cPage = page;
		cPageKM = pageKM;
		Session session = factory.getCurrentSession();

		String hql = "from Product ";
		Query query = session.createQuery(hql);

		List<Product> lists = query.list();
		model.addAttribute("products", lists);

		String hql2 = "from Product ORDER BY id desc";
		Query query4 = session.createQuery(hql2);

		List<Product> listnew = query4.list();
		model.addAttribute("SPMOI", listnew);

		int ProductCout = 12; //

		model.addAttribute("listProduct", getListNav((page - 1) * ProductCout, ProductCout));
		model.addAttribute("totalPage",
				(totalItem() % ProductCout == 0) ? totalItem() / ProductCout : totalItem() / ProductCout + 1);
		model.addAttribute("currentPage", page);

		int productkmCount = 8;

		// ĐÊM so luong sp theo khuyến mãi
		model.addAttribute("listProductkm", getListProductKM((pageKM - 1) * productkmCount, productkmCount));
		model.addAttribute("totalPageKM", (totalItemKM() % productkmCount == 0) ? totalItemKM() / productkmCount
				: totalItemKM() / productkmCount + 1);
		model.addAttribute("currentPageKM", pageKM);
		model.addAttribute("userLogin", userLogin);
		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				// System.out.println(cartUser);
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);

				}
			}
		}
		return "index";
	}

	public List<Cart> getOrder(Integer userId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Cart WHERE user.id = :userId AND buyDate is not null");
			query.setInteger("userId", userId);
			List<Cart> list = query.list();
			Collections.reverse(list);
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public Cart getCart(Integer userId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Cart WHERE user.id = :userId AND buyDate is null");
			query.setInteger("userId", userId);
			Cart obj = (Cart) query.uniqueResult();
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public Long getTotalCartItem(Integer cartId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("SELECT count(*) FROM CartItem WHERE cart.id = :cartId");
			query.setInteger("cartId", cartId);
			Long tong = (Long) query.uniqueResult();
			transaction.commit();
			return tong;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public List<CartItem> getCartItems(Integer cartId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM CartItem WHERE cart.id = :cartId");
			query.setInteger("cartId", cartId);
			List<CartItem> list = query.list();
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public Double getTotalPriceCart(Integer cartId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("SELECT SUM(unitPrice * quantity) FROM CartItem WHERE cart.id = :cartId");
			query.setInteger("cartId", cartId);
			Double total = (Double) query.uniqueResult();
			transaction.commit();
			return total;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public Product getProduct(int id) {
		Session session = factory.getCurrentSession();
		try {

			String hql = "FROM Product where id = :id";
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			Product kq = (Product) query.uniqueResult();
			if (kq != null)
				return kq;
		} catch (Exception e) {
			System.out.println("Lỗi" + e);
		}

		return null;
	}

	public List<Product> getListNav(int start, int limit) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Product ");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Product> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public List<Product> getListProductKM(int start, int limit) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Product where discount > 0 ");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Product> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalItem() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM Product");
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	public int totalItemKM() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM Product where discount > 0");
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	public List<Product> getListNavByCate(int start, int limit, int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Product WHERE category.cateId =:id");
			query.setParameter("id", id);
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Product> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalItemByCate(int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM Product WHERE category.cateId =:id");
			query.setParameter("id", id);
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	@RequestMapping(value = "preview-1/{id}", method = RequestMethod.GET)
	public String getProductDetail(ModelMap model, @PathVariable("id") int id) {
		URL = "preview-1";
		pNum = id;
		// int detailCountPage = 4;

		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("chitiet", product);

		String hql = "from Product ";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();

		model.addAttribute("listDetail", list);

//		model.addAttribute("chitiet.category.products", getListNav((page - 1) * detailCountPage, detailCountPage));
//		model.addAttribute("totalPage", (totalItemByCate(id) % detailCountPage == 0) ? totalItemByCate(id) / detailCountPage
//				: totalItemByCate(id) / detailCountPage + 1);
//		model.addAttribute("currentPage", page);
//		model.addAttribute("isCate", 0);

		// model.addAttribute("baseURL", baseURL);

		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));

			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> lists = getCartItems(cart.getId());
				if (lists == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", lists);
				}
			}
		}

		return "preview-1";

	}

	@RequestMapping(value = "category/{id}/{page}", method = RequestMethod.GET)
	public String viewProductListByPageAndCate(ModelMap model, @PathVariable("id") int id,
			@PathVariable("page") int page) {
		URL = "category";
		cId = id;
		pId = page;

		int lineCount = 12;

		Session session = factory.getCurrentSession();

		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("products", list);

		String hql2 = "from Product ORDER BY id desc";
		Query query4 = session.createQuery(hql2);

		List<Product> listnew = query4.list();
		model.addAttribute("SPMOI", listnew);

		String hqlCate = "FROM Category";
		Query queryCate = session.createQuery(hqlCate);
		List<Category> listCate = queryCate.list();
		model.addAttribute("categories", listCate);

		String hqlUser = "FROM User";
		Query queryUser = session.createQuery(hqlUser);
		List<User> listUser = queryUser.list();
		model.addAttribute("users", listUser);

		model.addAttribute("listProduct", getListNavByCate((page - 1) * 12, 12, id));
		model.addAttribute("totalPage", (totalItemByCate(id) % lineCount == 0) ? totalItemByCate(id) / lineCount
				: totalItemByCate(id) / lineCount + 1);
		model.addAttribute("currentPage", page);
		model.addAttribute("isCate", 1);
		model.addAttribute("cateId", id);

		Category category = (Category) session.get(Category.class, id);
		model.addAttribute("category", category);
		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());

			if (cart == null) {

			} else {
				cartUser = cart;
				// System.out.println(cartUser);
				model.addAttribute("cart", cart);
				List<CartItem> listcart = getCartItems(cart.getId());
				if (listcart == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", listcart);

				}
			}
		}
		return "products";
	}

	public CartItem checkCartItem(Integer cartId, Integer proId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			// tao doi tuong query
			Query query = session.createQuery("FROM CartItem WHERE cartId = :cartId AND proId = :proId");
			query.setInteger("cartId", cartId);
			query.setInteger("proId", proId);
			// thuc hien truy van
			CartItem obj = (CartItem) query.uniqueResult();
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	@RequestMapping(value = "cart/insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("cartItem") CartItem item) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			CartItem ci_temp = checkCartItem(cartUser.getId(), item.getProduct().getId());

			if (ci_temp != null) {

				ci_temp.setQuantity(ci_temp.getQuantity() + item.getQuantity());
				session.merge(ci_temp);

				t.commit();

			} else {
				session.save(item);
				t.commit();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}
		if (URL.equals("checkout")) {
			return "redirect:/checkout.htm";
		}
		if (URL.equals("index")) {
			return "redirect:/index/" + cPage + "/" + cPageKM + ".htm";
		}
		if (URL.equals("category")) {
			return "redirect:/category/" + cId + "/" + pId + ".htm";

		}
		if (URL.equals("preview-1")) {
			return "redirect:/preview-1/" + pNum + ".htm";

		} else {
			return "redirect:/index/1/1.htm";
		}
	}

	@RequestMapping(value = "cart/delete/{id}", method = RequestMethod.GET)
	public String deleteCart(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.openSession();
		CartItem item = (CartItem) session.get(CartItem.class, id);
		Transaction t = session.beginTransaction();
		try {
			session.delete(item);
			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.close();
		}
		if (URL.equals("checkout")) {
			return "redirect:/checkout.htm";
		}
		if (URL.equals("index")) {
			return "redirect:/index/" + cPage + "/" + cPageKM + ".htm";
		}
		if (URL.equals("category")) {
			return "redirect:/category/" + cId + "/" + pId + ".htm";

		}
		if (URL.equals("thanhtoan")) {
			return "redirect:/thanhtoan.htm";

		} else {
			return "redirect:/index/1/1.htm";
		}
	}

	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String order(ModelMap model) {
		URL = "order";

		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {

			model.addAttribute("orders", getOrder(userLogin.getId()));

			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}

		return "order";
	}

	@RequestMapping(value = "order/huy/{id}", method = RequestMethod.GET)
	public String cancelOrder(ModelMap model, @PathVariable Integer id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Cart cart = (Cart) session.get(Cart.class, id);
		try {
			cart.setStatus(3);
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return "redirect:/order.htm";
	}

	// huy don hang
	@RequestMapping(value = "order/nhan/{id}", method = RequestMethod.GET)
	public String repurchaseOrder(ModelMap model, @PathVariable Integer id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Cart cart = (Cart) session.get(Cart.class, id);
		try {
			cart.setStatus(2);
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return "redirect:/order.htm";
	}

	@RequestMapping(value = "order/xacnhan/{id}", method = RequestMethod.GET)
	public String xacNhanOrder(ModelMap model, @PathVariable Integer id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Cart cart = (Cart) session.get(Cart.class, id);
		try {
			cart.setStatus(0);
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return "redirect:/order.htm";
	}

	public List<Product> findByKeywords(String keywords) {
		Session session = factory.getCurrentSession();

		String hql = "FROM Product p WHERE " + " p.name LIKE :kw OR " + " p.category.cateName LIKE :kw";
		Query query = session.createQuery(hql);
		query.setParameter("kw", "%" + keywords + "%");
		List<Product> list = query.list();
		return list;

	}

	@RequestMapping(value = "product/list-by-keywords", method = RequestMethod.GET)
	public String listByKeywords(ModelMap model) {

		return "search-for";
	}

	@RequestMapping(value = "product/list-by-keywords", method = RequestMethod.POST)
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {

		Session session = factory.getCurrentSession();

		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> listp = query.list();
		model.addAttribute("products", listp);
		List<Product> products = findByKeywords(keywords);
		System.out.println(products);
		model.addAttribute("prods", products);

		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				// System.out.println(cartUser);
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);

				}
			}
		}
		return "search-for";
	}
}
