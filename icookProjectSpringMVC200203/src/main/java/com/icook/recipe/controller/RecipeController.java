package com.icook.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
		model.addAttribute("recipeBean", service.getRecipeByRecipeNo(recipeNo));
		return "recipe/123";
	}
	
	@PostMapping("/recipes/updateRecipe")
	public String updateRecipe(@ModelAttribute("recipeBean") RecipeBean rb,
			@RequestParam("StepImage") MultipartFile[] stepImg, HttpServletRequest request) {
		MultipartFile coverImg = rb.getRecipeImage();
		RecipeBean rb0 = service.getRecipeByRecipeNo(rb.getRecipeNo());
		System.out.println("-------"+coverImg.isEmpty());
		System.out.println("-------"+coverImg);
		//如果沒有上傳圖片，就把舊的圖片撈出來使用
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
		}else {
			rb.setCoverImg(rb0.getCoverImg());
		}
//		把步驟照片從[ ]撈出轉成blob再存到arrayList裡
		List<Blob> blobList = new ArrayList<>(Arrays.asList(null,null,null,null,null,null,null,null,null,null));
		for (int i = 0; i < stepImg.length; i++) {
			if (stepImg[i] != null && !stepImg[i].isEmpty()) {
				byte[] b;
				try {
					b = stepImg[i].getBytes();
					Blob blob = new SerialBlob(b);
					blobList.set(i, blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			}else{
				blobList.set(i, null);
			}
		}
//		如果沒有上傳照片，就把舊的照片拿出來用
		if(blobList.get(0) != null) {
			rb.setStepPic01(blobList.get(0));
		}else {
			rb.setStepPic01(rb0.getStepPic01());
		}
		if(blobList.get(1) != null) {
			rb.setStepPic02(blobList.get(1));
		}else {
			rb.setStepPic02(rb0.getStepPic02());
		}
		if(blobList.get(2) != null) {
			rb.setStepPic03(blobList.get(2));
		}else {
			rb.setStepPic03(rb0.getStepPic03());
		}
		if(blobList.get(3) != null) {
			rb.setStepPic04(blobList.get(3));
		}else {
			rb.setStepPic04(rb0.getStepPic04());
		}
		if(blobList.get(4) != null) {
			rb.setStepPic05(blobList.get(4));
		}else {
			rb.setStepPic05(rb0.getStepPic05());
		}
		if(blobList.get(5) != null) {
			rb.setStepPic06(blobList.get(5));
		}else {
			rb.setStepPic06(rb0.getStepPic06());
		}
		if(blobList.get(6) != null) {
			rb.setStepPic07(blobList.get(6));
		}else {
			rb.setStepPic07(rb0.getStepPic07());
		}
		if(blobList.get(7) != null) {
			rb.setStepPic08(blobList.get(7));
		}else {
			rb.setStepPic08(rb0.getStepPic08());
		}
		if(blobList.get(8) != null) {
			rb.setStepPic09(blobList.get(8));
		}else {
			rb.setStepPic09(rb0.getStepPic09());
		}
		if(blobList.get(9) != null) {
			rb.setStepPic10(blobList.get(9));
		}else {
			rb.setStepPic10(rb0.getStepPic10());
		}
		Date date = new Date();
		System.out.println(date);
		rb.setLastUpdated(date);
//		rb.setIngredName(listToString(rb.getIngredNameList()));
//		rb.setIngredQty(listToString(rb.getIngredQtyList()));
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
//			@RequestParam("ingredNameList") String[] ingredNameList, @RequestParam("ingredQtyList") String[] ingredQtyList,
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
		List<Blob> blobList = new ArrayList<>(Arrays.asList(null,null,null,null,null,null,null,null,null,null));
		for (int i = 0; i < stepImg.length; i++) {
			if (stepImg[i] != null && !stepImg[i].isEmpty()) {
				byte[] b;
				try {
					b = stepImg[i].getBytes();
					Blob blob = new SerialBlob(b);
					blobList.set(i, blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			}else{
				blobList.set(i, null);
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
		Date date = new Date();
		System.out.println(date);
		rb.setLastUpdated(date);
		service.addRecipe(rb);
		return "redirect:/recipes";
	}

//	陣列轉成字串，暫時沒有用到
	public String listToString(String[] list) {
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
	
	@RequestMapping(value="/recipes/deleteRecipe", method=RequestMethod.GET)
	public String deleteRecipe(@RequestParam("no") Integer recipeNo, Model model) {
		RecipeBean rb = service.getRecipeByRecipeNo(recipeNo);
		Integer userId = rb.getUserId();
		model.addAttribute("userId", userId);
		service.deleteRecipe(recipeNo);
		return "redirect:/recipes";
	}
	
	@ModelAttribute("cookingTimeList")
	public List<String> cookingTimeList(){
		List<String> list = new ArrayList<>(Arrays.asList("5","10","15","30","45","60","90","120","180"));
		return list;
	}
	
	@ModelAttribute("servingList")
	public List<String> servingList(){
		List<String> list = new ArrayList<>(Arrays.asList("1","2","3","4","5","6","7","8","9","10"));
		return list;
	}
	
}
