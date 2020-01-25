package com.icook.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.icook.model.RecipeBean;
import com.icook.recipe.service.RecipeService;

@Controller
public class RecipeController {

	RecipeService service;
	ServletContext context;

	@Autowired
	public void setService(RecipeService service) {
		this.service = service;
	}

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@RequestMapping("/recipes")
	public String allRecipesList(Model model) {
		List<RecipeBean> list = service.getAllRecipes();
		model.addAttribute("recipes", list);
		return "recipe/recipes";
	}

	@RequestMapping("/recipe")
	public String getRecipeByRecipeNo(@RequestParam("no") Integer recipeNo, Model model) {
		model.addAttribute("recipe", service.getRecipeByRecipeNo(recipeNo));
		return "recipe/RecipeDetail";
	}

	@RequestMapping("/recipes/list")
	public String getRecipesByMember(Model model, @RequestParam("userId")Integer userId) {
		List<RecipeBean> list = service.getRecipesByMember(userId);
		model.addAttribute("recipes", list);
		return "recipe/memberRecipesList";
	}
	
	@GetMapping("/recipes/updateRecipe")
	public String updateRecipe(@RequestParam("no") Integer recipeNo, Model model) {
		RecipeBean rb = new RecipeBean();
		model.addAttribute("recipeBean", rb);
		model.addAttribute("recipe", service.getRecipeByRecipeNo(recipeNo));
		return "recipe/updateRecipe";
	}
	
	@PostMapping("/recipes/updateRecipe")
	public String updateRecipe(@ModelAttribute("recipeBean") RecipeBean rb,
			@RequestParam("StepImage") MultipartFile[] stepImg, HttpServletRequest request) {
		MultipartFile coverImg = rb.getRecipeImage();
		if (coverImg != null && !coverImg.isEmpty()) {
			byte[] b;
			try {
				b = coverImg.getBytes();
				Blob blob = new SerialBlob(b);
				rb.setCoverImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		List<Blob> blobList = new ArrayList<>(10);
		if (stepImg != null && stepImg.length > 0) {
			for (int i = 0; i < stepImg.length; i++) {
				byte[] b;
				try {
					b = stepImg[i].getBytes();
					Blob blob = new SerialBlob(b);
					blobList.add(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			}
			rb.setStepPic01(blobList.get(0));
			rb.setStepPic02(blobList.get(1));
			rb.setStepPic03(blobList.get(2));
			rb.setStepPic04(blobList.get(3));
			rb.setStepPic05(blobList.get(4));
			rb.setStepPic06(blobList.get(5));
			rb.setStepPic07(blobList.get(6));
			rb.setStepPic08(blobList.get(7));
			rb.setStepPic09(blobList.get(8));
			rb.setStepPic10(blobList.get(9));
		}
		Date date = new Date();
		System.out.println(date);
		rb.setLastUpdated(date);
		rb.setIngredName(ListToString(rb.getIngredNameList()));
		rb.setIngredQty(ListToString(rb.getIngredQtyList()));
		service.updateRecipe(rb);
		return "redirect:/recipes";
	}
	
	
	@RequestMapping(value = "/getPicture/{recipeNo}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer recipeNo) {
		String filePath = "/WEB-INF/views/images/food1.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
//		String filename = "";
		int len = 0;
		RecipeBean bean = service.getRecipeByRecipeNo(recipeNo);
		if (bean != null) {
			Blob blob = bean.getCoverImg();
//			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("Controller的getPicture()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
//				filename = filePath;
			}
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		String mimeType = context.getMimeType(filePath);
		MediaType mediaType = MediaType.IMAGE_JPEG;
//		System.out.println("mediaType= " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		File file = new File(realPath);
		long size = file.length();
		b = new byte[(int) size];
		InputStream fis = context.getResourceAsStream(filepath);
		try {
			fis.read(b);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	@RequestMapping(value = "/recipes/add", method = RequestMethod.GET)
	public String getAddNewRecipeForm(Model model) {
		RecipeBean rb = new RecipeBean();
		model.addAttribute("recipeBean", rb);
		return "recipe/addRecipe";
	}

	@RequestMapping(value = "/recipes/add", method = RequestMethod.POST)
	public String getAddNewRecipeForm(@ModelAttribute("recipeBean") RecipeBean rb,
			@RequestParam("StepImage") MultipartFile[] stepImg, HttpServletRequest request) {
		MultipartFile coverImg = rb.getRecipeImage();
		if (coverImg != null && !coverImg.isEmpty()) {
			byte[] b;
			try {
				b = coverImg.getBytes();
				Blob blob = new SerialBlob(b);
				rb.setCoverImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		List<Blob> blobList = new ArrayList<>(10);
		if (stepImg != null && stepImg.length > 0) {
			for (int i = 0; i < stepImg.length; i++) {
				byte[] b;
				try {
					b = stepImg[i].getBytes();
					Blob blob = new SerialBlob(b);
					blobList.add(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			}
			rb.setStepPic01(blobList.get(0));
			rb.setStepPic02(blobList.get(1));
			rb.setStepPic03(blobList.get(2));
			rb.setStepPic04(blobList.get(3));
			rb.setStepPic05(blobList.get(4));
			rb.setStepPic06(blobList.get(5));
			rb.setStepPic07(blobList.get(6));
			rb.setStepPic08(blobList.get(7));
			rb.setStepPic09(blobList.get(8));
			rb.setStepPic10(blobList.get(9));
		}
		Date date = new Date();
		System.out.println(date);
		rb.setLastUpdated(date);
		rb.setIngredName(ListToString(rb.getIngredNameList()));
		rb.setIngredQty(ListToString(rb.getIngredQtyList()));
		System.out.println(rb.getUserId());
		service.addRecipe(rb);
		return "redirect:/recipes";
//		(要處理)如果圖片沒有更改就不用重複儲存
	}

	public String ListToString(String[] list) {
		String str = "";
		for (int i = 0; i < list.length; i++) {
			if (!list[i].equals("") && list[i] != null) {
				if (i == 0) {
					str += list[i];
				} else {
					str += "," + list[i];
				}
			}
		}
		return str;
	}
}
