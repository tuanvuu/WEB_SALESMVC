package poly.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
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

import poly.entity.Cart;
import poly.entity.CartItem;
import poly.entity.Category;
import poly.entity.Product;

import poly.entity.User;

@Controller

@Transactional
@RequestMapping("admins")
public class AdminsController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	List<User> list;

	User userAdmin = null;
	String adminURL = null;

	@ModelAttribute("category")
	public List<Category> allloaiSP() {
		Session session = factory.getCurrentSession();

		Query query = session.createQuery("From Category order by cateName");
		List<Category> list = query.list();
		return list;

	}
	

	@ModelAttribute("userAdmin")
	public User getAdminLogin() {
		return userAdmin;
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

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String viewLogin(ModelMap model) {
		model.addAttribute("login", new User());
		return "admins/login";
	}

	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public String viewSignOut(ModelMap model) {
		userAdmin = null;
		return "redirect:/index/1/1.htm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String doLogin(ModelMap model, @ModelAttribute("login") User user) {

		User us = login(user.getEmail(), user.getPassword());
		if (us == null) {
			model.addAttribute("login", new User());
			model.addAttribute("message", "Tên tài khoản hoặc mật khẩu không chính xác !");
			// model.addAttribute("result", false);
			return "admins/login";
		} else {

			if (us.getRoleid() == 1) {
				userAdmin = us;

			}
			// model.addAttribute("result", true);
		}

		return "redirect:/admins/user/tables.htm";
	}

	@RequestMapping(value = "user/insert", method = RequestMethod.GET)
	public String insertUser(ModelMap model) {

		model.addAttribute("user", new User());
		return "admins/user/insert";
	}

	@RequestMapping(value = "user/insert", method = RequestMethod.POST)
	public String insertUser(ModelMap model, @ModelAttribute("user") User user,
			@RequestParam("photo") MultipartFile photo, HttpServletRequest request, BindingResult errors) {
		if (checkEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "user", "Tên email đã tồn tại!");
		}
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập email");
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập mật khẩu");
		}
		if (user.getPhone().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập số điện thoại");
		}
		if (user.getAdress().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập địa chỉ");
		}
		if (!errors.hasErrors()) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			context = request.getSession().getServletContext();
			try {
				if (!photo.isEmpty()) {
					String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
					photo.transferTo(new File(photoPath));

					user.setAvarta(photo.getOriginalFilename());
				}

				session.save(user);

				Cart cart = new Cart();
				cart.setUser(user);
				session.save(cart);

				t.commit();

				// TimeUnit.SECONDS.sleep(5);

				model.addAttribute("message", "Thêm mới thành công !");
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				model.addAttribute("msg", "Thêm mới thất bại !\n" + e.toString());
			} finally {
				session.close();
			}

		}
		return "admins/user/insert";
	}

	@RequestMapping(value = "user/edit/{id}", method = RequestMethod.GET)
	public String EditUser(ModelMap model, @PathVariable("id") Integer id) {
		adminURL = "admins/user/edit";
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, id);
		model.addAttribute("editUser", user);
		return "admins/user/edit";

	}

	@RequestMapping(value = "user/edit/{id}", method = RequestMethod.POST)
	public String EditUser(ModelMap model, @ModelAttribute("editUser") User user,
			@RequestParam("photo") MultipartFile photo, BindingResult errors, HttpServletRequest request) {
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

			// TimeUnit.SECONDS.sleep(5);

			model.addAttribute("message", "Sửa thành công !");
			if (user.getId() == userAdmin.getId()) {
				userAdmin = user;
			} else {

				if (userAdmin.getId() == user.getId()) {
					userAdmin = user;
				}
			}
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Sửa thất bại !\n" + e.toString());
		} finally {
			session.close();
		}

		return "admins/user/edit";

	}

	@RequestMapping(value = "user/delete/{id}", method = RequestMethod.GET)
	public String deleteUser(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		User user = (User) session.get(User.class, id);
		Transaction t = session.beginTransaction();
		try {
			session.delete(user);
			t.commit();
			model.addAttribute("msg", "Xóa thành công!");

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
			model.addAttribute("msg", "Xóa thất bại!");
		} finally {
			session.close();
		}
		return "redirect:/admins/user/tables.htm";

	}

	@RequestMapping(value = "product/insert", method = RequestMethod.GET)
	public String insertProduct(ModelMap model) {
		model.addAttribute("insertProduct", new Product());
		return "admins/product/insert";
	}

	@RequestMapping(value = "product/insert", method = RequestMethod.POST)
	public String insertProduct(ModelMap model, @ModelAttribute("insertProduct") Product product,
			@RequestParam("photo") MultipartFile photo, HttpServletRequest request, BindingResult errors) {
		if (product.getName().trim().length() == 0) {
			errors.rejectValue("name", "product", "Vui lòng nhập tên sản phẩm !");
		}

		if (!errors.hasErrors()) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			context = request.getSession().getServletContext();
			try {

				if (!photo.isEmpty()) {
					// String photoPath = context.getContextPath() +"/WebContent/images/product/"
					// +photo.getOriginalFilename();

//					String dir = context.getRealPath("/images/product/");
//				File newFile = new File(dir, photo.getOriginalFilename());

					String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
					System.out.println(photoPath);
					photo.transferTo(new File(photoPath));
					product.setImage(photo.getOriginalFilename());

					// String photoPath = context.getRealPath("/images/product/");
					// String photoPath = context.getContextPath() +"/WebContent/images/product/";
					// System.out.println(photoPath);
					// String photoPath = context.getRealPath("/images/product/");
					// File file = new File(photoPath, photo.getOriginalFilename());
					// photo.transferTo(file);
					// product.setImage(photo.getOriginalFilename());
					// System.out.println(photoPath);

				}
				session.save(product);
				t.commit();

				model.addAttribute("msg", "Thêm mới thành công !");

			} catch (Exception e) {
				t.rollback();
				model.addAttribute("msg", "Thêm mới thất bại !" + e.toString());

				// TODO: handle exception
			} finally {
				session.close();
			}
		}
		return "admins/product/insert";
	}

	@RequestMapping("index")
	public String index() {
		return "admins/index";
	}

	@RequestMapping("product/tables")
	public String ListProduct(ModelMap model) {
		Session session = factory.getCurrentSession();

		String hql = "from Product ";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("products", list);
		return "admins/product/tables";
	}

	@RequestMapping("user/tables")
	public String ListUser(ModelMap model) {
		adminURL = "admins/user/tables";
		Session session = factory.getCurrentSession();

		String hql = "from User ";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("user", list);
		return "admins/user/tables";
	}

	@RequestMapping("tables_1")
	public String LoaiSp() {
		return "admins/tables_1";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String Adminedit(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("editProduct", product);

		return "admins/product/edit_sp";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String Aminedit(ModelMap model, @PathVariable("id") Integer id,
			@ModelAttribute("editProduct") Product product, @RequestParam("photo") MultipartFile photo,
			BindingResult errors, HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		context = request.getSession().getServletContext();
		try {
			if (!photo.isEmpty()) {
				String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());

				photo.transferTo(new File(photoPath));

				product.setImage(photo.getOriginalFilename());
			}
			session.update(product);
			t.commit();
			model.addAttribute("message", "Sửa thành công !");
		} catch (Exception e) {
			t.rollback();

			model.addAttribute("message", "Sửa thất bại !\n" + e.toString());
		} finally {
			session.close();
		}
		return "admins/product/edit_sp";

	}

	@RequestMapping(value = "product/delete/{id}", method = RequestMethod.GET)
	public String deleteProduct(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		Product product = (Product) session.get(Product.class, id);
		try {

			session.delete(product);
			transaction.commit();
			model.addAttribute("msg", "Xóa sản phẩm thành công");

		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
			model.addAttribute("msg", "Xóa sản phẩm thất bại");

		} finally {
			session.close();
		}
		return "redirect:/admins/product/tables.htm";
	}

	@RequestMapping(value = "category/tables")
	public String viewCategory(ModelMap model) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from Category");
		List<Category> list = query.list();
		model.addAttribute("category", list);
		return "admins/category/tables";

	}

	@RequestMapping(value = "category/insert", method = RequestMethod.GET)
	public String insertCategory(ModelMap model) {
		Session session = factory.getCurrentSession();
		model.addAttribute("insertCategory", new Category());
		return "admins/category/insert";

	}

	@RequestMapping(value = "category/insert", method = RequestMethod.POST)
	public String insertCategory(ModelMap model, @ModelAttribute("insertCategory") Category category) {

		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {

			session.save(category);
			transaction.commit();
			model.addAttribute("message", "Thêm loại sản phẩm thành công!");

		} catch (Exception e) {
			// TODO: handle exception
			transaction.commit();
			model.addAttribute("message", "Thêm loại sản phẩm thất bại!");
		} finally {
			session.close();
		}
		return "admins/category/insert";
	}

	@RequestMapping(value = "category/edit/{id}", method = RequestMethod.GET)
	public String editCategory(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Category category = (Category) session.get(Category.class, id);

		model.addAttribute("editCategory", category);
		return "admins/category/edit_sp";
	}

	@RequestMapping(value = "category/edit/{id}", method = RequestMethod.POST)
	public String editCategory(ModelMap model, @ModelAttribute("editCategory") Category category) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {

			session.update(category);
			transaction.commit();
			model.addAttribute("message", "Chỉnh sửa thành công!");

		} catch (Exception e) {
			// TODO: handle exception
			transaction.commit();
			model.addAttribute("message", "Chỉnh sửa thất bại!");
		} finally {
			session.close();
		}
		return "admins/category/edit_sp";
	}

	@RequestMapping(value = "category/delete/{id}", method = RequestMethod.GET)
	public String deleteCategory(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		Category category = (Category) session.get(Category.class, id);
		try {
			session.delete(category);
			transaction.commit();

		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admins/category/tables.htm";
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

	@RequestMapping(value = "order/tables", method = RequestMethod.GET)
	public String adminOrder(ModelMap model) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from Cart where buyDate is not null ");
		List<Cart> list = query.list();
		model.addAttribute("listCart", list);
		return "admins/order/tables";
	}

	@RequestMapping(value = "order/detail/{id}", method = RequestMethod.GET)
	public String adminOrderDetail(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		CartItem cart = (CartItem) session.get(CartItem.class, id);

		model.addAttribute("detailOrder", cart);
		return "admins/order/detail";
	}

	@RequestMapping(value = "order/{status}/{id}", method = RequestMethod.GET)
	public String finishOrder(ModelMap model, @PathVariable("status") String status, @PathVariable("id") Integer id) {
		Session session = factory.openSession();
		Cart cart = (Cart) session.get(Cart.class, id);
		Transaction transaction = session.beginTransaction();
		try {
			if (status.equals("xacnhan")) {
				cart.setStatus(1);
			}
			if (status.equals("delete")) {
				cart.setStatus(3);
			}
			if (status.equals("finish")) {
				cart.setStatus(2);
			}
			session.update(cart);
			transaction.commit();

		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admins/order/tables.htm";
	}

	// lay tat ca cac loai san pham ra
	@ModelAttribute("loaiSP")
	public List<Category> getLoaiSP() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from Category");
		List<Category> list = query.list();
		return list;

	}

}
