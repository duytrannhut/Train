package com.duy.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name = "orderdetails", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"Orderid", "Productid"})
})
public class OrderDetail implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	Double price;
	Integer quantity;
	@ToString.Exclude
	@ManyToOne @JoinColumn(name = "Orderid")
	Order order;
	@ToString.Exclude
	@ManyToOne @JoinColumn(name = "Productid")
	Product product;
}
