using System;
using System.Collections.Generic;

namespace Practice
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Employee emp = new Employee();
            int a = 0;
            do
            {
                Console.WriteLine("Enter Employee ID");
                emp.ID = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Employee Name");
                emp.Name = Console.ReadLine();

                List<Employee> emplist = new List<Employee>();
                emplist.Add(emp);
                foreach (var item in emplist)
                {
                    Console.WriteLine($"Employee ID is: {item.ID} and Name is; {item.Name}");
                }
               
                Console.WriteLine("DO u want to perform operations");
                a = Convert.ToInt32(Console.ReadLine());
            } while (a == 1);
         
        }
    }
}
