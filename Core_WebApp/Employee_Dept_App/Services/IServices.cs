namespace Employee_Dept_App.Services
{
    public interface IServices<TEntity,in TPK> where TEntity : class
    {
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task<TEntity> GetByIdAsync(TPK id);
        Task<TEntity> Create(TEntity entity);
        Task<TEntity> Update(TPK id,TEntity entity);
        Task<TEntity> Delete(TPK id);
    }
}
