package jPlay.rating.dao;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ratingMapper")
public interface RatingMapper {

    public void insertRating(@Param("memberIdx")String memberIdx, @Param("movieIdx") String movieIdx, @Param("rating")int mulScore) throws Exception;

    public void updateRating(@Param("memberIdx")String memberIdx, @Param("movieIdx") String movieIdx, @Param("rating")int mulScore) throws Exception;

    public boolean selectRating(@Param("memberIdx")String memberIdx, @Param("movieIdx")String movieIdx) throws Exception;

}
