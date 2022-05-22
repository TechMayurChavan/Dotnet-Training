﻿using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplicationNew_Employeee.Models
{
    public partial class Department
    {
        public Department()
        {
            Employees = new HashSet<Employee>();
        }

        public int DeptNo { get; set; }
        public string DeptName { get; set; }
        public string Location { get; set; }
        public int Capacity { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
