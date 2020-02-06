package com.icook.recipe.dao;

import java.util.List;

import com.icook.model.MemberBean;
import com.icook.model.RecipeBean;

public interface RecipeDao {
	List<RecipeBean> getAllRecipes();
	List<RecipeBean> getRecipesByMember(int userId);
	public RecipeBean getRecipeByRecipeNo(int recipeNo);
	
	void addRecipe(RecipeBean recipe);
	void updateRecipe(RecipeBean recipe);
	void deleteRecipe(int recipeNo);
	MemberBean getMemberId(int userId);
	
	
}
