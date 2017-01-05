import com.neuedu.bean.User;
import com.neuedu.dao.mapper.UserMapper;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016-12-15.
 */
@ContextConfiguration(locations = "classpath*:spring-core.xml")
public class EvnTest extends AbstractJUnit4SpringContextTests {


    @Resource
    private UserMapper userMapper;
    @Test
    public void TestCheckUser(){
        User user=userMapper.CheckUser("wang");
        Assert.assertTrue(user.getAge()==21);
    }

}
