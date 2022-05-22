using System;
using System.Collections.Generic;

namespace Practice_2
{
    internal class Program
    {
        static void Main(string[] args)
        {
        

            static Employee Get(Employee emp)
            {
                List<Employee> emps = new List<Employee>();
                Employee employee = new Employee();
                Console.WriteLine("Enter Id");
                employee.Id=Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Name");
                employee.Name=Console.ReadLine();
                Console.WriteLine("Enter salary");
                employee.salary=Convert.ToInt32(Console.ReadLine());
                emps.Add(employee);
                return employee;
            }
           

        }
    }
}
