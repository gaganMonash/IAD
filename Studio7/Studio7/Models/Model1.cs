namespace Studio7.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Studio7_Model1")
        {
        }

        public virtual DbSet<Unit> Units { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
        
        public System.Data.Entity.DbSet<Studio7.Models.Student> Students { get; set; }
    }
}
