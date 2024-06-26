package com.ljj.service;

import com.ljj.pojo.Staff;
import java.util.List;

public interface StaffService {
    List<Staff> list();

    Staff namegetStaff(String staff_name);

    Staff idgeStaff(int staff_id);

    int deleteStaff(int staff_id);

    int addStaff(Staff staff);

    int updateStaff(Staff staff);
}