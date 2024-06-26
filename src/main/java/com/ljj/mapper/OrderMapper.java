package com.ljj.mapper;

import java.util.List;
import com.ljj.pojo.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper {
    List<Order>listOrder();

    Order idgetOrder(int order_id);

    int completeOrder(int order_id);

    int addOrder(Order order);

    List<Order> usergetOrder(int user_id);

    int deleteold();
}
