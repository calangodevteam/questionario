package com.example.calango.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.example.calango.model.AreaConhecimento;

public class SubAreas {
	
	private List<AreaConhecimento> subAreas = new ArrayList<>();
	
	public SubAreas() {
		
	}

	public SubAreas(List<AreaConhecimento> subAreas) {

		this.subAreas = subAreas;
	}

	public List<AreaConhecimento> getSubAreas() {
		return subAreas;
	}

	public void setSubAreas(List<AreaConhecimento> subAreas) {
		this.subAreas = subAreas;
	}

}
