using Employee_Dept_App.Models;
using Employee_Dept_App.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Employee_Dept_App.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DeptController : ControllerBase
    {
        private readonly IServices<Department, int> deptServ;
        public DeptController(IServices<Department, int> deptServ)
        {
            this.deptServ = deptServ;
        }

        [HttpGet]
        public async Task<IActionResult> GetData()
        {
            var res=await deptServ.GetAllAsync();
            return Ok(res);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var res=await deptServ.GetByIdAsync(id);
            return Ok(res);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Department dept)
        {
            var res = await deptServ.Create(dept);
            return Ok(res);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Edit(int id,Department dept)
        {
            var res=await deptServ.Update(id, dept);
            return Ok(res);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var res = await deptServ.Delete(id);
            return Ok(res);
        }

    }
}





