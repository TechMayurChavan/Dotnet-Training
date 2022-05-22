using Employee_Dept_App.Models;
using Microsoft.EntityFrameworkCore;

namespace Employee_Dept_App.Services
{
    public class DeptService : IServices<Department, int>
    {
        private readonly Enterprise1Context context;
        public DeptService(Enterprise1Context context)
        {
            this.context = context;
        }
    
        async Task<Department> IServices<Department, int>.Create(Department entity)
        {
            var res = await context.Departments.AddAsync(entity);
            await context.SaveChangesAsync();
            return res.Entity;
        }

        async Task<Department> IServices<Department, int>.Delete(int id)
        {
            var res=await context.Departments.FindAsync(id);
            if(res == null)
            {
                return null;
            }
            context.Departments.Remove(res);
            await context.SaveChangesAsync();
            return res;
        }

        async Task<IEnumerable<Department>> IServices<Department, int>.GetAllAsync()
        {
            var res = await context.Departments.ToListAsync();
            return res;
        }

       async Task<Department> IServices<Department, int>.GetByIdAsync(int id)
        {
            var res= await context.Departments.FindAsync(id);
            if(res==null)
            {
                return null;
            }
            return res;
        }

        async Task<Department> IServices<Department, int>.Update(int id, Department entity)
        {
            var res = await context.Departments.FindAsync(id);
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
