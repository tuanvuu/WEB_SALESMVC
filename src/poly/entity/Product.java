package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class Product {
	@Id
	@GeneratedValue
	@Column(name = "Id")
	private Integer id;

	@Column(name = "Name")
	private String name;

	@Column(name = "Price")
	private Float price;

	@ManyToOne
	@JoinColumn(name = "CateId")
	private Category category;

	@Column(name = "Description")
	private String description;

	@Column(name = "Image")
	private String image;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Collection<CartItem> cartItems;

	@Column(name = "Discount")
	private Integer discount;

	@Column(name = "Chitiet")
	private String chitiet;

	@Column(name = "Mota")
	private String mota;

	public String getChitiet() {
		return chitiet;
	}

	public void setChitiet(String chitiet) {
		this.chitiet = chitiet;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Collection<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Collection<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public Product(Integer id, String name, Float price, Category category, String description, String image,
			Collection<CartItem> cartItems, Integer discount, String chitiet, String mota) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.category = category;
		this.description = description;
		this.image = image;
		this.cartItems = cartItems;
		this.discount = discount;
		this.chitiet = chitiet;
		this.mota = mota;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

}
