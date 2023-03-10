package shop.mtcoding.blog.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
    public List<User> findAll();

    public User findById(int id);

    public int insert(@Param("username") String username, @Param("password") String pssword,
            @Param("email") String email);

    public int updateById(@Param("username") String username, @Param("password") String pssword,
            @Param("email") String email, @Param("id") int id);

    public int deleteById(int id);

    public User findByUsername(String username);
}
