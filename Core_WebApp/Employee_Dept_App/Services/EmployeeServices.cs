   
using Employee_Dept_App.Models;
using Microsoft.EntityFrameworkCore;

namespace Employee_Dept_App.Services
{
    public class EmployeeServices : IServices<Employee, int>
    {
        public readonly Enterprise1Context context;
        public EmployeeServices(Enterprise1Context context)
        {
            this.context = context;
        }
        async Task<Employee> IServices<Employee, int>.Create(Employee entity)
        {
            var res = await context.Employees.AddAsync(entity);
            await context.SaveChangesAsync();
            return res.Entity;
        }

        async Task<Employee> IServices<Employee, int>.Delete(int id)
        {
            var res=await context.Employees.FindAsync(id);
            if(res==null)
            {
                return null;
            }
            context.Employees.Remove(res);
            await context.SaveChangesAsync();
            return res;

        }

        async Task<IEnumerable<Employee>> IServices<Employee, int>.GetAllAsync()
        {
            var res = await context.Employees.ToListAsync();
            return res;
        }

        async Task<Employee> IServices<Employee, int>.GetByIdAsync(int id)
        {
            var res = await context.Employees.FindAsync(id);
           
            if(res == null)
            {
                return null;
            }
            return res;
        }

        async Task<Employee> IServices<Employee, int>.Update(int id, Employee entity)
        {
            var res=await context.Employees.FindAsync(id);
            if(res!=null)
            {
                 context.Entry(res).CurrentValues.SetValues(entity);
                await context.SaveChangesAsync();
                return res;
            }
            else
            {
                return null;
            }
        }
    }
}
