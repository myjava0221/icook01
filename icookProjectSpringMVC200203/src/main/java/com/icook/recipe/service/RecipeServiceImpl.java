package com.icook.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.model.MemberBean;
import com.icook.model.RecipeBean;
import com.icook.recipe.dao.RecipeDao;

@Service
@Transactional
public class RecipeServiceImpl implements RecipeService {

	RecipeDao dao;
	
	@Autowired
	public void setDao(RecipeDao dao) {
		this.dao=dao;
	}
	
	@Override
	public List<RecipeBean> getAllRecipes() {
		return dao.getAllRecipes();
	}

	@Override
	public RecipeBean getRecipeByRecipeNo(int recipeNo) {
		return dao.getRecipeByRecipeNo(recipeNo);
	}

	@Override
	public void addRecipe(RecipeBean recipe) {
		dao.addRecipe(recipe);
	}

	@Override
	public MemberBean getMemberId(int userId) {
		return dao.getMemberId(userId);
	}

	@Override
	public void updateRecipe(RecipeBean recipe) {
		dao.updateRecipe(recipe);
	}

	@Override
	public List<RecipeBean> getRecipesByMember(int userId) {
		return dao.getRecipesByMember(userId);
	}

	@Override
	public void deleteRecipe(int recipeNo) {
		dao.deleteRecipe(recipeNo);
	}

}
