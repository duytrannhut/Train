package com.duy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Item {
	Integer id;
	String image;
	String name;
	double price;
	int quantity;
}
