namespace Blazor_App_Category_New.Models
{
    public class Category
    {

        public int CategoryRowId { get; set; }

        public string? CategoryId { get; set; }

        public string? CategoryName { get; set; }

        public int BasePrice { get; set; }

    }
    public class Product
    {
        
        public int ProductRowId { get; set; }
        
        public string? ProductId { get; set; }
       
        public string? ProductName { get; set; }
       
        public string? Description { get; set; }
       
        public int CategoryRowId { get; set; }
        public int Price { get; set; }
    }

}
