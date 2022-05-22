using Employee_Dept_App.Models;
using Employee_Dept_App.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Employee_Dept_App.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IServices<Employee, int> empservice;
        public EmployeeController(IServices<Employee, int> empservice)
        {
            this.empservice = empservice;
        }

        [HttpGet]
        public async Task<IActionResult> GetData()
        {
            var res=await empservice.GetAllAsync();
            return Ok(res);
        }

        [HttpGet("{name}")]
        public async Task<IActionResult> Get(string name)
        {
            var res =  empservice.GetAllAsync().Result.Where(e => e.EmpName==name).ToList();
            if(res.Count==0)
            {
                return BadRequest("Record Not Found");
            }
            else
            {
                return Ok(res);
            }
            
        }

        [HttpPost]
        public async Task<IActionResult> Create(Employee emp)
        {
            var res = await empservice.Create(emp);
            return Ok(res);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Edit(int id,Employee emp)
        {

            var res=await empservice.Update(id, emp);
            if(res==null)
            {
                return BadRequest("Record not Found");
            }
            else
            {
                return Ok(res);
            }
          
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var res= await empservice.Delete(id);
            return Ok(res);
        }

    }
}







