package com.lloyds.InvestBetter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lloyds.InvestBetter.bean.Customer;

@RestController
public class CustomerAction {
	@GetMapping(path = "/getCustomer", produces = "application/json")
	public Customer getCustomer() {
		Customer c = new Customer();
		c.setName("ABC");
		return c;
	}

}
