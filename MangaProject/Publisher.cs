//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MangaProject
{
    using System;
    using System.Collections.Generic;
    
    public partial class Publisher
    {
        public Publisher()
        {
            this.Mangas = new HashSet<Manga>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
    
        public virtual ICollection<Manga> Mangas { get; set; }
        public virtual Country Country { get; set; }
    }
}
