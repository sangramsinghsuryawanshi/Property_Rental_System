package com.project.PRS.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.PRS.model.AddProperties;
import com.project.PRS.model.ContactForm;
import com.project.PRS.model.ContactInquiry;
import com.project.PRS.model.FeedbackForm;
import com.project.PRS.model.UserRegistration;
import com.project.PRS.repository.AddPropertiesConnection;
import com.project.PRS.repository.ContactConnection;
import com.project.PRS.repository.FeedbackConnection;
import com.project.PRS.repository.RepositoryConnection;
import com.project.PRS.repository.RequestViste;

@Controller
@SessionAttributes({ "tuser,muser" })
public class PropertyRentalSystemController {

	@Autowired
	private RepositoryConnection rc;

	@Autowired
	private AddPropertiesConnection addPro;

	@Autowired
	private ContactConnection CotCon;

	@Autowired
	private FeedbackConnection FedCon;

	@Autowired
	private RequestViste ReVi;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/")
	public String isRenderRegi() {
		return "RegisterLogin/Registration.jsp";
	}

	@RequestMapping("/l")
	public String isRenderlogin() {
		return "RegisterLogin/Login.jsp";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/l";
	}

	@RequestMapping("/registerUser")
	public ModelAndView isRegisterd(@ModelAttribute UserRegistration ur,
			@RequestParam("uploadIdProof") MultipartFile file, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		if (rc.findByEmail(ur.getEmail()) != null) {
			modelAndView.setViewName("RegisterLogin/Registration.jsp");
			modelAndView.addObject("errorMessage", "Email is already registered.");
			return modelAndView;
		}
		if (!file.isEmpty()) {
			try {
				String uploadDirectory = "D:/spring-eclispe-workspace/com.project.PropertyRentalSystem/src/main/webapp/images/";

				File directory = new File(uploadDirectory);
				if (!directory.exists()) {
					directory.mkdirs();
				}

				String filename = file.getOriginalFilename();
				String filePath = uploadDirectory + filename;
				file.transferTo(new File(filePath));

				ur.setUploadIdProofPath(filename);
				System.out.println("Serving image from path: /images/" + ur.getUploadIdProofPath());

				if (rc != null) {
					rc.save(ur);
					redirectAttributes.addFlashAttribute("errorMessage", "Registered successfully!");
					modelAndView.setViewName("redirect:/l");
				} else {
					modelAndView.setViewName("RegisterLogin/Registration.jsp");
					modelAndView.addObject("errorMessage", "Repository connection is not initialized.");
				}

			} catch (IOException e) {
				modelAndView.setViewName("RegisterLogin/Registration.jsp");
				modelAndView.addObject("errorMessage", "File upload failed: " + e.getMessage());
			}
		} else {
			modelAndView.setViewName("RegisterLogin/Registration.jsp");
			modelAndView.addObject("errorMessage", "Please upload a valid ID proof file.");
		}

		return modelAndView;
	}

	@RequestMapping("/Login")
	public ModelAndView login(@RequestParam String email, String password, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		UserRegistration user = rc.findByEmail(email);
		HttpSession session = request.getSession();

		if (user != null && user.getPassword().equals(password)) {

			if (user.getUserRole().equals("tenant")) {
				session.setAttribute("tuser", user);

				return new ModelAndView("redirect:/tenantUserPage");

			} else if (user.getUserRole().equals("manager")) {
				session.setAttribute("muser", user);

				return new ModelAndView("redirect:/managerUserPage");
			}
		} else {
			modelAndView.setViewName("redirect:/l");
			redirectAttributes.addFlashAttribute("errorMessage", "Invalid email or password.");
		}
		return modelAndView;
	}

