﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace wab2018
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class wapEntities : DbContext
    {
        public wapEntities()
            : base("name=wapEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<glo_specjalizacje> glo_specjalizacje { get; set; }
        public DbSet<tbl_osoby> tbl_osoby { get; set; }
        public DbSet<tbl_skargi> tbl_skargi { get; set; }
        public DbSet<glo_grupy_specjalizacji> glo_grupy_specjalizacji { get; set; }
    }
}