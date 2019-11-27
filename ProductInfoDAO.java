package com.internousdev.pumpkin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.pumpkin.dto.ProductInfoDTO;
import com.internousdev.pumpkin.util.DBConnector;

public class ProductInfoDAO {

	//商品をすべて取得する場合
	public List<ProductInfoDTO> getProductInfoListAll(){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		List<ProductInfoDTO> productInfoDTOList=new ArrayList<ProductInfoDTO>();

		String sql="select * from product_info";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO productInfoDTO=new ProductInfoDTO();
				productInfoDTO.setId(rs.getInt("id"));
				productInfoDTO.setProductId(rs.getInt("product_id"));
				productInfoDTO.setProductName(rs.getString("product_name"));
				productInfoDTO.setProductNameKana(rs.getString("product_name_kana"));
				productInfoDTO.setProductDescription(rs.getString("product_description"));
				productInfoDTO.setCategoryId(rs.getInt("category_id"));
				productInfoDTO.setPrice(rs.getInt("price"));
				productInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				productInfoDTO.setImageFileName(rs.getString("image_file_name"));
				productInfoDTO.setReleaseDate(rs.getDate("release_date"));
				productInfoDTO.setReleaseCompany(rs.getString("release_company"));
				productInfoDTOList.add(productInfoDTO);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
			con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return productInfoDTOList;
	}

	//商品IDを条件として商品情報を取得する場合
	public ProductInfoDTO getProductInfoByProductId(int productId){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		ProductInfoDTO productInfoDTO=new ProductInfoDTO();

		String sql="select * from product_info where product_id=?";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, productId);
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				productInfoDTO.setId(rs.getInt("id"));
				productInfoDTO.setProductId(rs.getInt("product_id"));
				productInfoDTO.setProductName(rs.getString("product_name"));
				productInfoDTO.setProductNameKana(rs.getString("product_name_kana"));
				productInfoDTO.setProductDescription(rs.getString("product_description"));
				productInfoDTO.setCategoryId(rs.getInt("category_id"));
				productInfoDTO.setPrice(rs.getInt("price"));
				productInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				productInfoDTO.setImageFileName(rs.getString("image_file_name"));
				productInfoDTO.setReleaseDate(rs.getDate("release_date"));
				productInfoDTO.setReleaseCompany(rs.getString("release_company"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return productInfoDTO;
	}
	//関連商品を取得する場合
	/**
	 * @param categoryId カテゴリーID
	 * @param productId　商品ID
	 * @param limitOffset　データを取得する開始位置
	 * @param limitRowCount　データ取得件数
	 * @return　関連商品情報
	 */
	public List<ProductInfoDTO> getRelatedProductList(int categoryId, int productId, int limitOffset, int limitRowCount){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		List<ProductInfoDTO> productInfoDTOList=new ArrayList<ProductInfoDTO>();

		String sql="select * from product_info where category_id=? and product_id not in(?) order by rand() limit ?,?";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ps.setInt(2, productId);
			ps.setInt(3, limitOffset);
			ps.setInt(4, limitRowCount);
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO productInfoDTO=new ProductInfoDTO();
				productInfoDTO.setId(rs.getInt("id"));
				productInfoDTO.setProductId(rs.getInt("product_id"));
				productInfoDTO.setProductName(rs.getString("product_name"));
				productInfoDTO.setProductNameKana(rs.getString("product_name_kana"));
				productInfoDTO.setProductDescription(rs.getString("product_description"));
				productInfoDTO.setCategoryId(rs.getInt("category_id"));
				productInfoDTO.setPrice(rs.getInt("price"));
				productInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				productInfoDTO.setImageFileName(rs.getString("image_file_name"));
				productInfoDTO.setReleaseDate(rs.getDate("release_date"));
				productInfoDTO.setReleaseCompany(rs.getString("release_company"));
				productInfoDTOList.add(productInfoDTO);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return productInfoDTOList;
	}

	//キーワードで商品情報を取得する場合
	public List<ProductInfoDTO> getProductInfoListByKeyword(String[] keywordsList){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		List<ProductInfoDTO> productInfoDTOList=new ArrayList<ProductInfoDTO>();

		String sql="select * from product_info";

		boolean initializeFlag = true;

		if(!keywordsList[0].equals("")){

			for(String keyword:keywordsList){
				if(initializeFlag){
					sql +=" where (product_name like '%" + keyword + "%' or product_name_kana like '%" + keyword + "%')";
					initializeFlag=false;
				}else{
					sql += " or (product_name like '%" + keyword + "%' or product_name_kana like '%" + keyword + "%')";
				}

			}
		}
		sql += " order by product_id asc";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				ProductInfoDTO productInfoDTO=new ProductInfoDTO();
				productInfoDTO.setId(rs.getInt("id"));
				productInfoDTO.setProductId(rs.getInt("product_id"));
				productInfoDTO.setProductName(rs.getString("product_name"));
				productInfoDTO.setProductNameKana(rs.getString("product_name_kana"));
				productInfoDTO.setProductDescription(rs.getString("product_description"));
				productInfoDTO.setCategoryId(rs.getInt("category_id"));
				productInfoDTO.setPrice(rs.getInt("price"));
				productInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				productInfoDTO.setImageFileName(rs.getString("image_file_name"));
				productInfoDTO.setReleaseDate(rs.getDate("release_date"));
				productInfoDTO.setReleaseCompany(rs.getString("release_company"));
				productInfoDTOList.add(productInfoDTO);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return productInfoDTOList;
	}

	//カテゴリーIDとキーワードを条件に商品情報を取得する
	public List<ProductInfoDTO> getProductInfoListByCategoryIdAndKeyword(String categoryId, String[] keywordsList){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		List<ProductInfoDTO> productInfoDTOList=new ArrayList<ProductInfoDTO>();

		String sql="select * from product_info where category_id=" +categoryId;

		boolean initializeFlag=true;

		if(!keywordsList[0].equals("")){
			for(String keyword:keywordsList){
				if(initializeFlag){
					sql +=" and ((product_name like '%" + keyword + "%' or product_name_kana like '%" + keyword + "%')";

					initializeFlag=false;
				}else{
					sql +=" or (product_name like '%" + keyword + "%' or product_name_kana like '%" + keyword + "%')";

				}
			}
			sql +=")";
		}
		sql += " order by product_id asc";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO productInfoDTO=new ProductInfoDTO();
				productInfoDTO.setId(rs.getInt("id"));
				productInfoDTO.setProductId(rs.getInt("product_id"));
				productInfoDTO.setProductName(rs.getString("product_name"));
				productInfoDTO.setProductNameKana(rs.getString("product_name_kana"));
				productInfoDTO.setProductDescription(rs.getString("product_description"));
				productInfoDTO.setCategoryId(rs.getInt("category_id"));
				productInfoDTO.setPrice(rs.getInt("price"));
				productInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				productInfoDTO.setImageFileName(rs.getString("image_file_name"));
				productInfoDTO.setReleaseDate(rs.getDate("release_date"));
				productInfoDTO.setReleaseCompany(rs.getString("release_company"));
				productInfoDTOList.add(productInfoDTO);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return productInfoDTOList;
	}

}