	@RequestMapping("/tenantUserPage")
	public ModelAndView showTenantPage(HttpSession session) {
		UserRegistration user = (UserRegistration) session.getAttribute("tuser");
		ModelAndView modelAndView = new ModelAndView("tenant/HomeTenant.jsp");

		if (user != null) {
			List<Object[]> FedInfo = FedCon.topFeedback(PageRequest.of(0, 2));
			modelAndView.addObject("feedbackList", FedInfo);
			modelAndView.addObject("user", user);
			List<Object[]> ProName = addPro.findRecentProperties(PageRequest.of(0, 1));
			for (Object[] property : ProName) {
				modelAndView.addObject("ProNotify1", property[0]);
				modelAndView.addObject("ProNotify2", property[1]);
				modelAndView.addObject("ProNotify3", property[2]);
			}

			System.out.println(user.getFullName());
		} else {
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
	}

	@RequestMapping("/managerUserPage")
	public ModelAndView showManagerPage(HttpSession session) {
		UserRegistration user = (UserRegistration) session.getAttribute("muser");
		ModelAndView modelAndView = new ModelAndView("Manager/HomeManager.jsp");

		if (user != null) {
			int Manager = rc.getManageruserRolecnt("manager");
			int cntOfProperties = addPro.countAllProperties();
			modelAndView.addObject("user", user);
			int tenant = rc.getManageruserRolecnt("tenant");
			long feedbackCnt = FedCon.count();
			long contactCnt = CotCon.count();
			long InquiryCnt = ReVi.count();
			modelAndView.addObject("tenant", tenant);
			modelAndView.addObject("manager", Manager);
			modelAndView.addObject("userFeedback", feedbackCnt);
			modelAndView.addObject("contactCnt", contactCnt);
			modelAndView.addObject("cntOfProperties", cntOfProperties);
			modelAndView.addObject("InquiryCnt", InquiryCnt);
			System.out.println(user.getEmail());
		} else {
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
	}

	@RequestMapping("/fetch")
	public ModelAndView fetchUsers() {
		ModelAndView modelAndView = new ModelAndView("Manager/UserData.jsp");
		List<UserRegistration> userList = rc.findAll();
		List<ContactForm> contactList = CotCon.findAll();
		List<FeedbackForm> feedbackList = FedCon.findAll();
		modelAndView.addObject("us", userList);
		modelAndView.addObject("feedbackList", feedbackList);
		modelAndView.addObject("contactList", contactList);
		return modelAndView;
	}

	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.POST)
	public String deleteUser(@PathVariable("id") int id) {
		rc.deleteById(id);
		return "redirect:/fetch";
	}

	@RequestMapping(value = "/deleteFeedback{id}", method = RequestMethod.POST)
	public String deleteFeedback(@PathVariable("id") int id) {
		FedCon.deleteById(id);
		return "redirect:/fetch";
	}

	@RequestMapping(value = "/deleteContact{id}", method = RequestMethod.POST)
	public String deleteContact(@PathVariable("id") int id) {
		CotCon.deleteById(id);
		return "redirect:/fetch";
	}

	@RequestMapping("/updateAdmin")
	public String isUpdateAdmin(@RequestParam int id, @ModelAttribute UserRegistration usr, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserRegistration ob = rc.findById(id).orElse(null);
		if (ob != null) {
			ob.setFullName(usr.getFullName());
			ob.setPassword(usr.getPassword());
			ob.setEmail(usr.getEmail());
			ob.setContactNumber(usr.getContactNumber());
			ob.setPermentAddress(usr.getPermentAddress());
			ob.setCity(usr.getCity());
			ob.setState(usr.getState());
			ob.setPinCode(usr.getPinCode());
			ob.setCountry(usr.getCountry());
			rc.save(ob);
			session.setAttribute("muser", ob);
			redirectAttributes.addFlashAttribute("message", "Admin updated successfully!");
		}
		return "redirect:/fetch";
	}

	@RequestMapping("/addProperty")
	public ModelAndView isPropertyAdded(@RequestParam("propertyName") String propertyName,
			@RequestParam("propertyAddress") String propertyAddress, @RequestParam("propertyType") String propertyType,
			@RequestParam("propertyPrice") double propertyPrice,
			@RequestParam("propertyDescription") String propertyDescription, @RequestParam("latitude") double latitude,
			@RequestParam("longitude") double longitude, @RequestParam("propertyStatus") String propertyStatus,
			@RequestParam("propertyImage") MultipartFile file, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		if (!file.isEmpty()) {
			try {
				String uploadDirectory = "D:/spring-eclispe-workspace/com.project.PropertyRentalSystem/src/main/webapp/PropertyImages/";

				File directory = new File(uploadDirectory);
				if (!directory.exists()) {
					directory.mkdirs();
				}

				String filename = file.getOriginalFilename();
				String filePath = uploadDirectory + filename;
				file.transferTo(new File(filePath));
				AddProperties ad = new AddProperties();
				ad.setPropertyName(propertyName);
				ad.setPropertyAddress(propertyAddress);
				ad.setPropertyType(propertyType);
				ad.setPropertyPrice(propertyPrice);
				ad.setPropertyDescription(propertyDescription);
				ad.setLatitude(latitude);
				ad.setLongitude(longitude);
				ad.setAvailability(propertyStatus);
				ad.setPropertyImage(filename);

				if (addPro != null) {
					addPro.save(ad);
					modelAndView.setViewName("redirect:/propertiesFetch");
					redirectAttributes.addFlashAttribute("message", "Property Added successfully!");
				} else {
					modelAndView.setViewName("Manager/ManagerAddProperties.jsp");
					modelAndView.addObject("errorMessage", "Repository connection is not initialized.");
				}

			} catch (IOException e) {
				modelAndView.setViewName("Manager/ManagerAddProperties.jsp");
				redirectAttributes.addFlashAttribute("errorMessage", "File upload failed: " + e.getMessage());
			}
		} else {
			modelAndView.setViewName("Manager/ManagerAddProperties.jsp");
			modelAndView.addObject("errorMessage", "Please upload a valid Photo.");
		}

		return modelAndView;
	}

	@RequestMapping("/propertiesFetch")
	public ModelAndView fetchPropetie() {
		ModelAndView modelAndView = new ModelAndView("Manager/ManagerPropertiesUpDel.jsp");
		List<AddProperties> addList = addPro.findAll();
		modelAndView.addObject("properties", addList);
		return modelAndView;
	}

	@RequestMapping(value = "/deleteProperty/{id}", method = RequestMethod.POST)
	public String deleteProperties(@PathVariable("id") int id) {
		addPro.deleteById(id);
		return "redirect:/propertiesFetch";
	}

	@RequestMapping("/{id}")
	public String isEdit(@PathVariable int id, Model m) {
		AddProperties Add = addPro.findById(id);
		m.addAttribute("property", Add);
		return "Manager/UpdateProperties.jsp";
	}

	@RequestMapping(value = "/updateProperty", method = RequestMethod.POST)
	public String updateProperty(@RequestParam("id") int id, @RequestParam("propertyName") String propertyName,
			@RequestParam("propertyAddress") String propertyAddress, @RequestParam("propertyType") String propertyType,
			@RequestParam("propertyPrice") double propertyPrice,
			@RequestParam("propertyDescription") String propertyDescription, @RequestParam("latitude") double latitude,
			@RequestParam("longitude") double longitude, @RequestParam("availability") String availability,
			@RequestParam("propertyImage") MultipartFile propertyImage, RedirectAttributes redirectAttributes) {

		AddProperties ob = addPro.findById(id);

		// Update other property fields
		ob.setPropertyName(propertyName);
		ob.setPropertyAddress(propertyAddress);
		ob.setPropertyType(propertyType);
		ob.setPropertyPrice(propertyPrice);
		ob.setPropertyDescription(propertyDescription);
		ob.setLatitude(latitude);
		ob.setLongitude(longitude);
		ob.setAvailability(availability);
		if (!propertyImage.isEmpty()) {
			try {

				String folder = "D:/spring-eclispe-workspace/com.project.PropertyRentalSystem/src/main/webapp/images/";
				byte[] bytes = propertyImage.getBytes();
				Path path = Paths.get(folder + propertyImage.getOriginalFilename());

				Files.write(path, bytes);

				ob.setPropertyImage(propertyImage.getOriginalFilename());
			} catch (IOException e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("errorMessage", "Error while uploading image");
			}
		}
		addPro.save(ob);

		redirectAttributes.addFlashAttribute("message", "Property updated successfully!");
		return "redirect:/propertiesFetch";
	}

	@RequestMapping("/propertiesDetailsFetch")
	public ModelAndView fetchPropetieDetail() {
		ModelAndView modelAndView = new ModelAndView("tenant/Properties.jsp");
		List<AddProperties> addList = addPro.findAll();
		modelAndView.addObject("properties", addList);
		return modelAndView;
	}

	@RequestMapping("/updateTenant")
	public String isUpdateTenant(@RequestParam int id, @ModelAttribute UserRegistration usr, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserRegistration ob = rc.findById(id).orElse(null);
		if (ob != null) {
			ob.setFullName(usr.getFullName());
			ob.setPassword(usr.getPassword());
			ob.setEmail(usr.getEmail());
			ob.setContactNumber(usr.getContactNumber());
			ob.setPermentAddress(usr.getPermentAddress());
			ob.setCity(usr.getCity());
			ob.setState(usr.getState());
			ob.setPinCode(usr.getPinCode());
			ob.setCountry(usr.getCountry());
			rc.save(ob);
			session.setAttribute("tuser", ob);
			redirectAttributes.addFlashAttribute("message", "Tenant updated successfully");
			return "redirect:/tenantUserPage";
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "Tenant not found!");
			return "redirect:/tenantUserPage";
		}
	}

