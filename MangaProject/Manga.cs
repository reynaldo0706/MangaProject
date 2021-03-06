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
    
    public partial class Manga
    {
        public Manga()
        {
            this.Authors = new HashSet<Author>();
            this.Publishers = new HashSet<Publisher>();
            this.Languages = new HashSet<Language>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public System.DateTime PublishDate { get; set; }
        public string Image { get; set; }
        public string Volume { get; set; }
    
        public virtual ICollection<Author> Authors { get; set; }
        public virtual ICollection<Publisher> Publishers { get; set; }
        public virtual ICollection<Language> Languages { get; set; }
    }
}
