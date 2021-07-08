package com.duy.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.duy.entity.Category;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ReportDoanhThu implements Serializable {
	@Id
	private Category loai;
	private double doanhThu;
	private long soLuong;
}