	@RequestMapping("/contact")
	public String submitContactForm(@ModelAttribute ContactForm conFor, RedirectAttributes redirectAttributes) {

		if (CotCon != null) {
			CotCon.save(conFor);
		}
		redirectAttributes.addFlashAttribute("message", "Contact form submitted successfully.");
		return "redirect:/tenantUserPage";
	}

	@RequestMapping("/feedback")
	public String submitFeedbackForm(@ModelAttribute FeedbackForm fedBack, RedirectAttributes redirectAttributes) {

		if (FedCon != null) {
			FedCon.save(fedBack);
		}
		redirectAttributes.addFlashAttribute("message", "Feedback form submitted successfully.");
		return "redirect:/tenantUserPage";
	}

	@RequestMapping(value = "/handleForm", method = RequestMethod.POST)
	public ModelAndView handleForm(@RequestParam("id") int id) {
		AddProperties add = addPro.findById(id);
		ModelAndView mo = new ModelAndView("tenant/ContactOwner.jsp");
		mo.addObject("property", add);
		return mo;
	}

	@RequestMapping(value = "/scheduleVisit", method = RequestMethod.POST)
	public String scheduleVisit(@ModelAttribute ContactInquiry conI, RedirectAttributes redirectAttributes) {
		try {
			if (ReVi != null) {
				ReVi.save(conI);
				redirectAttributes.addFlashAttribute("message",
						"Visit request submitted successfully. Owner number will reach your email. Thank you.");
			} else {
				redirectAttributes.addFlashAttribute("errorMessage", "Failed to save visit request.");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Failed to submit visit request.");
			e.printStackTrace();
		}
		return "redirect:/tenantUserPage";
	}

	@RequestMapping("/Inquiryfetch")
	public ModelAndView fetchRequest() {
		ModelAndView modelAndView = new ModelAndView("Manager/TenantProApproval.jsp");
		List<ContactInquiry> addReq = ReVi.findAll();
		modelAndView.addObject("visitRequests", addReq);
		return modelAndView;
	}

	@RequestMapping("/sendMail")
	public String sendMail(@RequestParam("email") String recipientEmail, @RequestParam("subject") String subject,
			@RequestParam("message") String message, Model model) {
		try {
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setTo(recipientEmail);
			mailMessage.setSubject(subject);
			mailMessage.setText(message);
			mailMessage.setFrom("rajsuryawanshi4100@gmail.com");

			mailSender.send(mailMessage);
			model.addAttribute("message", "Email sent successfully!");
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Error while sending email: " + e.getMessage());
			e.printStackTrace();
		}
		return "/Inquiryfetch";
	}

	@RequestMapping(value = "/deleteVisitRequest/{id}", method = RequestMethod.POST)
	public String deleteInquiry(@PathVariable("id") int id) {
		ReVi.deleteById(id);
		return "redirect:/Inquiryfetch";
	}
}