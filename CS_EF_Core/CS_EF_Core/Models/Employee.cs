﻿using System;
using System.Collections.Generic;

namespace CS_EF_Core.Models
{
    public partial class Employee
    {
        public int EmpNo { get; set; }
        public string EmpName { get; set; } = null!;
        public int Salary { get; set; }
        public string Designation { get; set; } = null!;
        public int DeptNo { get; set; }
        public string Email { get; set; } = null!;
        public virtual Department DeptNoNavigation { get; set; } = null!;
    }
}
