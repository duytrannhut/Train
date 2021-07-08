package com.duy.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.duy.entity.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Top12 implements Serializable{
	@Id
	Product product;
	long soluong;
}
