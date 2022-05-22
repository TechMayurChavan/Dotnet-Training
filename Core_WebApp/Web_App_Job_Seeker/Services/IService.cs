﻿using System.Collections.Generic;
using System.Threading.Tasks;

namespace Web_App_Job_Seeker.Services
{
    public interface IService<TEntity,in TPk> where TEntity : class
    {
        Task<IEnumerable<TEntity>> GetAsync();
        Task<TEntity> GetByIdAsync(TPk id);
        Task<TEntity> CreateAsync(TEntity entity);
        Task<TEntity> UpdateAsync(TPk id, TEntity entity);
        Task<TEntity> DeleteAsync(TPk id);

    }
}
