using System;
using System.Collections.Generic;
using System.Linq;

namespace Practice_Linq
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Employees emps=new Employees();
            Console.WriteLine("Hello World!");
            Console.WriteLine("Enter DeptName");
            string deptName=Console.ReadLine();

            if(deptName != "IT"&& deptName != "HR"&& deptName != "SL")
            {
                Console.WriteLine("Please Enter proper DeptName");
            }
            var ListbyDeptname=emps.FindAll(e=>e.DeptName== deptName && e.Salary>10000);
            foreach(var emp in ListbyDeptname)
            {
                Console.WriteLine($"{emp.Id} {emp.Name}");
            }
            Console.WriteLine("-------------------------------------------------");
            var empnames=emps.OrderBy(e => e.Name);
            foreach(var emp in empnames)
            {
                Console.WriteLine($"{emp.Id} {emp.Name}");
            }
            Console.WriteLine("-----------------------------------------------");
            var empsnames=emps.OrderByDescending(e => e.Name);
            foreach(var emp in empsnames)
            {
                Console.WriteLine($"{emp.Id} {emp.Name}");
            }
            Console.WriteLine("--------------------------------------------------");
            var OrderBySalalry = emps.GroupBy(e => e.DeptName);
            foreach(var emp in OrderBySalalry)
            {
                var names = emps.Sum(e => e.Salary);
                Console.WriteLine($"{emp.Key}\n {names}");
            }
            Console.WriteLine("---------------------------------------------------");

            //Max salary per department
            var Maxsalary = emps.OrderBy(e => e.Salary).GroupBy(e => e.DeptName).Select(e => e.Take(1));
            foreach(var emp in Maxsalary)
            {
                var empname = emps.OrderBy(e => e.Name);
                Console.WriteLine($"{empname}");
            }

        }
    }

    public class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DeptName { get; set; }
        public int Salary { get; set; }
    }

    public class Employees : List<Employee>
    {
        public Employees()
        {
            Add(new Employee() { Id = 101, Name = "Mayur", DeptName = "IT", Salary = 10000 });
            Add(new Employee() { Id = 102, Name = "Mandar", DeptName = "HR", Salary = 11000 });
            Add(new Employee() { Id = 103, Name = "Karan", DeptName = "SL", Salary = 20000 });
            Add(new Employee() { Id = 104, Name = "Vishwa", DeptName = "HR", Salary = 12000 });
            Add(new Employee() { Id = 105, Name = "Ram", DeptName = "IT", Salary = 15000 });
            Add(new Employee() { Id = 105, Name = "Laxman", DeptName = "IT", Salary = 15000 });

        }
    }
}
