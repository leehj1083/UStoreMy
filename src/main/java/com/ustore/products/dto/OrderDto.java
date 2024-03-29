package com.ustore.products.dto;

public class OrderDto {
	
	private String productId;
	private String productName;
	private int purchasePrice;
	private int sellingPrice;
	private int unitQuantity;
	private int stock;
	private String pointEnabled;
	private String categoryId;
	private int regBy;
	private String regDate;
	private String update;
	private int updateBy;	
	private String categoryName;
	private String parentCategory;
	private String empIdx;
	private int orderQuantity;
	private int orderIdx;
	private String expArrivalDate;
	private int driverIdx;
	private String orderDate;
	private String driverName;
	private String carNum;
	private String phoneNum;
	private String deliveryDate;
	private int quantity;
	private String confStatus;
	private String receiptDate;
	private int resourceIdx;
	private String resourceName;
	private String empName;
	private String searchValue;
    private String resourceDate;
    
    
    
	
	// 대금지급 관련 추가
	private int netQuantity; // 주문량 - 반품량
	public String getResourceDate() {
		return resourceDate;
	}
	public void setResourceDate(String resourceDate) {
		this.resourceDate = resourceDate;
	}
	private int returnQuantity; // 반품량
	private int totalPricePerProduct; // 발주 건 제품의 판매 금액(구매금액*단위수량*(주문량-반품량))
	private int totalAmount; // 발주 건 총 금액
	
	
	
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getNetQuantity() {
		return netQuantity;
	}
	public void setNetQuantity(int netQuantity) {
		this.netQuantity = netQuantity;
	}
	public int getReturnQuantity() {
		return returnQuantity;
	}
	public void setReturnQuantity(int returnQuantity) {
		this.returnQuantity = returnQuantity;
	}
	
	public int getTotalPricePerProduct() {
		return totalPricePerProduct;
	}
	public void setTotalPricePerProduct(int totalPricePerProduct) {
		this.totalPricePerProduct = totalPricePerProduct;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getResourceIdx() {
		return resourceIdx;
	}
	public void setResourceIdx(int resourceIdx) {
		this.resourceIdx = resourceIdx;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getConfStatus() {
		return confStatus;
	}
	public void setConfStatus(String confStatus) {
		this.confStatus = confStatus;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public int getOrderIdx() {
		return orderIdx;
	}
	public void setOrderIdx(int orderIdx) {
		this.orderIdx = orderIdx;
	}
	public String getExpArrivalDate() {
		return expArrivalDate;
	}
	public void setExpArrivalDate(String expArrivalDate) {
		this.expArrivalDate = expArrivalDate;
	}
	public int getDriverIdx() {
		return driverIdx;
	}
	public void setDriverIdx(int driverIdx) {
		this.driverIdx = driverIdx;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmpIdx() {
		return empIdx;
	}
	public void setEmpIdx(String empIdx) {
		this.empIdx = empIdx;
	}
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdate() {
		return update;
	}
	public void setUpdate(String update) {
		this.update = update;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getParentCategory() {
		return parentCategory;
	}
	public void setParentCategory(String parentCategory) {
		this.parentCategory = parentCategory;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public int getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	public int getUnitQuantity() {
		return unitQuantity;
	}
	public void setUnitQuantity(int unitQuantity) {
		this.unitQuantity = unitQuantity;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPointEnabled() {
		return pointEnabled;
	}
	public void setPointEnabled(String pointEnabled) {
		this.pointEnabled = pointEnabled;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public int getRegBy() {
		return regBy;
	}
	public void setRegBy(int regBy) {
		this.regBy = regBy;
	}
	public int getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(int updateBy) {
		this.updateBy = updateBy;
	}
	
}
